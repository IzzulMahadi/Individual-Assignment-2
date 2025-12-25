package com.profile;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:derby://localhost:1527/StudentProfile";
    private String jdbcUsername = "app";
    private String jdbcPassword = "app";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String studentId = request.getParameter("id");

        if (studentId != null && !studentId.isEmpty()) {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                
                try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
                    String sql = "DELETE FROM student WHERE student_id = ?";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setString(1, studentId);
                    statement.executeUpdate();
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        
        response.sendRedirect(request.getContextPath() + "/viewProfile.jsp");
    }
}