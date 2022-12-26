package com.farmer.app.localSpeciality.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.localSpeciality.vo.LocalSpecialityVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class LocalSpecialityDAO {
	SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	SqlSession sqlSession;

	public LocalSpecialityDAO() {
		sqlSession = sqlSessionFactory.openSession(true);
	}

	public List<LocalSpecialityVO> selectSearch(Map<String, Integer> pageMap){
		return sqlSession.selectList("localSpeciality.selectSearch", pageMap);
	}

	public int selectCount(){
		return sqlSession.selectOne("localSpeciality.selectCount");
	}
}
