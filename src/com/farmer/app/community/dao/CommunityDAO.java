package com.farmer.app.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.community.vo.CommunityDTO;
import com.farmer.app.community.vo.CommunityVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class CommunityDAO {
	SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	SqlSession sqlSession;

	public CommunityDAO() {
		sqlSession = sqlSessionFactory.openSession(true);
	}
	
	/* 게시글 작성 */
	public void write(CommunityVO communityVO) {
		sqlSession.insert("Community.write", communityVO);
	}
	
	/* 게시글 전체 개수 */
	public int selectCnt() {
		return sqlSession.selectOne("Community.selectCnt");
	}
	
	/* 게시글 전체 목록 */
	public List<CommunityDTO> selectAll(Map<String, Integer> pageMap) {
		return sqlSession.selectList("Community.selectAll", pageMap);
	}
	
	/* 게시글 상세보기 */
	public CommunityDTO select(int communityNumber) {
		return sqlSession.selectOne("Community.select", communityNumber);
	}
	
	/* 게시글 조회수 증가 */
	public void updateViewCount(int communityNumber) {
		sqlSession.update("Community.updateViewCount", communityNumber);
	}
	
	/* 가장 최신 게시글 번호 */
	public int selectCurrentSequence() {
		return sqlSession.selectOne("Community.selectCurrentSequence");
	}
	
	/* 선택 게시글 삭제 */
	public void delete(int communityNumber) {
		sqlSession.delete("Community.delete", communityNumber);
	}
	
	/* 게시글 수정 */
	public void update(CommunityDTO communityDTO) {
		sqlSession.update("Community.update", communityDTO);
	}
	
	/* 검색한 게시글(title) 카운트 */
	public int searchCntTitle(String communityTitle) {
		return sqlSession.selectOne("Community.searchCntTitle", communityTitle);
	}
	
	/* 검색한 게시글(content) 카운트 */
	public int searchCntContent(String communityContent) {
		return sqlSession.selectOne("Community.searchCntContent", communityContent);
	}
	
	/* 검색한 게시글(title+content) 카운트 */
	public int searchCntTitleContent(CommunityDTO communityDTO) {
		return sqlSession.selectOne("Community.searchCntTitleContent", communityDTO);
	}
	
	/* 검색한 게시글(writer) 카운트 */
	public int searchCntWriter(String communityWriter) {
		return sqlSession.selectOne("Community.searchCntWriter", communityWriter);
	}
	
	/* 게시글 검색(제목) */
	public List<CommunityDTO> searchTitle(Map<String, Object> pageMap) {
		return sqlSession.selectList("Community.searchTitle", pageMap);
	}
	
	/* 게시글 검색(내용) */
	public List<CommunityDTO> searchContent(Map<String, Object> pageMap) {
		return sqlSession.selectList("Community.searchContent", pageMap);
	}
	
	/* 게시글 검색(제목+내용) */
	public List<CommunityDTO> searchTitleContent(Map<String, Object> pageMap) {
		return sqlSession.selectList("Community.searchTitleContent", pageMap);
	}
	
	/* 게시글 검색(작성자) */
	public List<CommunityDTO> searchWriter(Map<String, Object> pageMap) {
		return sqlSession.selectList("Community.searchWriter", pageMap);
	}
}