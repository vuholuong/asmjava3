package utils;

public class IdParser {
	public static int parse(String input) {
		return Integer.valueOf(input.split("-ID:")[1]);
	}
}
