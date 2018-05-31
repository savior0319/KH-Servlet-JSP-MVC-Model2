package jdbc.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		// 업로드된 파일명을 변경하는 로직
		// ex) 파일명.txt 라고 되어 있다면
		// 시간_랜덤 수.txt로 변경
		// a.txt -> 20180531155428241_69431.txt

		// 1. 시간값을 가져옴
		long currentTimeValue = Calendar.getInstance().getTimeInMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_hhmmssSSS");
		String currentTime = sdf.format(new Date(currentTimeValue));

		// 2. 랜덤 수 가져옴

		int ranNum = new Random().nextInt(1000000); // 0 ~ 9999999의 난수

		String oldFileName = oldFile.getName(); // 기존 파일명
		String ext = null; // 현재 확장자 명 x
		int dot = oldFileName.lastIndexOf(".");
		// lastIndexOf 메소드는 찾으면 index값(위치) 리턴
		// 못 찾았다면 -1을 리턴

		if (dot > -1) {
			ext = oldFileName.substring(dot);
		} else {
			ext = ""; // 확장자가 없다면
		}

		// 4. 위의 정보를 바탕으로 새로운 파일명을 생성
		String newFileName = currentTime + "_" + ranNum + ext;

		File newFile = new File(oldFile.getParent(), newFileName);
		// 파일이 있는 경로

		return newFile;
	}

}
