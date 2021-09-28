package TestingSystem_Assignment_1;

import java.time.LocalDate;
import java.util.Arrays;

public class Exam {
	int id;
	String code;
	String title;
	CategoryQuestion category;
	int duration;
	Account creator;
	LocalDate createDate;
	Question[] questions;
	@Override
	public String toString() {
		return "Exam [id=" + id + ", code=" + code + ", title=" + title + ", category=" + category + ", duration="
				+ duration + ", creator=" + creator + ", createDate=" + createDate + ", questions="
				+ Arrays.toString(questions) + "]";
	}
	
}
