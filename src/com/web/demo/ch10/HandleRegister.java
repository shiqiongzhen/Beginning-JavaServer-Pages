package com.web.demo.ch10;
import com.web.demo.utils.JdbcMobile;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleRegister extends HttpServlet {
    public String handleString(String s)
    {   try{ byte bb[]=s.getBytes("iso-8859-1");
        s=new String(bb);
    }
    catch(Exception ee){}
        return s;
    }
    public  void  doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException {
        Register userBean=new Register();  //创建的Javabean模型
        request.setAttribute("userBean",userBean);
        String logname=request.getParameter("logname").trim();
        String password=request.getParameter("password").trim();
        String again_password=request.getParameter("again_password").trim();
        String phone=request.getParameter("phone").trim();
        String address=request.getParameter("address").trim();
        String realname=request.getParameter("realname").trim();
        if(logname==null)
            logname="";
        if(password==null)
            password="";
        if(!password.equals(again_password)) {
            userBean.setBackNews("两次密码不同，注册失败，");
            RequestDispatcher dispatcher=
                    request.getRequestDispatcher("inputRegisterMess.jsp");
            dispatcher.forward(request, response);//转发
            return;
        }
        boolean isLD=true;
        for(int i=0;i<logname.length();i++){
            char c=logname.charAt(i);
            if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
                isLD=false;
        }
        boolean boo=logname.length()>0&&password.length()>0&&isLD;
        String backNews="";
        try{
            Connection con= JdbcMobile.getConnection();
            String insertCondition="INSERT INTO user VALUES (?,?,?,?,?)";
            PreparedStatement sql=con.prepareStatement(insertCondition);
            if(boo)
            { sql.setString(1,handleString(logname));
                sql.setString(2,handleString(password));
                sql.setString(3,handleString(phone));
                sql.setString(4,handleString(address));
                sql.setString(5,handleString(realname));
                int m=sql.executeUpdate();
                if(m!=0){
                    backNews="注册成功";
                    userBean.setBackNews(backNews);
                    userBean.setLogname(logname);
                    userBean.setPhone(handleString(phone));
                    userBean.setAddress(handleString(address));
                    userBean.setRealname(handleString(realname));
                }
            }
            else {
                backNews="信息填写不完整或名字中有非法字符";
                userBean.setBackNews(backNews);
            }
            con.close();
        }
        catch(SQLException exp){
            backNews="该会员名已被使用，请您更换名字"+exp;
            userBean.setBackNews(backNews);
        }
        RequestDispatcher dispatcher=
                request.getRequestDispatcher("inputRegisterMess.jsp");
        dispatcher.forward(request, response);//转发
    }
    public  void  doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException {
        doPost(request,response);
    }
}
