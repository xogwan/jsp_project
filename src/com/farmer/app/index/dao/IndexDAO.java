package com.farmer.app.index.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.program.vo.ProgramVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class IndexDAO {
	SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	SqlSession sqlSession;

	public IndexDAO() {
		sqlSession = sqlSessionFactory.openSession(true);
	}

	/* 게시글 최신 순으로 8개 조회 */
	public List<ProgramVO> selectAll() {
		return sqlSession.selectList("Index.selectAll");
	}
}