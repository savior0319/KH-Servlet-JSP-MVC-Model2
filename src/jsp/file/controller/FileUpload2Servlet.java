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

import jdbc.common.MyFileRenamePolicy;
import jsp.file.model.service.FileService;
import jsp.file.model.vo.FileVo2;
import jsp.member.model.vo.MemberVo;

@WebServlet(name = "FileUpload2", urlPatterns = { "/upload2" })
public class FileUpload2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileUpload2Servlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session != null) {
			String userId = ((MemberVo) session.getAttribute("user")).getUserId();
			int fileSizeLimit = 1024 * 1024 * 5;
			String uploadFilePath = getServletContext().getRealPath("/") + "UploadFiles";
			String encType = "utf-8";
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, fileSizeLimit, encType,
					new MyFileRenamePolicy());

			// 이름을 변경했기 때문에 바뀌기 전, 바뀐 후의 파일 명을 가져 와야 함

			String beforeFileName = multi.getOriginalFileName("upfile"); // 바뀌기 전 파일 이름
			String afterFileName = multi.getFilesystemName("upfile"); // 바뀐 파일 이름

			String fullFilePath = uploadFilePath + "\\" + afterFileName;

			File file = new File(fullFilePath);
			long fileSize = file.length();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
			Timestamp uploadTime = null;
			uploadTime = Timestamp.valueOf(sdf.format(Calendar.getInstance().getTimeInMillis()));

			FileVo2 fv = new FileVo2();
			fv.setAfterFileName(afterFileName);
			fv.setBeforeFileName(beforeFileName);
			fv.setFilePath(fullFilePath);
			fv.setFileSize(fileSize);
			fv.setFileUser(userId);
			fv.setUploadTime(uploadTime);

			int result = new FileService().uploadFile2(fv);

			if (result > 0) {
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
