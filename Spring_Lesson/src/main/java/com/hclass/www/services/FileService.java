package com.hclass.www.services;

import java.util.*;
import java.io.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.multipart.*;

import com.hclass.www.DAO.*;
import com.hclass.www.util.*;

public class FileService {
	@Autowired
	FileDAO fDAO;
	
	// 파일 업로드 처리함수
	public String[] uploadSrvc(MultipartFile[] upfile) {
		/*
		 * 이 함수가 파일을 업로드 하기 위해서는 
		 * 컨트롤러에서 업로드할 파일의 정보를 받아와야 한다.
		 * 
		 * 그런데 우리는 다중 파일 업로드로 할 예정이므로
		 * 
		 * 저장 이름을 기억할 변수를 만들어 놓자.
		 */
		String[] tmp = new String[upfile.length];
		
		String path = "C:\\sh\\Data\\Class\\git\\IncrepasH-Class\\Spring_Lesson\\src\\main\\webapp\\resources\\img";
		for(int i = 0 ; i < upfile.length; i++) {
			// 원본 이름 알아내기
			String oriName = upfile[i].getOriginalFilename();
			// 그런데 만약 이 파일이 업로드 되지 않았다면 작업을 진행할 수 없다.
			// 그 경우는 다음 파일 정보로 넘어가야 한다.
			if(oriName == null || oriName.length() == 0) {
				tmp[i] = "";
				continue;
			}
			
			// rename 규칙 적용해서 저장
			String saveName = FileUtil.rename(path, oriName);
			// 저장 이름이 생겼으므로 파일을 정상 경로에 저장
			// 그리고 저장된 이름으로 데이터베이스에 저장해야되므로 기억해 놓는다.
			tmp[i] = saveName;
			
			try {
				File file = new File(path, saveName);
				upfile[i].transferTo(file);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return tmp;
	}
	
	// 
}
