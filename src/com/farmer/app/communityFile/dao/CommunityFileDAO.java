package com.farmer.app.communityFile.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.communityFile.vo.CommunityFileVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class CommunityFileDAO {
	SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	SqlSession sqlSession;

	public CommunityFileDAO() {
		sqlSession = sqlSessionFactory.openSession(true);
	}
	
	/* 파일 추가 */
	public void insert(CommunityFileVO communityFileVO) {
		sqlSession.insert("CommunityFile.insert", communityFileVO);
	}
	
	/* 파일 선택 */
	public List<CommunityFileVO> select(int communityNumber) {
		return sqlSession.selectList("CommunityFile.select", communityNumber);
	}
	
	/* 파일 삭제 */
	public void delete(int communityNumber) {
		sqlSession.delete("CommunityFile.delete", communityNumber);
	}
}