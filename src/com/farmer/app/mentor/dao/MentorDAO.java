package com.farmer.app.mentor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.mentor.vo.MentorVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class MentorDAO {
	 SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	   SqlSession sqlSession;
	   
	   public MentorDAO() {
		   sqlSession = sqlSessionFactory.openSession(true);
	   }
	   
	   public List<MentorVO> selectAll(Map<String,Integer> pageMap) {
		   return sqlSession.selectList("Mentor.selectAll", pageMap);
	   }
	   
	   public int selectCount() {
		   return sqlSession.selectOne("Mentor.selectCount");
	   }

}
