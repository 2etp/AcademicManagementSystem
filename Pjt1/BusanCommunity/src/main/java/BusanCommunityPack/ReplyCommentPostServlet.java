package BusanCommunityPack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyCommentPostServlet extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		SystemMgr sMgr = new SystemMgr();
		CommentBean reBean = new CommentBean();
		reBean.setCommentWriter(request.getParameter("commentWriter"));
		reBean.setCommentContent(request.getParameter("commentContent"));
		reBean.setCommentRef(Integer.parseInt(request.getParameter("commentRef"))); 
		reBean.setCommentPos(Integer.parseInt(request.getParameter("commentPos"))); 
		reBean.setCommentDepth(Integer.parseInt(request.getParameter("commentDepth"))); 
		reBean.setCommentIp(request.getParameter("commentIp"));

		sMgr.replyUpComment(reBean.getCommentRef(), reBean.getCommentPos());
		sMgr.replyComment(reBean);
		
		String nowPage = request.getParameter("nowPage");
		String boardSeq = request.getParameter("boardSeq");
		response.sendRedirect("read.jsp?nowPage=" + nowPage + "boardSeq=" + boardSeq);
		System.out.println("´ë´ñ±Û ¼·¸£¸´");

	}
	
}
