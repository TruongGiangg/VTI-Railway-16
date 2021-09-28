package TestingSystem_Assignment_1;

public class Answer {
	int id;
	String content;
	Question question;
	boolean isCorrect;
	@Override
	public String toString() {
		return "Answer [answerID=" + id + ", content=" + content + ", question=" + question + ", isCorrect="
				+ isCorrect + "]";
	}
	
}
