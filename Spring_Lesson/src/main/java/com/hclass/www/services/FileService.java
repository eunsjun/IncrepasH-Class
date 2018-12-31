package com.hclass.www.services;

import java.util.*;
import java.io.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.multipart.*;

import com.hclass.www.DAO.*;
import com.hclass.www.util.*;
import com.hclass.www.vo.*;

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
		
		int len = upfile.length;
		System.out.println("############### len : " + len);
		String[] tmp = new String[upfile.length];
		
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/Spring_Lesson"));
		path = path + "/Spring_Lesson/webapp/resources/img";
		
/*		String path = "C:\\sh\\Data\\Class\\git\\IncrepasH-Class\\Spring_Lesson\\src\\main\\webapp\\resources\\img"; */
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
			} catch(Exception e) {
				System.out.println("### 파일 에러 ###");
			}
		}
		
		return tmp;
	}
	
	// 파일 정보 등록 처리 함수
	public void insertFileInfo(BoardVO bVO, FileVO fileVO) {
		// 먼저 파일 저장하고 저장이름 반환 받자.
		String[] saveName = uploadSrvc(bVO.getUpfile());
		
		// BoardVO 클래스에 새로 저장된 글 번호가 (max) 저장이 되어 있으므로
		// 그 번호를 가져다 쓰고
		
		// 필요한 데이터
		// bno, oName, sName, len, dir 가 있어야 한다.
		// bno는 bVO 에 max 변수로 게시판데이터 입력할 때 저장을 해 놓았으므로 꺼내서 사용하면 된다.
		fileVO.setBno(bVO.getMax());
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/Spring_Lesson"));
		path = path + "/Spring_Lesson/webapp/resources/img";
		fileVO.setDir(path);
		
		// 원본파일이름과 저장 파일이름이 필요하다.
		for(int i = 0 ; i < saveName.length ; i++) {
			// 한번 반복 할 때 마다 저장정보를 만든다.
			fileVO.setoName(bVO.getUpfile()[i].getOriginalFilename());
			if(fileVO.getoName() == null || fileVO.getoName().length() == 0) {
				continue;
			}
			fileVO.setsName(saveName[i]);
			fileVO.setLen(bVO.getUpfile()[i].getSize());
			
			// 이 줄까지 진행이 됬다는 이야기는 입력할 데이터가 한셋트가 준비가 되었다는 소리이므로
			// 테이블에 입력하면 된다.
			
			fDAO.insertFiBoard(fileVO);
		}
	}
}
