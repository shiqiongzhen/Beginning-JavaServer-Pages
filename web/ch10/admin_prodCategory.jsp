<%--
  Created by IntelliJ IDEA.
  User: corrine
  Date: 2019-05-16
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理</title>
    <%@ include file="js.txt" %>
    <meta http-equiv="Content-Type" content="text/html; utf-8">
</head>
<body>
<div id="app">
    <el-container style="height: 100vh; border: 1px solid #eee;">
        <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
            <el-menu :default-openeds="['1','2','3']">
                <el-submenu index="1">
                    <template slot="title"><i class="el-icon-message"></i>用户管理</template>
                    <el-menu-item-group>
                        <el-menu-item index="1-1">
                            <a href="admin_index.jsp">用户列表</a>
                        </el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
                <el-submenu index="2">
                    <template slot="title"><i class="el-icon-menu"></i>产品管理</template>
                    <el-menu-item-group>
                        <el-menu-item index="2-1">
                            <a href="admin_product.jsp">产品列表</a>
                        </el-menu-item>
                        <el-menu-item index="2-2">
                            <a href="admin_prodCategory.jsp">产品分类</a>
                        </el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
                <el-submenu index="3">
                    <template slot="title"><i class="el-icon-setting"></i>订单管理</template>
                    <el-menu-item-group>
                        <el-menu-item index="3-1">
                            <a href="admin_orderlist.jsp">订单列表</a>
                        </el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
            </el-menu>
        </el-aside>

        <el-container>
            <el-header style="text-align: right; font-size: 12px;background: pink;">
                <el-dropdown>
                    <i class="el-icon-setting" style="margin-right: 15px"></i>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item>查看</el-dropdown-item>
                        <el-dropdown-item>新增</el-dropdown-item>
                        <el-dropdown-item>删除</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
                <span>王小虎</span>
            </el-header>

            <el-main>
                <el-form :inline="true" :model="formInline" class="demo-form-inline">
                    <el-form-item>
                        <el-button type="primary" @click="dialogFormVisible = true">添加产品分类</el-button>
                    </el-form-item>
                </el-form>
                <hr/>
                <el-table
                        :data="tableData.filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase()))"
                        style="width: 100%">
                    <el-table-column
                            label="id"
                            prop="id">
                    </el-table-column>
                    <el-table-column
                            label="产品分类名"
                            prop="name">
                    </el-table-column>
                    <el-table-column
                            align="right">
                        <template slot="header" slot-scope="scope">
                            <el-input
                                    v-model="search"
                                    size="mini"
                                    placeholder="输入关键字搜索"/>
                        </template>
                        <template slot-scope="scope">
                            <el-button
                                    size="mini"
                                    @click="handleEdit(scope.$index, scope.row)">更改</el-button>
                            <el-button
                                    size="mini"
                                    type="danger"
                                    @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                        </template>
                    </el-table-column>
                </el-table>
                <el-pagination
                        layout="prev, pager, next"
                        :total="paginations.total"
                        :page-size="paginations.page_size"
                        :current-page.sync="paginations.page_current"
                        @current-change="handleCurrentChange">
                </el-pagination>
            </el-main>
            <el-dialog title="收货地址" :visible.sync="dialogFormVisible">
                <el-form :model="form">
                    <el-form-item label="产品类名" :label-width="formLabelWidth">
                        <el-input v-model="form.name" autocomplete="off"></el-input>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="dialogFormVisible = false">取 消</el-button>
                    <el-button type="primary" @click="add()">确 定</el-button>
                </div>
            </el-dialog>
        </el-container>
    </el-container>
</div>
<script>
    const app = new Vue({
        data: {
            tableData: [],
            search: '',
            formInline: {
                user: '',
                region: ''
            },
            dialogFormVisible: false,
            form: {
                region: '',
                id: '',
                name: ''
            },
            formLabelWidth: '120px',
            paginations: {
                page_current: 1,  // 当前位于哪页
                page_size: 10,   // 1页显示多少条
                total: 100,        // 总数
            }
        },
        created: function () {
            this.handleCurrentChange();
        },
        components: {},
        methods: {
            handleCurrentChange:function(){
                axios.get('/jsp_war_exploded/AdminProdCatalist',{
                    params: {
                        page_current:this.paginations.page_current
                    }
                })
                    .then((response) => {
                        console.log(response.data);
                        this.tableData=response.data[0];
                        this.paginations.total=response.data[1];
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            handleOpen: function(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose: function(key, keyPath) {
                console.log(key, keyPath);
            },
            handleEdit(index, row) {
                console.log(index, row);
            },
            handleDelete(index, row) {
                console.log(index, row);
                axios.get("/jsp_war_exploded/AdminProdCataDel", {
                    params: {
                        id:row.id
                    }
                }).then((res)=>{
                    alert("删除成功！",res)
                    this.handleCurrentChange()
                })
            },
            add() {
                this.dialogFormVisible = false;
                axios.get("/jsp_war_exploded/AdminProdCataAdd", {
                    params: {
                        name:this.form.name
                    }
                }).then((res)=>{
                    console.log(res)
                    if(res.data=="添加成功"){
                        this.handleCurrentChange()
                        this.$message({
                            message: '添加成功:  ' + this.form.name,
                            type: 'success'
                        })
                    }else {
                        this.$message.error('产品分类已存在，请更换！')
                    }

                })
                    .catch(function (error) {
                        this.$message.error('添加失败')
                    });
            }
        }
    }).$mount('#app')
</script>
</body>
</html>
