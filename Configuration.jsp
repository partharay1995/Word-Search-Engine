<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <title>Word Search Engine By Parth</title>
   </head>

   <body>
      <sql:setDataSource 
	  var = "snapshot" 
	  driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver" 
	  url = "jdbc:sqlserver://parth.database.windows.net:1433;database=partha;user=parth@parth;password=Happy1995;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"
      />
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from words where word like '<%= request.getParameter("startwith") %>%';
      </sql:query>
	  
	  <% if(request.getParameter("search") != null) { %>
		  <sql:update dataSource = "${snapshot}" var = "response">
			UPDATE words SET count = count+1 where word like '<%= request.getParameter("word") %>';
		  </sql:update>
		  
		  Your search for '<%= request.getParameter("word") %>' is successful. <a href="javascript:history.back()">Click here to Go Back</a>.
	  <% } %>
	           
	  <c:forEach var = "row" items = "${result.rows}">
		<c:out value = "${row.word}"/>: <c:out value = "${row.count}"/><br/>
	  </c:forEach>

   </body>
</html>