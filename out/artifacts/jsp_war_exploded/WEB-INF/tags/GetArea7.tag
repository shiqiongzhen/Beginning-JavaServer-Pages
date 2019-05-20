<%@tag import="java.util.*" %>
<%@attribute name="a" required="true" %>
<%@attribute name="b" required="true" %>
<%@attribute name="c" required="true" %>
<%@variable name-given="area" variable-class="java.lang.Double" scope="AT_END"%>
<%
    if(a!=null&&b!=null&&c!=null){
        double numberA=Double.parseDouble(a);
        double numberB=Double.parseDouble(b);
        double numberC=Double.parseDouble(c);
        if(numberA+numberB>numberC&&numberB+numberC>numberA&&numberA+numberC>numberB){
            double p=(numberA+numberB+numberC)/2.0;
            double area=Math.sqrt(p*(p-numberA)*(p-numberB)*(p-numberC));
            if(a!=null&&b!=null&&c!=null){
                jspContext.setAttribute("area",new Double(area));
            }
        }
    }
%>