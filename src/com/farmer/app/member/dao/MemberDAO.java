package com.farmer.app.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.member.vo.MemberVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class MemberDAO {
	 SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	   SqlSession sqlSession;
	   
	   public MemberDAO() {
		   sqlSession = sqlSessionFactory.openSession(true);
	}
	   
	   public boolean checkId(String memberId) {
		   return (Integer)sqlSession.selectOne("Member.checkId", memberId)==1;
	   }
	   
	   public boolean checkPhoneNumber(String memberPhoneNumber) {
		   return (Integer)sqlSession.selectOne("Member.checkPhoneNumber", memberPhoneNumber)==1;
	   }
	   
	   public void join(MemberVO memberVO) {
		   sqlSession.insert("Member.join", memberVO);
	   }
	   
	   public int login(MemberVO memberVO) {
		   return sqlSession.selectOne("Member.login", memberVO);
	   }
	   
	   public int loginGrade(MemberVO memberVO) {
		   return sqlSession.selectOne("Member.loginGrade", memberVO);
	   }
	   
	   public String findId(MemberVO memberVO) {
		   return sqlSession.selectOne("Member.findId", memberVO);
	   }
	   
	   public void findPassword(MemberVO memberVO) {
		   sqlSession.update("Member.findPassword", memberVO);
	   }
	   public String findpw(MemberVO memberVO) {
		   return sqlSession.selectOne("Member.findId", memberVO);
	   }

	   
	   
}
