<%@page import="org.personal.connectionFactory.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                connection = ConnectionFactory.getConnection();
                String QUERY = "select answer from quiz";
                statement = connection.createStatement();
                rs = statement.executeQuery(QUERY);
                int qno = 0, count = 0;
                while (rs.next()) {
                    if (rs.getString(1).equals(request.getParameter("qno" + (++qno)))) {
                        count++;
        %>
        <h1>Correct </h1>
        <%
        } else {
        %>
        <h1>Incorrect </h1>
        <%
                }
            }
        %>


        <%
            // close all the connections.
            rs.close();
            statement.close();
            connection.close();
        %>
        <h1>Your Score is <%= count %> </h1>
        <%
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
    </body>
</html>
