package BusanCommunityPack;

import java.io.IOException; 
import java.io.PrintWriter;

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;

//@WebServlet("/BusanCommunityPack/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		SystemMgr sMgr = new SystemMgr();
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		BoardBean upBean = new BoardBean();
		// 빈즈 객체에 요청되는 이름으로 각각 저장
		upBean.setBoardSeq(Integer.parseInt(request.getParameter("boardSeq")));
		upBean.setBoardWriter(request.getParameter("boardWriter"));
		upBean.setBoardTitle(request.getParameter("boardTitle"));
		upBean.setBoardContent(request.getParameter("boardContent"));
		upBean.setBoardIp(request.getParameter("boardIp"));

		String dbId = upBean.getBoardWriter();
		// 세션에 저장했던 작성자(id)
		String inId = bean.getBoardWriter();

		if (dbId.equals(inId)) {
			sMgr.updateBoard(upBean);
			String url = "read.jsp?nowPage=" + nowPage + "&boardSeq=" + upBean.getBoardSeq();
			response.sendRedirect(url);
		} 
	}
}
 