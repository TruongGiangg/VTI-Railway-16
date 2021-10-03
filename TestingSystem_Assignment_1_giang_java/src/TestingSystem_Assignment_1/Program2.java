package TestingSystem_Assignment_1;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;

public class Program2 {

	public static void main(String[] args) throws ParseException {
		// Create Department
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Sale";

		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Marketting";

		Department department3 = new Department();
		department3.id = 3;
		department3.name = "Service";

		// Create Position
		Position position1 = new Position();
		position1.id = 1;
		position1.name = PositionName.Dev;

		Position position2 = new Position();
		position2.id = 2;
		position2.name = PositionName.PM;
		
		Position position3 = new Position();
		position3.id = 3;
		position3.name = PositionName.Scrum_Master;
		
		// Create Group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Group A";
				
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Group B";
				
		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Group C";
				
		// Create Account
		Account account1 = new Account();
		account1.id = 1;
		account1.email = "nguyenvana@gmail.com";
		account1.userName = "nguyenvana";
		account1.fullName = "Nguyen Van A";
		account1.department = department1;
		account1.position = position1;
		account1.createDate = LocalDate.now();
		account1.groups = new Group[] {group1, group2};
		
		Account account2 = new Account();
		account2.id = 2;
		account2.email = "nguyenvanb@gmail.com";
		account2.userName = "nguyenvanb";
		account2.fullName = "Nguyen Van B";
		account2.department = department2;
		account2.position = position2;
		account2.createDate = LocalDate.now();
		account2.groups = new Group[] {group2, group3};
		
		Account account3 = new Account();
		account3.id = 3;
		account3.email = "nguyenvanc@gmail.com";
		account3.userName = "nguyenvanc";
		account3.fullName = "Nguyen Van C";
		account3.department = department3;
		account3.position = position3;
		account3.createDate = LocalDate.now();
		account3.groups = new Group[] {group2, group3};
		
		// Create TypeQuestion
		TypeQuestion type1 = new TypeQuestion();
		type1.id = 1;
		type1.name = TypeName.Essay;
		
		TypeQuestion type2 = new TypeQuestion();
		type2.id = 2;
		type2.name = TypeName.Multiple_Choice;
		
		// Create CategoryQuestion
		CategoryQuestion category1 = new CategoryQuestion();
		category1.id = 1;
		category1.name = "Java";
		
		CategoryQuestion category2 = new CategoryQuestion();
		category2.id = 2;
		category2.name = "NET";
		
		CategoryQuestion category3 = new CategoryQuestion();
		category3.id = 3;
		category3.name = "SQL";
		
		// Create Question
		Question question1 = new Question();
		question1.id = 1;
		question1.content = "Why learn Java";
		question1.category = category1;
		question1.type = type1;
		question1.creator = account1;
		question1.createDate = LocalDate.now();
		
		Question question2 = new Question();
		question2.id = 2;
		question2.content = "Why learn NET";
		question2.category = category2;
		question2.type = type2;
		question2.creator = account2;
		question2.createDate = LocalDate.now();
		
		Question question3 = new Question();
		question3.id = 3;
		question3.content = "Why learn SQL";
		question3.category = category3;
		question3.type = type1;
		question3.creator = account3;
		question3.createDate = LocalDate.now();
		
		// Create Answer
		Answer answer1 = new Answer();
		answer1.id = 1;
		answer1.content = "answer1";
		answer1.question = question1;
		answer1.isCorrect = true;
		
		Answer answer2 = new Answer();
		answer2.id = 2;
		answer2.content = "answer2";
		answer2.question = question2;
		answer2.isCorrect = true;
		
		Answer answer3 = new Answer();
		answer3.id = 3;
		answer3.content = "answer3";
		answer3.question = question3;
		answer3.isCorrect = false;
		
		// Create Exam
		Exam exam1 = new Exam();
		exam1.id = 1;
		exam1.code = "A01";
		exam1.title = "Test1";
		exam1.category = category1;
		exam1.duration = 60;
		exam1.creator = account1;
		exam1.createDate = LocalDate.now();
		exam1.questions = new Question[] {question1};
		
		Exam exam2 = new Exam();
		exam2.id = 2;
		exam2.code = "A02";
		exam2.title = "Test2";
		exam2.category = category2;
		exam2.duration = 90;
		exam2.creator = account2;
		exam2.createDate = LocalDate.now();
		exam2.questions = new Question[] {question2};
		
		Exam exam3 = new Exam();
		exam3.id = 3;
		exam3.code = "A03";
		exam3.title = "Test3";
		exam3.category = category3;
		exam3.duration = 120;
		exam3.creator = account3;
		exam3.createDate = LocalDate.now();
		exam3.questions = new Question[] {question3};
		
		
		//Exercise 1 (Optional): Flow Control
		//IF	
		//câu 1:
		if(account1.department == null){
			System.out.println("Nhân viên này chưa có phòng ban");
		}else{
			System.out.println("Phòng ban của nhân viên này là "+ account1.department.name);
		}
		
		//câu 2:
		if(account1.groups.length == 0){
			System.out.println("Nhân viên này chưa có trong group");
		} else if(account1.groups.length == 1 || account1.groups.length == 2) {
			System.out.print("Group của nhân viên này là ");
		for (Group group : account1.groups) {
			System.out.println(group.name + " ");
		}}
		else if (account1.groups.length == 3) {
			System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
		}	
		else {
			System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
		}

		//câu 3:
		System.out.println(account1.department == null ? "Nhân viên này chưa có phòng ban" : "Phòng ban của nhân viên này là "+ account1.department.name);
	
		//câu 4:
//		System.out.println(account1.position.name == "Dev" ? "Đây là Developer" : "Người này không phải là Developer");
		
//		//câu 5:
//		int x = group1.accounts.length;
//		switch (x) {
//		case 1:
//			System.out.println("Nhóm có một thành viên");
//			break;
//		case 2:
//			System.out.println("Nhóm có hai thành viên");
//			break;
//		case 3:
//			System.out.println("Nhóm có ba thành viên");
//		default:
//			System.out.println("Nhóm có nhiều thành viên");
//		}
		
		//câu 6:
		int y = account1.groups.length;
		switch (y) {
		case 0:
			System.out.println("Nhân viên này chưa có group");
			break;
		case 1:
			System.out.println("Group của nhân viên này là" + account1.groups[0]);
			break;
		case 2:
			System.out.println("Group của nhân viên này là" + account1.groups[0] + ", " + account1.groups[1]);			
			break;
		case 3:
			System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");		
			break;
		default:
			System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");			
		}
		
		//câu 8:
		Account[] accounts = { account1, account2, account3 };
		for (Account account : accounts) {
			System.out.println("Email: " + account.email);
			System.out.println("FullName: " + account.fullName);
			System.out.println("Name Department: " + account.department.name);
		}
		
		//câu 9: In ra thông tin các phòng ban bao gồm: id và name
		System.out.println("------------câu 9------------");
		Department[] deps = {department1, department2, department3};
		for (Department department : deps) {
			System.out.println("id: " + department.id);
			System.out.println("name: " + department.name);
		}
		
		//câu 10:
		Account[] lsAccount = {account1, account2};
		for (int i = 0; i < lsAccount.length; i++) {
			System.out.println("Thông tin account thứ " + (i+1) + " là  :");
			System.out.println("Email : " + lsAccount[i].email);
			System.out.println("Full name : " + lsAccount[i].email);
			System.out.println("Phòng ban: : " + lsAccount[i].department);
		}
		
		//câu 11: 
		Department[] lsdep = {department1, department2};
		for (int i = 0; i < lsdep.length; i++) {
			System.out.println("Thông tin department thứ " + (i+1) + " là  :");
			System.out.println("Id : " + lsdep[i].id);
			System.out.println("Name : " + lsdep[i].name);
			System.out.println("----------------------");
		}
		
		//câu 12: Chỉ in ra thông tin 2 department đầu tiên theo định dạng như Question 10
		for (int z = 0; z < lsdep.length ; z++) {
			if(z>=2) {
				break;
			}
			System.out.println("Thong tin department thu " + (z + 1) + " la:");
			System.out.println("DeptID: " + lsdep[z].id);
			System.out.println("DeptName: " + lsdep[z].name);
		}
		
		//câu 13: In ra thông tin tất cả các account ngoại trừ account thứ 2
		System.out.println("----------câu 13--------------");
		Department[] deps1 = {department1, department2, department3};
		for (int i = 0; i < deps1.length; i++) {
			if (i != 1) {
				System.out.println("Thông tin department thứ " + (i + 1) + " là :");					
				System.out.println("ID: " + deps1[i].id);
				System.out.println("Name: " + deps1[i].name);
			}
		
		//câu 14: In ra thông tin tất cả các account có id < 4
			System.out.println("----------câu 14--------------");
			for (int j = 0; j < lsAccount.length; j++) {
				if (lsAccount[j].id < 4) {
					System.out.println("------------------------------\n");
					System.out.println(lsAccount[j]);
				}
			}
		
		//câu 15: In ra các số chẵn nhỏ hơn hoặc bằng 20
			System.out.println("----------câu 15--------------");
			for (int i1 = 2; i1 <= 20; i1 = i1 + 2) {
				System.out.println(i1);
			}
		
		//WHILE
		//câu 16: Làm lại các Question ở phần FOR bằng cách sử dụng WHILE kết hợp với lệnh break, continue
		//câu 16.10:
			System.out.println("----------câu 16.10--------------");
			int i1 = 0;
			while (i1 < accounts.length) {
				System.out.println("Thông tin account thứ " + (i1 + 1) + " là :");
				System.out.println("Email: " + accounts[i1].email);
				System.out.println("Fullname: " + accounts[i1].fullName);
				System.out.println("Department: " + accounts[i1].department.name);
				i1++;
			}
		
		//câu 16.11:
			System.out.println("----------câu 16.11--------------");
			Department[] lsdep1 = {department1, department2, department3};
			int i2 = 0;
			while (i2 < lsdep1.length) {
				System.out.println("Thông tin department thứ " + (i2+1) + " là  :");
				System.out.println("Id : " + lsdep1[i2].id);
				System.out.println("Name : " + lsdep1[i2].name);
				i2++;
			}
		
		//Exercise 2 (Optional): System out printf
		//câu 1: Khai báo 1 số nguyên = 5 và sử dụng lệnh System out printf để in ra số nguyên đó
			System.out.println("----------câu 1--------------");
			int a = 5;
			System.out.printf("%d%n", a);
		
		//câu 2: Khai báo 1 số nguyên = 100 000 000 và sử dụng lệnh System out printf để in 
		//       ra số nguyên đó thành định dạng như sau: 100,000,000
			System.out.println("----------câu 2--------------");
			int b = 100000000;
			System.out.printf("%,d%n", b);
		
		//câu 3: Khai báo 1 số thực = 5,567098 và sử dụng lệnh System out printf để in ra số 
		//	     thực đó chỉ bao gồm 4 số đằng sau
			System.out.println("----------câu 3--------------");
			float c = (float) 5.567098;
			System.out.printf("%5.4f%n", c);
			
		//câu 4: Khai báo Họ và tên của 1 học sinh và in ra họ và tên học sinh đó theo định 
		//		 dạng như sau:
		//		 Họ và tên: "Nguyễn Văn A" thì sẽ in ra trên console như sau: 
		//		 Tên tôi là "Nguyễn Văn A" và tôi đang độc thân.
			System.out.println("----------câu 4--------------");
			String hocsinh = "Nguyễn Văn A";
			System.out.println("Tên tôi là : " + hocsinh + " và tôi đang độc thân.");
			
		//câu 5: Lấy thời gian bây giờ và in ra theo định dạng sau:
		//	     24/04/2020 11h:16p:20s 	
			System.out.println("----------câu 5--------------");
			String time = "dd/MM/yyyy HH:mm:ss";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(time);
			String date = simpleDateFormat.format(new Date());
			System.out.println(date);
			
		//câu 6: In ra thông tin account (như Question 8 phần FOREACH) theo định dạng 
		//	     table (giống trong Database)	
			
			
		//Exercise 3 (Optional): Date Format
		//câu 1: In ra thông tin Exam thứ 1 và property create date sẽ được format theo định dạng vietnamese
//			System.out.println("----------câu 1--------------");
//			Locale locale = new Locale("vi", "VN");
//			DateFormat dateformat = DateFormat.getDateInstance(DateFormat.DEFAULT,locale);				
//			String date1 = dateformat.format(account1.createDate);
//			System.out.println(exam1.code + ": " + date1);
			
		//câu 2: In ra thông tin: Exam đã tạo ngày nào theo định dạng Năm – tháng – ngày – giờ – phút – giây
//			System.out.println("----------câu 2--------------");
//			String pattern = "yyyy-MM-dd-HH-mm-ss";
//			SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat(pattern);
//
//			Exam[] exams = { exam1, exam2 };
//			for (Exam exam : exams) {
//				date = simpleDateFormat1.format(exam.createDate);
//				System.out.println(exam.code + ": " + date);
//			}
		
			
		//Exercise 4 (Optional): Random Number 	
		//câu 1: in ra ngẫu nhiên 1 số nguyên
			System.out.println("----------câu 1--------------");
			Random random = new Random();
			int x = random.nextInt();
			System.out.println(x);

		//câu 2: in ra ngẫu nhiên 1 số thực
			System.out.println("----------câu 2--------------");
			float z = random.nextInt();
			System.out.println(z);
		
		//câu 3:Khai báo 1 array bao gồm các tên của các bạn trong lớp, sau đó in ngẫu nhiên 
		//	    ra tên của 1 bạn
			System.out.println("----------câu 3--------------");
			String[] names = { "Truong Giang", "Mai Linh", "Ngoc Minh" };
			int i11 = random.nextInt(names.length);
			System.out.println(names[1]);
			
		//Question 4:
		//Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-1995
			System.out.println("----------câu 4--------------");
			int minDay = (int) LocalDate.of(1995, 7, 24).toEpochDay();
			int maxDay = (int) LocalDate.of(1995, 12, 20).toEpochDay();
			long randomInt = minDay + random.nextInt(maxDay - minDay);
			LocalDate randomDay = LocalDate.ofEpochDay(randomInt);
			System.out.println(randomDay);
		
		//câu 5:Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây
			System.out.println("----------câu 5--------------");
			int now = (int) LocalDate.now().toEpochDay();
			randomInt = now - random.nextInt(365);
			randomDay = LocalDate.ofEpochDay(randomInt);
			System.out.println(randomDay);
			
		//câu 7: Lấy ngẫu nhiên 1 số có 3 chữ số
			System.out.println("----------câu 7--------------");
			int z1 = random.nextInt(999 - 100 + 1) + 100;
			System.out.println(z1);
			
			
		//Exercise 5: Input from console	
		//câu 1: Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình
			System.out.println("----------câu 1--------------");
			Scanner scanner1 = new Scanner(System.in);
			System.out.println("Moi ban nhap vao 3 so nguyen duong ");
			for (int i111 = 0; i111 < 3; i111++) {
				int xx = scanner1.nextInt();
				System.out.println("Ban da nhap: " + xx + "\n");
			}
			
		//câu 2: Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình	
			System.out.println("----------câu 2--------------");
			Scanner scanner2 = new Scanner(System.in);
			System.out.println("Moi ban nhap vao 2 so thuc");
			for (int iiii = 0; iiii < 2; iiii++) {
				double d = scanner2.nextDouble();
				System.out.println("Ban da nhap: " + d + "\n");
			}
			
		//câu 3: Viết lệnh cho phép người dùng nhập họ và tên
			System.out.println("----------câu 3--------------");
			Scanner scanner3 = new Scanner(System.in);
			System.out.println("Moi ban nhap vao ho");
			String s1 = scanner3.next();
			System.out.println("Moi ban nhap vao ten");
			String s2 = scanner3.next();
			System.out.println("Ten ban da nhap: " + s1 + " " + s2 + "\n");
			
//		//câu 4: Viết lệnh cho phép người dùng nhập vào ngày sinh nhật của họ 	
//			
//			System.out.println("Moi nhap vao ngay sinh");
//			String dob = scanner.next();
//			String pattern = "yyyy/MM/dd";
//			SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
//			Date date= dateFormat.parse(dob);
//			System.out.println("Input: " + date1);
		
		//câu 7: Nhập số chẵn từ console
			System.out.println("----------câu 7--------------");
			Scanner scanner4 = new Scanner(System.in);
			System.out.println("Moi ban nhap vao 1 so chan");
			int number = scanner4.nextInt();
			if (number % 2 == 0) {
				System.out.println("Input: " + number);
			} else {
				System.out.println("Nhap sai");
			}
		
		//câu 8: 
		
			
		//Exercise 6 (Optional): Method
		//Question 1: Tạo method để in ra các số chẵn nguyên dương nhỏ hơn 10
			System.out.println("----------câu 1--------------");
			int number1 = 2;
	         
	        System.out.println("Các số nguyên dương nhỏ hơn hoặc bằng 10 là: ");
	        while (number1 <= 10) {
	            System.out.println(number1);
	            number1 += 2;
	        }	
			
		//Question 3: Tạo method để in ra các số nguyên dương nhỏ hơn 10
	        System.out.println("----------câu 3--------------");
	        int number2 = 2;
	         
	        System.out.println("Các số nguyên dương nhỏ hơn hoặc bằng 10 là: ");
	        while (number2 <= 10) {
	            System.out.println(number2);
	            number2 += 1;
	        }	
			
			
}
}

	
}

