package BusanCommunityPack;

import java.io.IOException; 
import java.io.PrintWriter;

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;

@WebServlet("/BusanCommunityPack/boardUpdate")
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
		upBean.setBoardSeq(Integer.parseInt(request.getParameter("board_seq")));
		upBean.setBoardWriter(request.getParameter("board_writer"));
		upBean.setBoardTitle(request.getParameter("board_title"));
		upBean.setBoardContent(request.getParameter("board_content"));
		upBean.setBoardIp(request.getParameter("board_ip"));

		String dbId = upBean.getBoardWriter();
		// 세션에 저장했던 작성자(id)
		String inId = bean.getBoardWriter();

		if (dbId.equals(inId)) {
			sMgr.updateBoard(upBean);
			String url = "read.jsp?nowPage=" + nowPage + "&num=" + upBean.getBoardSeq();
			response.sendRedirect(url);
		} else {
			out.println("<script>");
			out.println("alert('게시물이 수정되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}
 