package com.farmer.app.cropsInfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.cropsInfo.vo.CropsInfoVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class CropsInfoDAO {
	SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	SqlSession sqlSession;

	public CropsInfoDAO() {
		sqlSession = sqlSessionFactory.openSession(true);
	}
	
	public List<CropsInfoVO> selectSearch(Map<String, Integer> pageMap){
		return sqlSession.selectList("cropsInfo.selectSearch", pageMap);
	}
	
	public int selectCount(){
		return sqlSession.selectOne("cropsInfo.selectCount");
	}
}
