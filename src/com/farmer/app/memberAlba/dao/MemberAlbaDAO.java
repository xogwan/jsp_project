package com.farmer.app.memberAlba.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.memberAlba.vo.MemberAlbaVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class MemberAlbaDAO {
	 SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	   SqlSession sqlSession;
	   
	   public MemberAlbaDAO() {
		   sqlSession = sqlSessionFactory.openSession(true);
	}
//	   알바 신청하기
	   public void insert(MemberAlbaVO memberAlbaVO) {
		   sqlSession.insert("memberAlba.insert", memberAlbaVO);
	   }
	   
//		알바 신청여부 확인
		public int isApply(Map<String, Integer> userMap) {
			return sqlSession.selectOne("memberAlba.isApply", userMap);
		}

//		알바 신청 취소
		public void applyDelete(Map<String, Integer> userMap) {
			sqlSession.delete("memberAlba.applyDelete", userMap);
		}
}
