package com.profile; 

public class ProfileBean {
    private String student_id;
    private String student_name;
    private String program;
    private String email;
    private String hobbies; 
    private String self_intro;
    
    public String getStudentId(){
        return student_id; 
    }
    
    public void setStudentId(String student_id){ 
        this.student_id = student_id;
    }
    
    public String getStudentName(){
        return student_name; 
    
    }
    public void setStudentName(String student_name){
        this.student_name = student_name; 
    }
    
    
    
    
    public String getProgram(){ 
        return program; 
    }
    
    
    public void setProgram(String program){ 
        this.program = program; 
    }
    
    
    public String getEmail(){
        return email; 
    }
    public void setEmail(String email){ 
        this.email = email;
    }
    

    public String getHobbies() {
        return hobbies; 
    
    }
    
    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }
    

    public String getIntro(){ 
        return self_intro; 
    }
    
    public void setIntro(String self_intro){ 
        this.self_intro = self_intro; 
    }
    
    
}