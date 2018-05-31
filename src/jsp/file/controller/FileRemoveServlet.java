package jsp.file.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.file.model.service.FileService;
import jsp.file.model.vo.FileVo;
import jsp.member.model.vo.MemberVo;

@WebServlet(name = "FileRemove", urlPatterns = { "/fileRemove" })
public class FileRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileRemoveServlet() {
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
			FileVo fv = new FileService().fileDownLoad(fileName, uploadTime);
			if (fv != null) {
				int result = new FileService().fileDelete(fv.getFilePath());

				if (result > 0) {
					File file = new File(fv.getFilePath());
					file.delete();
					response.sendRedirect("/fileList");
				} else {
					response.sendRedirect("/Views/error/error.jsp");
				}

				/*
				 * String encFileName = new String(fv.getFileName().getBytes(), "ISO-8859-1");
				 * 
				 * response.setContentType("application/octet-stream");
				 * response.setContentLengthLong(file.length());
				 * response.setHeader("Content-Disposition", "acttachment;filename=" +
				 * encFileName);
				 * 
				 * 
				 * FileInputStream fis = new FileInputStream(file);
				 * 
				 * 
				 * ServletOutputStream sos = response.getOutputStream();
				 * 
				 * byte[] outputByte = new byte[4096];
				 * 
				 * while (fis.read(outputByte, 0, 4096) != -1) { sos.write(outputByte, 0, 4096);
				 * }
				 * 
				 * fis.close(); sos.close();
				 */

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
