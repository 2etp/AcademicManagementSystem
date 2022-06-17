package BusanCommunityPack;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SystemMgr {

	private DBConnectionMgr pool;
	
	// 파일 업로드 기능에 파일이 저장될 폴터 위치임
	private static final String  SAVEFOLDER = "C:/Jsp/myapp/WebContent/fileupload";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 5*1024*1024;

	public SystemMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인
	public boolean loginCheck(String id, String pw) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from tblmember where id = ? and pw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			flag = rs.next();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 회원가입
	public boolean insertMember(MemberBean memberBean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert tblmember(id, pw, mobile, regdate, pwresetdate, profileimage)values(?,?,?, now(), now(), ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getId());
			pstmt.setString(2, memberBean.getPw());
			pstmt.setString(3, memberBean.getMobile());
			pstmt.setString(4, memberBean.getProfileImage());
			
			if(pstmt.executeUpdate() == 1)
				
				flag = true;
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 회원탈퇴
	public boolean deleteMember(String id, String pw) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "delete from tblMember where id = ? and pw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			if(pstmt.executeUpdate() == 1)
				
				flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
		
	}
	
	// 로그인 시 공지사항 불러오기
	public Vector<NoticeBean> selectNotice(int[] seq) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<NoticeBean> vlist = new Vector<NoticeBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblnotice where notice_seq = ?";
			pstmt = con.prepareStatement(sql);
			
			for(int i = 0; i < seq.length; ++i) {
						
				pstmt.setInt(1, seq[i]);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					NoticeBean bean = new NoticeBean();
					bean.setNoticeSeq(rs.getInt("notice_seq"));
					bean.setNoticeContent(rs.getString("notice_content"));
					
					vlist.add(bean);
				}
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	// 로그인 시 도움말 불러오기
	public Vector<HelpBean> selectHelp(int[] seq) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<HelpBean> vlist = new Vector<HelpBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblhelp where help_seq = ?";
			pstmt = con.prepareStatement(sql);
			
			for(int i = 0; i < seq.length; ++i) {
					
				pstmt.setInt(1, seq[i]);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					HelpBean bean = new HelpBean();
					bean.setHelpSeq(rs.getInt("help_seq"));
					bean.setHelpContent(rs.getString("help_content"));
					bean.setHelpAccount(rs.getString("help_account"));
					bean.setHelpPrivacyPolicy(rs.getString("help_policy"));
					bean.setHelpEtc(rs.getNString("help_etc"));
					
					vlist.add(bean);
				}
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	// 일정기간 지난 후 pw 재설정 메시지 띄우기
	public Vector<MemberBean> resetPwMsg(String id, String pw) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemberBean> vlist = new Vector<MemberBean>();
		
		try {
			con = pool.getConnection();
			sql = "select regdate from tblmember where id = ? and pw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setRegDate(rs.getString("regdate"));
	
				vlist.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 비밀번호 변경
	public boolean resetPw(String id, String pw) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update tblmember set pw = ?, pwresetdate = now() where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
					
			if(pstmt.executeUpdate() == 1)
				
				flag = true;
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flag;
		
	}
	
	// 휴대폰 번호 변경
	public boolean resetMobile(String id, String mobile) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update tblmember set mobile = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mobile);
			pstmt.setString(2, id);
					
			if(pstmt.executeUpdate() == 1)
				
				flag = true;
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flag;
		
	}
	
	// 설정 페이지의 휴대폰 번호 display
	public Vector<MemberBean> selectMobile(String id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemberBean> vlist = new Vector<MemberBean>();
		
		try {
			con = pool.getConnection();
			sql = "select mobile from tblmember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setMobile(rs.getString("mobile"));
	
				vlist.add(bean);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
		
	// 포토페이지의 총 게시물수
	public int getPhotoTotalCnt(String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			if (keyWord == null || keyWord == "") {
				sql = "select count(haeundae) from tblphoto";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(?) from tblphoto";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyWord);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// DB에 저장된 이미지 경로 불러오기
	public Vector<PhotoBean> getPhotoImgUrl(String keyWord, int start, int end) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		Vector<PhotoBean> vlist = new Vector<PhotoBean>();
		System.out.println("keyWord : "+keyWord);
		try {
			con = pool.getConnection();
			if(keyWord == null || keyWord == "") {
			sql = "select * from tblphoto order by photo_seq desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					PhotoBean bean = new PhotoBean();
					bean.setPhotoUrl(rs.getString("haeundae"));
					
					vlist.add(bean);
				}
			} else {
			sql = "select " + keyWord + " from tblphoto order by photo_seq desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);	
				rs = pstmt.executeQuery();
			
				while (rs.next()) {
					PhotoBean bean = new PhotoBean();
					bean.setPhotoUrl(rs.getString(1));
					
					vlist.add(bean);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 게시판 총 게시물 수
	public int getBoardTotalCnt(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(board_seq) from tblboard";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(board_seq) from tblboard where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 게시판 리스트
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from tblboard order by board_seq desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from  tblboard where " + keyField + " like ? ";
				sql += "order by board_seq desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setBoardSeq(rs.getInt("board_seq"));
				bean.setBoardWriter(rs.getString("board_writer"));
				bean.setBoardTitle(rs.getString("board_title"));
				bean.setBoardContent(rs.getString("board_content"));
				bean.setBoardPos(rs.getInt("board_pos"));
				bean.setBoardRegdate(rs.getString("board_regdate"));
				bean.setBoardCount(rs.getInt("board_count"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 게시판 출력 시 유저 프로필 이미지 불러오기
	public String getProfileImage(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String profileImage = null;
		
		try {
			con = pool.getConnection();
			sql = "select profileimage from tblmember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				profileImage = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return profileImage;
		
	}
	
	// 게시물 입력
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi = null;
		int filesize = 0;
		String filename = null;
		try {
			con = pool.getConnection();
			sql = "select max(board_seq) from tblboard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			File file = new File(SAVEFOLDER);
			if (!file.exists())
				file.mkdirs();
			multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE,
					new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int) multi.getFile("filename").length();
			}

			sql = "insert tblboard(board_writer, board_content, board_title, board_pos, board_regdate, board_count, board_ip, board_filename, board_filesize)";
			sql += "values(?, ?, ?, 0, now(), 0, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("boardWriter"));
			pstmt.setString(2, multi.getParameter("boardContent"));
			pstmt.setString(3, multi.getParameter("boardTitle"));
			pstmt.setString(4, multi.getParameter("boardIp"));
			pstmt.setString(5, filename);
			pstmt.setInt(6, filesize);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// 조회수 증가
	public void upCount(int boardSeq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblboard set board_count= board_count+1 where board_seq = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardSeq);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 게시물 삭제
	public void deleteBoard(int boardSeq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select board_filename from tblboard where board_seq = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardSeq);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getString(1) != null) {
				if (!rs.getString(1).equals("")) {
					File file = new File(SAVEFOLDER + "/" + rs.getString(1));
					if (file.exists())
						UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
				}
			}
			sql = "delete from tblboard where board_seq = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardSeq);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// 게시물 수정
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblboard set board_writer = ?, board_title = ?, board_content = ? where board_seq = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getBoardWriter());
			pstmt.setString(2, bean.getBoardTitle());
			pstmt.setString(3, bean.getBoardContent());
			pstmt.setInt(4, bean.getBoardSeq());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 게시물 리턴
	public BoardBean getBoard(int boardSeq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblboard where board_seq = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardSeq);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setBoardSeq(rs.getInt("board_seq"));
				bean.setBoardWriter(rs.getString("board_writer"));
				bean.setBoardTitle(rs.getString("board_title"));
				bean.setBoardContent(rs.getString("board_content"));
				bean.setBoardPos(rs.getInt("board_pos"));
				bean.setBoardRegdate(rs.getString("board_regdate"));
				bean.setBoardCount(rs.getInt("board_count"));
				//bean.setFilename(rs.getString("filename"));
				//bean.setFilesize(rs.getInt("filesize"));
				bean.setBoardIp(rs.getString("board_ip"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	// 댓글 작성
	public void insertComment(HttpServletRequest req, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi = null;
		
		try {
			con = pool.getConnection();
			sql = "select max(comment_seq) from tblcomment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int commentRef = 1;
			if(rs.next())
				commentRef = rs.getInt(1) + 1;
			File file = new File(SAVEFOLDER);
			
			if (!file.exists())
				file.mkdirs();
			multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE,
					new DefaultFileRenamePolicy());

			sql = "insert tblcomment(comment_board, comment_writer, comment_content, comment_regdate, comment_pos, comment_ref, comment_depth, comment_ip)";
			sql += "values(?, ?, ?, now(), 0, ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(multi.getParameter("boardSeq")));
			pstmt.setString(2, multi.getParameter("commentWriter"));
			pstmt.setString(3, multi.getParameter("commentContent"));
			pstmt.setInt(4, commentRef);
			pstmt.setString(5, multi.getParameter("commentIp"));
			pstmt.executeUpdate();
			
			response.sendRedirect("read.jsp?nowPage=" + multi.getParameter("nowPage") + "&boardSeq=" + multi.getParameter("boardSeq"));
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

	}
	
	// 댓글 리스트
	public Vector<CommentBean> getCommentList(int commentBoard) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<CommentBean> vlist = new Vector<CommentBean>();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblcomment where comment_board = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, commentBoard);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentBean bean = new CommentBean();
				bean.setCommentSeq(rs.getInt("comment_seq"));
				bean.setCommentBoard(rs.getInt("comment_board"));
				bean.setCommentWriter(rs.getString("comment_writer"));
				bean.setCommentContent(rs.getString("comment_content"));
				bean.setCommentRegdate(rs.getString("comment_regdate"));
				bean.setCommentPos(rs.getInt("comment_pos"));
				bean.setCommentRef(rs.getInt("comment_ref"));			
				bean.setCommentIp(rs.getString("comment_ip"));
				bean.setCommentDepth(rs.getInt("comment_depth"));
				
				vlist.add(bean);
			}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
	}
	
	// 댓글 삭제
	public void deleteComment(int commentBoard, int commentSeq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			
			if(commentSeq == 0) {
				sql = "delete from tblcomment where comment_board = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, commentBoard);
				pstmt.executeUpdate();
				
			} else {
			sql = "delete from tblcomment where comment_board = ? and comment_seq = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, commentBoard);
			pstmt.setInt(2, commentSeq);
			pstmt.executeUpdate();
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
	}
	
	// 대댓글 작성
	public void replyComment(CommentBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "insert tblcomment (comment_board, comment_writer, comment_content, comment_regdate, comment_pos, comment_ref, comment_depth, comment_ip)";
			sql += "values(?, ?, ?, now(), ?, ?, ?, ?)";
			int commentDepth = bean.getCommentDepth() + 1;
			int commentPos = bean.getCommentPos() + 1;
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  bean.getCommentBoard());
			pstmt.setString(2, bean.getCommentWriter());
			pstmt.setString(3, bean.getCommentContent());
			pstmt.setInt(4, commentPos);
			pstmt.setInt(5, bean.getCommentRef());
			pstmt.setInt(6, commentDepth);
			pstmt.setString(7, bean.getCommentIp());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 댓글에 위치값 증가
	public void replyUpComment(int commentRef, int commentPos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "update tblcomment set comment_pos = comment_pos + 1 where comment_ref = ? and comment_pos > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, commentRef);
			pstmt.setInt(2, commentPos);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 파일 다운로드
	public void downLoad(HttpServletRequest req, HttpServletResponse res,
			JspWriter out, PageContext pageContext) {
		try {
			String filename = req.getParameter("filename");
			File file = new File(UtilMgr.con(SAVEFOLDER + File.separator+ filename));
			byte b[] = new byte[(int) file.length()];
			res.setHeader("Accept-Ranges", "bytes");
			String strClient = req.getHeader("User-Agent");
			if (strClient.indexOf("MSIE6.0") != -1) {
				res.setContentType("application/smnet;charset=euc-kr");
				res.setHeader("Content-Disposition", "filename=" + filename + ";");
			} else {
				res.setContentType("application/smnet;charset=euc-kr");
				res.setHeader("Content-Disposition", "attachment;filename="+ filename + ";");
			}
			out.clear();
			out = pageContext.pushBody();
			if (file.isFile()) {
				BufferedInputStream fin = new BufferedInputStream(
						new FileInputStream(file));
				BufferedOutputStream outs = new BufferedOutputStream(
						res.getOutputStream());
				int read = 0;
				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
				fin.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
