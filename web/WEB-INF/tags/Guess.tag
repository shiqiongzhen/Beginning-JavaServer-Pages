<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="number" required="true" %>
<%@ variable name-given="message" scope="AT_END" %>
<%  String mess="";
//    Integer integer=(Integer)session.getAttribute("save");
//    int realnumber=integer.intValue();
    Character integer=(Character)session.getAttribute("save");
    Character realnumber=integer.charValue();
//    int guessNumber=0;
    Character guessNumber='a';
    boolean boo=true;
    try{
//        guessNumber=Integer.parseInt(number);
        guessNumber=number.charAt(0);
    }
    catch(Exception exp){
        boo=false;
    }
    if(boo){
        if(guessNumber==realnumber) {
            int n=((Integer)session.getAttribute("count")).intValue();
            n=n+1;
            session.setAttribute("count",new Integer(n));
            mess="您猜对了,这是第"+n+"次猜测";//+realnumber+":"+guessNumber
        }else if(guessNumber>realnumber){
            int n=((Integer)session.getAttribute("count")).intValue();
            n=n+1;
            session.setAttribute("count",new Integer(n));
            mess="您猜大了,这是第"+n+"次猜测";
        }
        else if(guessNumber<realnumber){
            int n=((Integer)session.getAttribute("count")).intValue();
            n=n+1;
            session.setAttribute("count",new Integer(n));
            mess="您猜小了,这是第"+n+"次猜测";
        }else if(number.equals("你还没开始猜测")){
            mess="你还没开始猜测";
        }
        jspContext.setAttribute("message",mess); //将对象message返回给JSP页面
    }else{
        jspContext.setAttribute("message","请输入您的猜测");
    }
%>