package TestingSystem_Assignment_1;

import java.util.Arrays;
import java.util.Date;

public class Group {
	int id;
	String name;
	Account creator;
	Date createDate;
	Account[] accounts;
	@Override
	public String toString() {
		return "Group [id=" + id + ", name=" + name + ", creator=" + creator + ", createDate=" + createDate
				+ ", accounts=" + Arrays.toString(accounts) + "]";
	}
}
