package utils;

public class Validator {
	public static boolean validateFields(String... args) {
		for (String arg : args) {
			if (isNullOrEmpty(arg)) {
				return false;
			}
		}
		return true;
	}

	public static boolean isNullOrEmpty(String value) {
		return value == null || value.trim().isEmpty();
	}
}
