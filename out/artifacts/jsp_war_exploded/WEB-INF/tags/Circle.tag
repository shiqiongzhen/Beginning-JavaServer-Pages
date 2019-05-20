<%@tag pageEncoding="utf-8" %>
<%@attribute name="number" required="true" %>
<%@variable name-given="CircleArea" variable-class="java.lang.Double" scope="AT_END" %>
<%@variable name-given="CircleMessage" scope="AT_END" %>
<%!
    static double PI = 3.14;
    public double getCircleArea(double a){
        if (a!=0){
            double area =a*a*PI;
            return area;
        }else
            return -1;
    }
%>
<%  try{
    double a=Double.parseDouble(number);
    double result =0;
    result = getCircleArea(a);
    jspContext.setAttribute("CircleArea",new Double(result));
    jspContext.setAttribute("CircleMessage","半径为"+a+"的圆面积为：");
}catch (Exception e){
    jspContext.setAttribute("CircleArea",new Double(-1.0));
    jspContext.setAttribute("CircleMessage",""+e.toString());
}
%>