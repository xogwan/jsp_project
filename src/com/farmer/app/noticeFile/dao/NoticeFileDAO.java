package com.farmer.app.noticeFile.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.communityFile.vo.CommunityFileVO;
import com.farmer.app.noticeFile.vo.NoticeFileVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class NoticeFileDAO {
	SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	   SqlSession sqlSession;
	   
	   public NoticeFileDAO() {
		   sqlSession = sqlSessionFactory.openSession(true);
	   }
	   
		/* 파일 추가 */
		public void insert(NoticeFileVO noticeFileVO) {
			sqlSession.insert("NoticeFile.insert", noticeFileVO);
		}
		
		/* 파일 선택 */
		public List<NoticeFileVO> select(int noticeNumber) {
			return sqlSession.selectList("NoticeFile.select", noticeNumber);
		}
		
		/* 파일 삭제 */
		public void delete(int noticeNumber) {
			sqlSession.delete("NoticeFile.delete", noticeNumber);
		}
	}

