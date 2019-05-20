package com.web.demo;

import com.sun.rowset.CachedRowSetImpl;
import com.web.demo.utils.JdbcUtils;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class MessBoard {
    String name,title,content;
    StringBuffer allMessage;
    ArrayList<String> savedName,savedTitle,savedContent,savedTime;
    int pageSize=10;
    int pageAllCount=0;
    int showPage=1;
    StringBuffer presentPageResult;
    CachedRowSetImpl rowSet;
    String tableName="messboard";
    String 字段[]=new String[100] ;
    int 字段个数=0;
    public MessBoard(){
        presentPageResult=new StringBuffer();
//        savedName= new ArrayList<String>();
//        savedTitle= new ArrayList<String>();
//        savedContent= new ArrayList<String>();
//        savedTime= new ArrayList<String>();
    }
    public void setPageSize(int size){
        pageSize=size;
        字段个数=0;
        try{
            Connection con = JdbcUtils.getConnection();
            DatabaseMetaData metadata=con.getMetaData();
            ResultSet rs1=metadata.getColumns(null,null,tableName,null);
            int k=0;
            while(rs1.next()){
                字段个数++;
                字段[k]=rs1.getString(4);
                k++;
            }
            Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ResultSet rs=sql.executeQuery("SELECT * FROM "+tableName);
            rowSet=new CachedRowSetImpl();
            rowSet.populate(rs);
            con.close();
            rowSet.last();
            int m=rowSet.getRow();
            int n=pageSize;
            pageAllCount=((m%n)==0)?(m/n):(m/n+1);
        }
        catch(Exception exp){}
    }
    public int getPageSize(){
        return pageSize;
    }
    public int getPageAllCount(){
        return pageAllCount;
    }
    public void setShowPage(int n){
        showPage=n;
    }
    public int getShowPage(){
        return showPage;
    }
    public StringBuffer getPresentPageResult(){
        if(showPage>pageAllCount)
            showPage=1;
        if(showPage<=0)
            showPage=pageAllCount;
        presentPageResult=show(showPage);
        return presentPageResult;
    }
    public StringBuffer show(int page){
        StringBuffer str=new StringBuffer();
        str.append("<table border=1>");
        str.append("<tr>");
        for(int i=0;i<字段个数;i++)
            str.append("<th>"+字段[i]+"</th>");
        str.append("</tr>");
        try{  rowSet.absolute((page-1)*pageSize+1);
            boolean boo=true;
            for(int i=1;i<=pageSize&&boo;i++){
                str.append("<tr>");
                for(int k=1;k<=字段个数;k++)
                    str.append("<td>"+rowSet.getString(k)+"</td>");
                str.append("</tr>");
                boo=rowSet.next();
            }
        }
        catch(SQLException exp){}
        str.append("</table>");
        return str;
    }
    public void setTableName(String s){
        tableName=s.trim();
    }
    public String getTableName(){
        return tableName;
    }

    public String getName() {
        return name;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public void setPresentPageResult(StringBuffer presentPageResult) {
        this.presentPageResult = presentPageResult;
    }

    public void setName(String s){
        name=s;
    }
    public void setTitle(String t){
       title=t;
    }
    public void setContent(String c){
      content=c;
    }
//    public StringBuffer getAllMessage() {
//        allMessage = new StringBuffer();
//        allMessage.append("<table border=1>");
//        allMessage.append("<tr>");
//        allMessage.append("<th>留言者姓名</th>");
//        allMessage.append("<th>留言标题</th>");
//        allMessage.append("<th>留言时间</th>");
//        allMessage.append("</tr>");
//        for (int k = 0; k < savedName.size(); k++) {
//            allMessage.append("<tr>");
//            allMessage.append("<td>");
//            allMessage.append(savedName.get(k));
//            allMessage.append("</td>");
//            allMessage.append("<td>");
//            allMessage.append(savedTitle.get(k));
//            allMessage.append("</td>");
//            allMessage.append("<td>");
//            allMessage.append("<textarea>");
//            allMessage.append(savedContent.get(k));
//            allMessage.append("</textarea>");
//            allMessage.append("</td>");
//            allMessage.append("<td>");
//            allMessage.append(savedTime.get(k));
//            allMessage.append("</td>");
//            allMessage.append("</tr>");
//        }
//        allMessage.append("</table>");
//        return allMessage;
//    }
}
