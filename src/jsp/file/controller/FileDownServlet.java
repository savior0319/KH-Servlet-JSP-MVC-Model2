package jsp.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.file.model.service.FileService;
import jsp.file.model.vo.FileVo;
import jsp.member.model.vo.MemberVo;

@WebServlet(name = "FileDown", urlPatterns = { "/fileDown" })
public class FileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileDownServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String fileName = request.getParameter("fileName");
		Timestamp uploadTime = Timestamp.valueOf(request.getParameter("uploadTime"));

		HttpSession session = request.getSession(false);
		MemberVo mv = (MemberVo) session.getAttribute("user");

		if (mv != null) {
			// 파일 다운로드를 받기 위하여 DB정보를 받아옴
			FileVo fv = new FileService().fileDownLoad(fileName, uploadTime);

			if (fv != null) {
				// 해당 파일을 열람
				File file = new File(fv.getFilePath());

				// 파일이름을 운영체제(windows)에 맞게 인코딩 해야 함
				String encFileName = new String(fv.getFileName().getBytes(), "ISO-8859-1");

				// 파일의 내용 전송시에는 response 헤더를 변경해주어야 함
				response.setContentType("application/octet-stream");
				response.setContentLengthLong(file.length());
				response.setHeader("Content-Disposition", "acttachment;filename=" + encFileName);

				// 파일의 내용을 읽어와야 전송을 하기 떄문에 내용을 가져 올 수 있는 inputSteam 생성

				FileInputStream fis = new FileInputStream(file);

				// 파일의 내용을 클라이언트한테 전송하기 위함
				// response 객체를 이용하여 outputSteam을 가져옴

				ServletOutputStream sos = response.getOutputStream();

				byte[] outputByte = new byte[4096];

				while (fis.read(outputByte, 0, 4096) != -1) {
					sos.write(outputByte, 0, 4096);
				}
				
				fis.close();
				sos.close();
				
			} else {
				response.sendRedirect("/Views/error/fileDownLoadError.jsp");
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
