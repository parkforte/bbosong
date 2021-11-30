package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.SQLException;

public class HashingUtil {
	private final int SALT_SIZE = 16;
	private final int KEY_STRETCHING_CNT = 10000;
	private final String HASH_ALGORITHM = "SHA-256";
			
	public String makeNewSalt() {
		StringBuffer sb = new StringBuffer();
		SecureRandom rand = new SecureRandom();

		byte[] temp = new byte[SALT_SIZE];
		rand.nextBytes(temp);
		String salt = byteToString(temp);

		return salt;
	}

	public String hashing(String pwd, String salt) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance(HASH_ALGORITHM);
		long start = System.currentTimeMillis();
		
		for(int i=0; i<KEY_STRETCHING_CNT; i++) {
			String temp = pwd + salt;
			md.update(temp.getBytes());
			byte[] digest_ = md.digest();
			pwd = byteToString(digest_);
		}
		
		long end = System.currentTimeMillis();
		System.out.println("Key-stretching time: " + (end-start));
		return pwd;
	}

	private String byteToString(byte[] b) {
		StringBuilder sb = new StringBuilder();
		for (byte bb : b)
			sb.append(String.format("%02x", bb));

		return sb.toString();
	}
}
