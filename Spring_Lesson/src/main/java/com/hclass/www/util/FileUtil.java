package com.hclass.www.util;

import java.io.*;
// 파일 업로드에 필요한 기능을 처리하기 위해서 만든 유틸 클래스
public class FileUtil {
	// 파일이름이 중복되면 덮어쓰기가 된다.
	// 따라서 중복된 이름의 파일이 있으면 이름을 바꿔서 저장해야 한다.
	// 중복된 이름의 파일이 존재하면 파일의 이름을 바꾸어주는 함수를 만들자.
	public static String rename(String path, String oldName) {
		// 규칙
		// 		같은 이름의 파일이 존재하면 파일 이름뒤에 (숫자)를 붙여서 처리하도록 하자.
		//	예]	file.jpg 	file(1).jpg 	file(2).jpg
		int count = 0;
		String tmpName = oldName;
		File file = new File(path, oldName);
		while(file.exists()) {
			// 같은 이름의 파일이 존재하는 경우는 이름을 바꿔주자.
			// 그리고 붙일 번호를 증가 시킨다.
			count++;
			
			// .을 기준으로 앞의 문자열과 뒤의 확장자를 분리한다.
			int len = tmpName.lastIndexOf(".");
			String tmp1 = tmpName.substring(0, len);
			String tmp2 = tmpName.substring(len + 1);
			
			// 이제 분리된 것에 필요한 번호를 붙여서 다시 합친다.
			oldName = tmp1 + "_" /*"("*/ + count /*+ ")"*/+ "." + tmp2;
			
			// 그런데 이 파일도 존재하는지 확인해야 하므로
			// 다시 File 객체를 만들어서 확인해야 한다.
			file = new File(path, oldName);
		}
		
		return oldName;
	}
}
