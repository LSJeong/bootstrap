package co.lsj.bootstrap.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FileDownLoad")
public class FileDownLoad extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FileDownLoad() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String ofileName = request.getParameter("ofileName"); //파일명
		String pfileName = request.getParameter("pfileName"); //물리파일명
		
		//파일다운로드 로직 작성
		InputStream in = null;
		OutputStream out = null;
		File file = null;
		
		try {
			file = new File(pfileName); //실제 다운로드할 파일(물리위치에서 파일을 선택하고)
			in = new FileInputStream(file); //inputStream으로 file을 읽음
			
			ofileName = new String(ofileName.getBytes("utf-8"),"ISO-8859-1"); //한글 파일명 처리
			response.setHeader("Content-Disposition", "attachment;filename=" +  ofileName);
			out = response.getOutputStream(); //response 객체로 초기화
			byte b[] = new byte[(int)file.length()]; //버퍼만들고 파일을 담음
			int leng = 0;
			while((leng = in.read(b)) > 0) { //실제 다운로드 함
				out.write(b,0,leng);
			}
			
			in.close();  //반드시 닫아 준다
			out.flush();
			out.close(); //반드시 닫아 준다
			request.setAttribute("message", "파일이 성공적으로 다운로드 되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
