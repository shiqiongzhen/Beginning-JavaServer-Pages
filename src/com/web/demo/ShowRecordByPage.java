package com.web.demo;
import java.sql.*;
import com.sun.rowset.*;
import com.web.demo.utils.JdbcUtils;

public class ShowRecordByPage{
   int pageSize=10;
   int pageAllCount=0;
   int showPage=1;
   StringBuffer presentPageResult;
   CachedRowSetImpl rowSet;
   String tableName="list";
   String 字段[]=new String[100] ;
   int 字段个数=0;
   public ShowRecordByPage(){
      presentPageResult=new StringBuffer();
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
}