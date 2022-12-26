package com.farmer.app.program.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.alba.vo.AlbaVO;
import com.farmer.app.program.vo.ProgramVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class ProgramDAO {
	 SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	   SqlSession sqlSession;
	   
	   public ProgramDAO() {
		   sqlSession = sqlSessionFactory.openSession(true);
	   }
	   
//	   전체 목록 조회
	   public List<ProgramVO> selectAll(Map<String, Integer> pageMap) {
		   return sqlSession.selectList("program.selectAll", pageMap);
	   }
	   
//	   전체 목록 개수 조회
	   public int selectAllCount() {
		   return sqlSession.selectOne("program.selectAllCount");
	   }
	   
//		진행중인 아르바이트 개수 조회
		public int selectProcess(String today) {
			return sqlSession.selectOne("program.selectProcess", today);
		}
		
//		클릭한 글 내용 조회
		public ProgramVO select(int programNumber){
			return sqlSession.selectOne("program.select", programNumber);
		}
		
//		조회수
		public void updateViewCount(int programNumber) {
			sqlSession.update("program.updateViewCount", programNumber);
		}
		
//		프로그램 글 등록
	   public void insert(ProgramVO programVO) {
		   sqlSession.insert("program.insert", programVO);
	   }
	   
//	   신청인원 카운팅
	   public int countPeople(int programNumber) {
		   return sqlSession.selectOne("program.countPeople", programNumber);
	   }
	   
//		프로그램 글 삭제
		public void delete(int boardNumber) {
			sqlSession.delete("program.delete", boardNumber);
		}
		
//		프로그램 글 수정
		public void update(ProgramVO programVO) {
			sqlSession.update("program.update", programVO);
		}
		
//		조회순 정렬
		public List<ProgramVO> selectView(Map<String, Integer> pageMap) {
			return sqlSession.selectList("program.selectView", pageMap);
		}
		
//		최근 마감일순 정렬
		public List<ProgramVO> selectDeadline(Map<String, Integer> pageMap) {
			return sqlSession.selectList("program.selectDeadline", pageMap);
		}

//		프로그램 신청여부 확인
		public int isApply(Map<String, Integer> userMap) {
			return sqlSession.selectOne("program.isApply", userMap);
		}
}
