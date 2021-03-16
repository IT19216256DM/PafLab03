<%@page import="com.item"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
if (request.getParameter("itemCode") != null)
{
	item itemObj = new item();
	String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
	request.getParameter("itemName"),
	request.getParameter("itemPrice"),
	request.getParameter("itemDesc"));
	session.setAttribute("statusMsg", stsMsg);
}

//delete item

if (request.getParameter("itemID") != null)
{
 item itemObj = new item();
 String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
 session.setAttribute("statusMsg", stsMsg);
}


%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Items Management</title>
<link href="Views/bootstrap.min.css" rel="stylesheets"/>
</head>

<body>
<div class="container">
<div class="row">
<div class="col">
	<h1>Items Management</h1>
   
	<form method="post" action="items.jsp">
	Item code: <input name="itemCode" type="text" <%if(request.getParameter("btnUpdate") != null){%> 
	              value="<%= session.getAttribute("code") %>" 
	              <% }%>><br> 
	Item name: <input name="itemName" type="text"  <%if(request.getParameter("btnUpdate") != null){%> value="<%= session.getAttribute("name") %>" <%} %>><br>  
	Item price:<input name="itemPrice" type="text"  <%if(request.getParameter("btnUpdate") != null){%> value="<%= session.getAttribute("price") %>" <%} %>><br>  
	Item description: <input name="itemDesc" type="text" <%if(request.getParameter("btnUpdate") != null){%> value="<%= session.getAttribute("code") %>" <%} %>><br> 
	<input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
	</form>
	<div class ="alert alert-success">	
	
		<%
		out.print(session.getAttribute("statusMsg"));
		%>
	</div>	
	<br>
	<br>
	
	<div class ="alert alert-success">	
		<%
		item itemObj = new item();
		out.print(itemObj.readItems());
		%>
		
	</div>	
		
</div>
</div>
</div>		
</body>
</html>
