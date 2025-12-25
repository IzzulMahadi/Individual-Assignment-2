<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile Display</title>
    <link rel="stylesheet" href="css/style.css">
    
        <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #2a2954; /* Light background */
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
}

.container {
    background-color: #15172b;
    padding: 30px 40px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
    color: #ffffff;
  
}

h1 {
    color: white; /* Green primary color */
    text-align: center;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}

.buttonBack{
    align-items: center;
    display: flex;
    justify-content: center;
}

button {
    text-decoration: none;
    width: 150px;
    height: 50px;
    background-color: blue;
    border: 0;
    border-radius: 10px;
}

button a{
    text-decoration: none;
    color: white;
    font-size: 15px;
    font-family: sans-serif;
    font-weight: bold;
}



.intro-box{
    background-color: #1f2136;;
    height: 50px;
    
        margin-bottom: 20px;
        border-radius: 10px;
        padding: 10px;
}

.intro-box p {
    margin: 0;
    white-space: pre-wrap;
}

    
    </style>
 
</head>
<body>
    <div class="container">
        <h1>Submitted Profile Details</h1>
        
        <div class="profile-card">
            <h2>Personal Information</h2>
            
            <div class="detail-row">
                <span class="detail-label">Name:</span> 
                <span>${name}</span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Student ID:</span> 
                <span>${studentId}</span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Program:</span> 
                <span>${program}</span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Email:</span> 
                <span>${email}</span>
            </div>

            <h3>Hobbies</h3>
            <ul class="hobbies-list">
                <c:forEach items="${hobbyList}" var="hobby">
                    <li><c:out value="${hobby}"/></li>
                </c:forEach>
                <c:if test="${empty hobbyList}">
                     <li>No hobbies listed.</li>
                </c:if>
            </ul>
            
            <h3>Self-Introduction</h3>
            <div class="intro-box">
                <p><c:out value="${selfIntro}" escapeXml="false"/></p>
            </div>
        </div>
        
         <div class="buttonBack">
        <button ><a href="index.html">Go Back to Form</a></button>
        </div>
    </div>
</body>
