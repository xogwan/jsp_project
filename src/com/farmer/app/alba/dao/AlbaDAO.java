package com.farmer.app.alba.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.alba.vo.AlbaVO;
import com.farmer.app.program.vo.ProgramVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class AlbaDAO {
	SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	SqlSession sqlSession;

	public AlbaDAO() {
		sqlSession = sqlSessionFactory.openSession(true);
	}

//	전체 아르바이트 목록 최근 등록일 순으로 출력
	public List<AlbaVO> selectRegistration(Map<String, Integer> pageMap) {
		return sqlSession.selectList("alba.selectRegistration", pageMap);
	}
	
//	전체 아르바이트 목록 조회 순으로 출력
	public List<AlbaVO> selectViewCnt(Map<String, Integer> pageMap) {
		return sqlSession.selectList("alba.selectViewCnt", pageMap);
	}
	
//	전체 아르바이트 목록 최근 마감일 순으로 출력
	public List<AlbaVO> selectEndDay(Map<String, Integer> pageMap) {
		return sqlSession.selectList("alba.selectEndDay", pageMap);
	}
	
//	전체 아르바이트 개수 조회
	public int selectCount() {
		return sqlSession.selectOne("alba.selectCount");
	}
	
//	진행중인 아르바이트 개수 조회
	public int selectProcess(String today) {
		return sqlSession.selectOne("alba.selectProcess", today);
	}
	
//	조회수
	public void updateViewCount (int albaNumber) {
		sqlSession.update("alba.updateViewCount", albaNumber);
	}

//	클릭한 글 디테일(내용) 조회
	public AlbaVO select(int albaNumber){
		return sqlSession.selectOne("alba.select", albaNumber);
	}
	
//	아르바이트 공고 글 등록
	public void insertAlba(AlbaVO albaVO){
		sqlSession.insert("alba.insertAlba", albaVO);
	}
	
//	공고글 현 모집된 인원 조회
	public int countApplyPerson(int albaNumber) {
		return sqlSession.selectOne("alba.countApplyPerson", albaNumber);
	}
	   
//	아르바이트 글 삭제
	public void delete(int albaNumber) {
		sqlSession.delete("alba.delete", albaNumber);
	}
	
//	아르바이트 글 수정
	public void update(AlbaVO albaVO) {
		sqlSession.update("alba.update", albaVO);
	}
	
//	아르바이트 신청여부 확인
	public int isApply(Map<String, Integer> userMap) {
		return sqlSession.selectOne("alba.isApply", userMap);
	}
	
}
