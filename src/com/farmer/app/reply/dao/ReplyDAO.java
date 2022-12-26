package com.farmer.app.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.farmer.app.reply.vo.ReplyDTO;
import com.farmer.app.reply.vo.ReplyVO;
import com.farmer.mybatis.config.MyBatisConfig;

public class ReplyDAO {
	 SqlSessionFactory sqlSessionFactory = MyBatisConfig.getSqlsessionFactory();
	   SqlSession sqlSession;
	   
	   public ReplyDAO() {
		   sqlSession = sqlSessionFactory.openSession(true);
	   }
	   
		/* 게시글에 해당하는 댓글 전체 조회 */
	   public List<ReplyDTO> selectAll(int communityNumber) {
		   return sqlSession.selectList("Reply.selectAll", communityNumber);
	   }
	   
		/* 댓글 작성 */
	   public void insert(ReplyVO replyVO) {
		   sqlSession.insert("Reply.insert", replyVO);
	   }
	   
		/* 댓글 수정 */
	   public void update(ReplyVO replyVO) {
		   sqlSession.update("Reply.update", replyVO);
	   }
	   
		/* 댓글 삭제 */
	   public void delete(int replyNumber) {
		   sqlSession.delete("Reply.delete", replyNumber);
	   }
}
