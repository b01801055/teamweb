package Control;

import java.io.File;
import java.io.IOException;

public class Test_local_root {

	public static void main(String[] args) throws IOException {
		File currentDirFile = new File(".");
		String helper = currentDirFile.getAbsolutePath();
		String currentDir = helper.substring(0, helper.length() - currentDirFile.getCanonicalPath().length());
		System.out.println(helper);
	}

}
