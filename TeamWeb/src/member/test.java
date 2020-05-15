package member;

public class test {

	public static void main(String[] args) {
		int salt=(int)(Math.random()*100000);
		String saltStr=String.format("%06d", salt);
		System.out.print(saltStr);

	}

}
