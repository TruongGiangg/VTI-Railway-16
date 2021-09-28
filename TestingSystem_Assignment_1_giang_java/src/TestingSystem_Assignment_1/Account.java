package TestingSystem_Assignment_1;

import java.util.Arrays;
import java.time.LocalDate;

public class Account {
	int id;
	String email;
	String userName;
	String fullName;
	Department department;
	Position position;
	LocalDate createDate;
	Group[] groups;
	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", userName=" + userName + ", fullName=" + fullName
				+ ", department=" + department + ", position=" + position + ", createDate=" + createDate + ", groups="
				+ Arrays.toString(groups) + "]";
	}	
}
