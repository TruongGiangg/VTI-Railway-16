package TestingSystem_Assignment_3;

import java.time.LocalDate;
import java.util.Scanner;

import TestingSystem_Assignment_1.Account;
import TestingSystem_Assignment_1.Department;

public class TestingSystem_Assignment_3 {
//	//Question 1: Khai báo 2 số lương có kiểu dữ liệu là float.
//	Khởi tạo Lương của Account 1 là 5240.5 $
//	Khởi tạo Lương của Account 2 là 10970.055$
//	Khai báo 1 số int để làm tròn Lương của Account 1 và in số int đó ra
//	Khai báo 1 số int để làm tròn Lương của Account 2 và in số int đó ra
	public static void question1() {

		float Salary1;
		float Salary2;

		Salary1 = (float) 5240.5;
		Salary2 = (float) 10970.055;
		System.out.println("Salary1: " + Salary1 + "||  Salary2: " + Salary2);

		int roundSalary1 = (int) Salary1;
		int roundSalary2 = (int) Salary2;
		System.out.println("roundSalary1: " + roundSalary1 + " ||  roundSalary2: " + roundSalary2);
	}
	
//	Question 2:
//		Lấy ngẫu nhiên 1 số có 5 chữ số (những số dưới 5 chữ số thì sẽ thêm
//		có số 0 ở đầu cho đủ 5 chữ số)
	
	// Question 4:
		// Viết 1 method nhập vào 2 số nguyên a và b và trả về thương của chúng
		public static void question4() {
			int a, b;
			Scanner scanner = new Scanner(System.in);
			System.out.println("Nhập a = ");
			a = scanner.nextInt();
			do {
				System.out.println("Nhập b = ");
				b = scanner.nextInt();
				if (b == 0) {
					System.out.println("Vui lòng nhập b khác 0 !");
				}
			} while (b == 0);

			scanner.close();

			System.out.println("Thương: " + (float) a / (float) b);
		}
		public static void main(String[] args) {
//		 	Exercise 2 (Optional): Default value
			//Question 1: Question 1:
//				Không sử dụng data đã insert từ bài trước, tạo 1 array Account và khởi 
//				tạo 5 phần tử theo cú pháp (sử dụng vòng for để khởi tạo):
//				 Email: "Email 1"
//				 Username: "User name 1"
//				 FullName: "Full name 1"
//				 CreateDate: now
				Account[] listaccount = new Account[5];
				for (int i1 = 0; i1 < listaccount.length; i1++) {
					listaccount[i1] = new Account();
					listaccount[i1].email ="Email " + (i1+1);
					listaccount[i1].userName = "User name " + (i1+1);
					listaccount[i1].fullName = "Full name " + (i1+1);
					listaccount[i1].createDate = LocalDate.now();
				} 
				for (int i1 = 0; i1 < listaccount.length; i1++) {
					System.out.println(listaccount[i1].email + " " + listaccount[i1].userName + " " + listaccount[i1].fullName);
				}
				
				
				// Question 1:
				// Khởi tạo lương có datatype là Integer có giá trị bằng 5000.
				// Sau đó convert lương ra float và hiển thị lương lên màn hình (với số
				// float có 2 số sau dấu thập phân)
					Integer salary = 5000;
					System.out.printf("%2.2f", (float) salary);
//					
					
//					Question 2:
//					Khai báo 1 String có value = "1234567"
//					Hãy convert String đó ra số int
					String s1 = "1234567";
					Integer a = Integer.parseInt(s1);
					System.out.println(a);
					
//					Question 3:
//						Khởi tạo 1 số Integer có value là chữ "1234567"
//						Sau đó convert số trên thành datatype int
					Integer a1 = 1234567;
					int b = a1.intValue();
					System.out.println(b);
					
//			Exercise 4: String
//					Question 1:
//						Nhập một xâu kí tự, đếm số lượng các từ trong xâu kí tự đó (các từ có 
//						thể cách nhau bằng nhiều khoảng trắng );
					String s11;
					Scanner scanner = new Scanner(System.in);

					System.out.println("Nhập chuỗi: ");
					s11 = scanner.nextLine();

					String[] words = s11.split(" ");
					System.out.println("Số kí tự: " + words.length);

					scanner.close();
					
//					Question 2: 
//						Nhập hai xâu kí tự s1, s2 nối xâu kí tự s2 vào sau xâu s1;
					Scanner scanner1 = new Scanner(System.in);

					System.out.println("Nhập chuỗi 1: ");
					String s111 = scanner1.nextLine();

					System.out.println("Nhập chuỗi 2: ");
					String s2 = scanner1.nextLine();

					System.out.println("Sau khi nối chuỗi : " + s111.concat(s2));

					scanner1.close();
					
//					Question 3: 
//						Viết chương trình để người dùng nhập vào tên và kiểm tra, nếu tên chư 
//						viết hoa chữ cái đầu thì viết hoa lên
					Scanner scanner11 = new Scanner(System.in);
					String name;

					System.out.println("Nhập Tên: ");
					name = scanner11.nextLine();

					String firstCharacter = name.substring(0, 1).toUpperCase();

					String leftCharacter = name.substring(1);

					name = firstCharacter + leftCharacter;

					System.out.println(name);

					scanner11.close();
		}
					// Question 4:
					// Viết chương trình để người dùng nhập vào tên in từng ký tự trong tên
					// của người dùng ra
					// VD:
					// Người dùng nhập vào "Nam", hệ thống sẽ in ra
					// "Ký tự thứ 1 là: N"
					// "Ký tự thứ 1 là: A"
					// "Ký tự thứ 1 là: M"
					public static void question4_String() {
						String name;
						Scanner scanner = new Scanner(System.in);

						System.out.println("Nhập tên: ");
						name = scanner.nextLine();

						name = name.toUpperCase();

						for (int i = 0; i < name.length(); i++) {
							System.out.println("Ký tự thứ " + i + " là: " + name.charAt(i));
						}

						scanner.close();	
						}	
					
//					Question 5: 
//						Viết chương trình để người dùng nhập vào họ, sau đó yêu cầu người 
//						dùng nhập vào tên và hệ thống sẽ in ra họ và tên đầy đủ
					public static void question5() {
					Scanner scanner = new Scanner(System.in);

					System.out.println("Nhập họ: ");
					String firstName = scanner.nextLine();

					System.out.println("Nhập tên: ");
					String lastName = scanner.nextLine();

					System.out.println("Họ tên đầy đủ: " + firstName.concat(lastName));

					scanner.close();
					}
					
