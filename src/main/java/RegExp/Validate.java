package RegExp;

import java.util.regex.Pattern;

public class Validate {

	public static String emailRegex(String name,String email,String pass,String rePass) throws Exception {
		String regexName ="(^[\\w]{4,12}$)";
		String regexEmail ="(^[\\w]{3,}@[a-z]+\\.[a-z]+$)";
		String regexPass ="(^(?=\\S*[a-z])(?=\\S*[A-Z])(?=\\S*\\d)(?=\\S*[^\\w\\s])\\S{8,}$)";
		
		if(name.isEmpty() || email.isEmpty() || pass.isEmpty() || rePass.isEmpty()) 
			return "Feilds can not be blank ";
		
		/*Validation of Name*/
		Pattern p1 = Pattern.compile(regexName);
		if(!p1.matcher(name).matches()) 		
			return "Enter valid Name";
		
		/*Validation of email*/
		p1 = Pattern.compile(regexEmail);
		if(!p1.matcher(email).matches()) 		
			return "Enter valid Email with @";
		if(!pass.equals(rePass))
			return "Password Mismatch";
		
		/*Validation of password*/
		p1 = Pattern.compile(regexPass);
		if(!p1.matcher(pass).matches()) 		
			return "Enter valid password with 1 Uppercase 1 Lowercase 1 number and 1 special character";
		
		
			return "Valid";
		
	}
	
}
