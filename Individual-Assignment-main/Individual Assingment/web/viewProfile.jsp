<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
    <title>View All Profiles</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body { background-color: #121420; 
               color: #eee;
               font-family: 'Segoe UI', sans-serif; 
               display: flex;
               flex-direction: column; 
               align-items: center; 
               padding: 50px; 
        }
        
        h1 { border-bottom: 2px solid #08d;
             padding-bottom: 10px;
             margin-bottom: 30px;
        }

        .table-container { 
            background-color: #1c1f33; 
            padding: 20px; 
            border-radius: 15px; 
            width: 90%; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        table { border-collapse: collapse;
                width: 100%; 
                color: white;
        }
        
        th, td { padding: 15px; 
                 border-bottom: 1px solid #303245; 
                 text-align: left;
        }
        
        th { background-color: #08d; 
             color: white; 
             font-weight: 600; 
        }
        
        tr:hover { 
            background-color: #252840;
        }

        .btn { 
            background-color: #08d; 
            padding: 10px 20px; 
            text-decoration: none; 
            color: white; 
            border-radius: 8px; 
            display: inline-block; 
            margin-top: 20px; 
            font-weight: 600;
        }

        .btn-delete {
            background-color: #dc3545;
            padding: 8px 15px;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .btn-delete:hover {
            background-color: #a71d2a; 
        }
    </style>
</head>
<body>

    <sql:setDataSource var="dbSource" 
        driver="org.apache.derby.jdbc.ClientDriver"
        url="jdbc:derby://localhost:1527/StudentProfile"
        user="app"  
        password="app"/>

    <sql:query dataSource="${dbSource}" var="result">
        SELECT * FROM student ORDER BY student_name ASC
    </sql:query>

    <h1>All Student Profiles</h1>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Program</th>
                    <th>Email</th>
                    <th>Hobbies</th>
                    <th>Self Introduction</th>
                    <th>Action</th> </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.student_id}"/></td>
                        <td><c:out value="${row.student_name}"/></td>
                        <td><c:out value="${row.program}"/></td>
                        <td><c:out value="${row.email}"/></td>
                        <td><c:out value="${row.hobbies}"/></td>
                        <td><c:out value="${row.self_intro}"/></td>

                        <td>
                            <a href="delete?id=${row.student_id}" 
                               class="btn-delete"
                               onclick="return confirm('Are you sure you want to delete this student?');">
                               Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${result.rowCount == 0}">
                    <tr>
                        <td colspan="6" style="text-align:center; padding: 20px; color: #a0a3bd;">
                            No profiles found in database.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <br>
    <a href="index.html" class="btn">Register New Student</a>

</body>
</html>