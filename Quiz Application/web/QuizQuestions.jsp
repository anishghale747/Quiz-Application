<%@page import="org.personal.connectionFactory.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Application</title>
    </head>
    <body>
        <%
            try {
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                connection = ConnectionFactory.getConnection();
                String QUERY = "SELECT * from quiz";
                statement = connection.createStatement();
                rs = statement.executeQuery(QUERY);
                int qno = 0;
        %> 
        <form action="ShowResult" method="get">
            <TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
                <%
                    while (rs.next()) {
                        qno++;
                %>
                <tr>
                    <TD><%=rs.getInt(1)%></TD>
                    <TD><%=rs.getString(2)%></TD>
                </tr>
                <tr>
                    <TD><input type="radio" name=" + <%= qno%> + " value=" + <%=rs.getString(3)%> + "></TD><TD><%=rs.getString(3)%></TD>
                </tr>
                <tr>
                    <TD><input type="radio" name=" + <%= qno%> + " value=" + <%=rs.getString(4)%> + "></TD><TD><%=rs.getString(4)%></TD>
                </tr>
                <tr>
                    <TD><input type="radio" name=" + <%= qno%> + " value=" + <%=rs.getString(5)%> + "></TD><TD><%=rs.getString(5)%></TD>
                </tr>
                <tr>
                    <TD><input type="radio" name=" + <%= qno%> + " value=" + <%=rs.getString(6)%> + "></TD><TD><%=rs.getString(6)%></TD>
                </tr>             
                        <% } %>
            </table>
            <input type="reset">
            <input type="submit" value="SUBMIT">
        </form>
        <%
            // close all the connections.
            rs.close();
            statement.close();
            connection.close();
        } catch (Exception ex) {
        %>

        <font size="+3" color="red">
        <%
                out.println("Unable to connect to database.");
            }
        %>
    </font>

</body>
</html>
