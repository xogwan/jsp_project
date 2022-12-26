package com.farmer.app.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

//import com.farmer.app.admin.vo.AdminNoticeVO;
import com.farmer.app.notice.vo.NoticeVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class NoticeDAO {
	 SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	   SqlSession sqlSession;
	   public NoticeDAO() {
		   sqlSession = sqlSessionFactory.openSession(true);
	   }
	   
//	   공지사항 글 목록 불러오기 (공지관리)
	   public List<NoticeVO> noticeListAll(Map<String, Integer> pageMap){
		   return sqlSession.selectList("Notice.noticeListAll", pageMap);
	   }
	   
	   
//	   공지사항 글 목록 수 (공지관리)
	   public int noticeCount() {
		   return sqlSession.selectOne("Notice.noticeCount");
	   }
}
