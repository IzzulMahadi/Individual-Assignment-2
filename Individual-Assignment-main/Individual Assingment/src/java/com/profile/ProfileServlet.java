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

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    private String jdbcURL = "jdbc:derby://localhost:1527/StudentProfile"; 
    private String jdbcUsername = "app";
    private String jdbcPassword = "app";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String selfIntro = request.getParameter("selfIntro");

        ProfileBean newProfile = new ProfileBean();
        newProfile.setStudentName(name);
        newProfile.setStudentId(studentId);
        newProfile.setProgram(program);
        newProfile.setEmail(email);
        newProfile.setHobbies(hobbies);
        newProfile.setIntro(selfIntro);

       
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 

            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
                
                String sql = "INSERT INTO student (student_id, student_name, program, email, hobbies, self_intro) VALUES (?, ?, ?, ?, ?, ?)";
                
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, newProfile.getStudentId());
                statement.setString(2, newProfile.getStudentName());
                statement.setString(3, newProfile.getProgram());
                statement.setString(4, newProfile.getEmail());
                statement.setString(5, newProfile.getHobbies());
                statement.setString(6, newProfile.getIntro());

                statement.executeUpdate();
                
                System.out.println("Data inserted successfully for ID: " + studentId);
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("ERROR SAVING TO DB: " + e.getMessage());
            e.printStackTrace();
        }

        request.setAttribute("name", name);
        request.setAttribute("studentId", studentId);
        request.setAttribute("program", program);
        request.setAttribute("email", email);
        request.setAttribute("selfIntro", selfIntro);
        
        if (hobbies != null && !hobbies.isEmpty()) {
            String[] hobbyArray = hobbies.split(",");
            request.setAttribute("hobbyList", hobbyArray);
        }
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}