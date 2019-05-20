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
</head>
<body>
    <div id="app">
        <el-container style="height: 100vh; border: 1px solid #eee;">
            <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
                <el-menu :default-openeds="['1','2','3']" router>
                    <el-submenu index="1">
                        <template slot="title"><i class="el-icon-message"></i>用户管理</template>
                        <el-menu-item-group>
                            <el-menu-item index="/foo">用户列表</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                    <el-submenu index="2">
                        <template slot="title"><i class="el-icon-menu"></i>产品管理</template>
                        <el-menu-item-group>
                            <el-menu-item index="/bar">产品列表</el-menu-item>
                            <el-menu-item index="2-2">产品分类</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                    <el-submenu index="3">
                        <template slot="title"><i class="el-icon-setting"></i>订单管理</template>
                        <el-menu-item-group>
                            <el-menu-item index="3-1">订单列表</el-menu-item>
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
                    <h1>heihie</h1>
                    <router-view></router-view>
                </el-main>
            </el-container>
        </el-container>
    </div>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script>
        const item = {
            date: '2016-05-02',
            name: '王小虎',
            address: '上海市普陀区金沙江路 1518 弄'
        }
        // 组件注册与路由注册
        var Foo = {}
        const Bar = { template: '<div>bar</div>' }


        const routes = [
            { path: '/foo', component: Foo },
            { path: '/bar', component: Bar }
        ]
        const router = new VueRouter({
            routes // short for `routes: routes`
        })

        const app = new Vue({
            router,
            data: {
                tableData: []
            },
            created: function () {
                this.tableData=Array(20).fill(item);
                // console.log('a is: ' + this.tableData)
                axios.get('loginServlet?logname=corrine&password=corrine')
                    .then(function (response) {
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            components: {},
            methods: {
                handleOpen: function(key, keyPath) {
                    console.log(key, keyPath);
                },
                handleClose: function(key, keyPath) {
                    console.log(key, keyPath);
                }
            }
        }).$mount('#app')
    </script>
</body>
</html>