					// Question 7:
					// Viết chương trình yêu cầu người dùng nhập vào họ và tên đầy đủ và
					// chuẩn hóa họ và tên của họ như sau:
					// a) Xóa dấu cách ở đầu và cuối của chuỗi người dùng nhập vào
					// VD: Nếu người dùng nhập vào " nguyễn văn nam " thì sẽ
					// chuẩn hóa thành "nguyễn văn nam"
					// b) Viết hoa chữ cái mỗi từ của người dùng
					// VD: Nếu người dùng nhập vào " nguyễn văn nam " thì sẽ
					// chuẩn hóa thành "Nguyễn Văn Nam"
					@SuppressWarnings({ "unused", "resource" })
					private static void Question7() {
						Scanner scanner = new Scanner(System.in);
						System.out.print("Nhap day du ho ten:");
						String a = scanner.nextLine();
						a = a.trim();
						a = a.toLowerCase();
						String[] b = a.split("\s+");
						String e = "";
						for (String c : b) {
							String d = c.substring(0, 1).toUpperCase() + c.substring(1);
							e = e + d + " ";
						}
						;
						e = e.trim();
						System.out.println(e);
					}
					
					// Question 8:
					// In ra tất cả các group có chứa chữ "Java"
					public static void question8() {
						String[] groupNames = { "Java with Duy Nguyễn", "Cách qua môn java", "Học Java có khó không?" };

						for (String groupName : groupNames) {
							if (groupName.contains("Java")) {
								System.out.println(groupName);
							}
						}
					}
					
//					Question 9:
//						In ra tất cả các group "Java"
					public static void question9() {
						String[] groupNames = { "Java", "C#", "C++" };

						for (String groupName : groupNames) {
							if (groupName.equals("Java")) {
								System.out.println(groupName);
							}
						}
					}
					
					//Object Method
					// Question 1:
					// In ra thông tin của phòng ban thứ 1 (sử dụng toString())
					public static void question1(Department department) {
						System.out.println(department);
					}
					
					// Question 2:
					// In ra thông tin của tất cả phòng ban (sử dụng toString())
					public static void question2(Department[] departments) {
						for (Department department : departments) {
							System.out.println(department);
						}
					}
					
					// Question 3:
					// In ra địa chỉ của phòng ban thứ 1
					public static void question3(Department department) {
						System.out.println(department.hashCode());
					}
					
					// Question 4: Kiểm tra xem phòng ban thứ 1 có tên là "Phòng A" không?
					public static void question4(Department department) {
						if (department.name.equals("Phòng A")) {
							System.out.println("Có tên là phòng A");
						} else {
							System.out.println("Không tên là phòng A");
						}
					}
					
					// Question 5: So sánh 2 phòng ban thứ 1 và phòng ban thứ 2 xem có bằng nhau
					// không (bằng nhau khi tên của 2 phòng ban đó bằng nhau)
					public static void question5(Department department1, Department department2) {
						if (department1.equals(department2)) {
							System.out.println("Có bằng nhau !");
						} else {
							System.out.println("Không bằng nhau !");
						}
					}
}
