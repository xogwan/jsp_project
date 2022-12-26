package com.farmer.app.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.alba.vo.AlbaVO;
import com.farmer.app.community.vo.CommunityDTO;
import com.farmer.app.community.vo.CommunityVO;
import com.farmer.app.member.vo.MemberVO;
import com.farmer.app.program.vo.ProgramVO;
import com.farmer.mybatis.config.MyBatisConfig;


public class MypageDAO {
	 SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	   SqlSession sqlSession;
	   
	   public MypageDAO() {
		   sqlSession = sqlSessionFactory.openSession(true);
	   }
	   
	   public MemberVO selectNotMentor(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectNotMentor", memberNumber);
	   }
	   
	   public MemberVO selectMyPage(int memberNumber){
		   return sqlSession.selectOne("MyPage.selectMyPage", memberNumber);
	   }
	   
	   public void updateMyPage(MemberVO memberVO){
		   sqlSession.update("MyPage.updateMyPage", memberVO);
	   }
	   
//	   탈퇴하기위해 입력받은 패스워드 비교
	   public int selectDeletePw(String memberPassword) {
		   return sqlSession.selectOne("MyPage.selectDeletePw", memberPassword);
	   }
	   
//	   회원탈퇴
	   public void deleteMember(MemberVO memberVO) {
		   sqlSession.delete("MyPage.deleteMember",memberVO);
	   }
	   
	   public ProgramVO selectRecentPrograms(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectRecentPrograms", memberNumber);
	   }
	   
	   public AlbaVO selectRecentAlbas(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectRecentAlbas", memberNumber);
	   }
	   
	   public ProgramVO selectFarmerProgram(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectFarmerProgram", memberNumber);
	   }
	   
	   public AlbaVO selectFarmerAlba(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectFarmerAlba", memberNumber);
	   }
	   
	   public List<ProgramVO> selectProgram(Map<String, Integer> pageMap) {
		   return sqlSession.selectList("MyPage.selectProgram", pageMap);
	   }
	   public int selectProgramCount(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectProgramCount", memberNumber);
	   }
	   public List<ProgramVO> selectViewCountProgram(Map<String, Integer> pageMap) {
		   return sqlSession.selectList("MyPage.selectProgram", pageMap);
	   }
	   
	   public List<AlbaVO> selectAlba(Map<String, Integer> pageMap) {
		   return sqlSession.selectList("MyPage.selectAlba", pageMap);
	   }
	   public int selectAlbaCount(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectAlbaCount", memberNumber);
	   }
	   
		/* 농장주가 작성한 알바 게시글 관련 */
	   public List<AlbaVO> selectWriteAlba(Map<String, Integer> pageMap) {
		   return sqlSession.selectList("MyPage.selectWriteAlba", pageMap);
	   }
	   public int selectWriteAlbaCount(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectWriteAlbaCount", memberNumber);
	   }
	   
	   /* 농장주가 작성한 프로그램 게시글 관련 */
	   public List<AlbaVO> selectWriteProgram(Map<String, Integer> pageMap) {
		   return sqlSession.selectList("MyPage.selectWriteProgram", pageMap);
	   }
	   public int selectWriteProgramCount(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectWriteProgramCount", memberNumber);
	   }
	   
	   public List<CommunityDTO> selectMyWrite(Map<String, Integer> pageMap) {
		   return sqlSession.selectList("MyPage.selectMyWrite", pageMap);
	   }
	   
	   public int selectWriteCount(int memberNumber) {
		   return sqlSession.selectOne("MyPage.selectWriteCount",memberNumber);
	   }
	   
	   public List<CommunityVO> selectRecentWrite(int memberNumber) {
		   return sqlSession.selectList("MyPage.selectRecentWrite", memberNumber);
	   }
}
