package jsp.file.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jsp.file.model.service.FileService;
import jsp.file.model.vo.FileVo;
import jsp.member.model.vo.MemberVo;

@WebServlet(name = "FileUpload", urlPatterns = { "/upload" })
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileUploadServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 세션 확인
		HttpSession session = request.getSession(false);

		if (session != null) {
			// 1. 사용자 계정명(업로드 한 사람 정보)
			String userId = ((MemberVo) session.getAttribute("user")).getUserId();

			// 2. 최대 업로드 파일 사이즈
			int fileSizeLimit = 1024 * 1024 * 5; // Byte 단위 (5mb)

			// 3. 파일 업로드 될 경로
			String uploadFilePath = getServletContext().getRealPath("/") + "UploadFiles"; // WebContent 폴더

			// 4. 인코딩 타입
			String encType = "utf-8";

			// 5. MultipartRequest 객체 생성
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, fileSizeLimit, encType,
					new DefaultFileRenamePolicy());

			// 마지막 인자 값인 DefaultFileRenamePolicy 객체를 생성하여
			// 넣어줌으로써 파일 중복 처리 자동으로 해결함
			// ex) a.bmp가 중복으로 업로드 되면 a1.bmp, a2.bmp, a3.btm...
			// MultipartRequest 객체가 생성되면 자동으로 파일은 해당 경로로 업로드 됨

			// 업로드 된 파일의 정보를 DB에 기록하여야 함

			// 1. 파일 이름 (fileName)
			// getFilesystemName("view의 파라미터 이름"); 을 하게 되면
			// 해당 업로드 될 때의 파일 이름을 가져옴

			String fileName = multi.getFilesystemName("upfile");

			// 2. 업로드 파일의 실제 총 경로(filePath)
			// 총 경로 : filePath + 파일이름
			// ex) 업로드한 파일이 a.txt
			// - > 총 경로 :
			// C:\\Users\\user1\Documents\\webworkspace\\web2\\WebContent\\UploadFiles\\a.txt

			String fullFilePath = uploadFilePath + "\\" + fileName;

			// 3. 파일의 길이 - 크기 (length)

			File file = new File(fullFilePath); // 해당 파일을 오픈
			long fileSize = file.length();

			System.out.println(fullFilePath);
			System.out.println(fileSize);

			// 4. 파일 유저명
			// 만들 필요없음 (위에서 userId 변수를 만들어 놓았음)

			// 5. 파일 업로드된 타임 (밀리세컨)
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
			Timestamp uploadTime = null;
			uploadTime = Timestamp.valueOf(sdf.format(Calendar.getInstance().getTimeInMillis()));

			FileVo fv = new FileVo();
			fv.setFileName(fileName);
			fv.setFilePath(fullFilePath);
			fv.setFileSize(fileSize);
			fv.setFileUser(userId);
			fv.setUpload(uploadTime);

			int result = new FileService().uploadFile(fv);
			
			if(result > 0) {
				response.sendRedirect("/Views/upload/fileUploadSuccess.jsp");
			} else {
				response.sendRedirect("/Views/error/fileUploadError.jsp");
			}
			

		} else {
			response.sendRedirect("/Views/error/error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
