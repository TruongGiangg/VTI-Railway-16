package TestingSystem_Assignment_1;

import java.time.LocalDate;

public class Question {
	int id;
	String content;
	CategoryQuestion category;
	TypeQuestion type;
	Account creator;
	LocalDate createDate;
	@Override
	public String toString() {
		return "Question [id=" + id + ", content=" + content + ", category=" + category + ", type=" + type
				+ ", creator=" + creator + ", createDate=" + createDate + "]";
	}
	
}
