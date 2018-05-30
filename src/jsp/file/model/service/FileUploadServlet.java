package jsp.file.model.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

		} else {
			response.sendRedirect("/Views/error/error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
