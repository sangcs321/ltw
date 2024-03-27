package util;

import java.security.MessageDigest;

import static java.util.Base64.*;


public class Encrypt {
	public static String toSHA1(String str) {
		String salt = "asjrlkmcoewj@tjle;oxqskjhdjksjf1jurVn&&&";// Làm cho mật khẩu phức tap
		String result = "M@";
		str = str + salt;
		try {
			byte[] dataBytes = str.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result += getEncoder().encodeToString(md.digest(dataBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static void main(String[] args) {
		System.out.println(Encrypt.toSHA1("Minhquan@1"));
	}
}
