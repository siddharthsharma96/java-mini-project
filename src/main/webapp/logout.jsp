<%
response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");//http 1.1
response.setHeader("Progma", "no-cache");//http1.0
response.setHeader("Expires","0");//proxies
	if(session.getAttribute("username")== null){
		response.sendRedirect("login.jsp");}
session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("login.jsp");
%>