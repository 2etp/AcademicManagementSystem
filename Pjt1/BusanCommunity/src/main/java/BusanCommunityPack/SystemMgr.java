package BusanCommunityPack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class SystemMgr {

	
	private DBConnectionMgr pool;

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
			sql = "insert tblmember(id, pw, mobile)values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getId());
			pstmt.setString(2, memberBean.getPw());
			pstmt.setString(3, memberBean.getMobile());

			
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
}
