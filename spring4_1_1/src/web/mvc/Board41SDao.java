package web.mvc;

import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class Board41SDao {
	Logger						logger				= Logger.getLogger(Board41SDao.class);
	private SqlSessionTemplate	sqlSessionTemplate	= null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 첨부파일있음ㅇㅇㅇㅇㅇㅇㅇㅇ
	public int boardSInsert(Map<String, Object> pmap) {
		logger.info("Board41SDao ==> boardSInsert() 호출 성공");
		int result = 0;
		pmap.put("bs_seq", 1);
		pmap.put("bs_size", 50);
		for(String key:pmap.keySet()) {
			logger.info("key : "+key);
			logger.info("value : "+pmap.get(key));
		}
		

//		try {
//			result = sqlSessionTemplate.insert("boardSInsert", pmap);
//		}
//		catch (Exception e) {
//			logger.info(e.getMessage());
//			result = -1;
//		}
		sqlSessionTemplate.insert("boardSInsert",pmap);
		return result;
	}

	public int boardSDelete(Map<String, Object> pmap) {
		logger.info("boardMInsert 호출 성공");
		int result = 0;
		sqlSessionTemplate.insert("boardMDel", pmap);
		return result;
	}

//	public int getBsSeq() {
//		int bs_seq = 0;
//		bs_seq = sqlSessionTemplate.selectOne("getBsSeq");
//		return bs_seq;
//	}
}
