package web.mvc;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class Board41Logic {
	Logger				logger		= Logger.getLogger(Board41Logic.class);
	private Board41MDao	boardMDao	= null;

	public void setBoardMDao(Board41MDao boardMDao) {
		this.boardMDao = boardMDao;
	}

	public List<Map<String, Object>> getBoardList(Map<String, Object> pmap) {
		logger.info("getBoardLsit 호출 성공"+pmap.containsKey("gubun"));//gubun이라는 이름을 가진 key가 존재한다면 true/false 출력
		List<Map<String, Object>> boardList = null;
		String gubun = null;
		if(pmap.get("gubun")!=null) { //그저 조회만 했을 경우 gubun = null이기 때문에 실행 ㄴㄴ
			gubun=pmap.get("gubun").toString(); //detail
		}
		if(gubun!=null && "detail".equals(gubun)) { //그저 조회만 했을 경우 gubun = null이기 때문에 실행 ㄴㄴ -> hitCount실행 ㄴㄴ 니까 bm_no값이 증가하지 않음.
			int bm_no = 0;
			bm_no = Integer.parseInt(pmap.get("bm_no").toString());
			boardMDao.hitCount(bm_no);
		}
		boardList = boardMDao.getBoardList(pmap);
		return boardList;
	}

	// http://localhost:8000/board/boardInsert.sp4?bm_no=100&bm_title=연습&bs_file=a.txt&bm_writer=이순신&bm_email=test@hot.com&bm_content=내용&bm_pw=123
	public int boardInsert(Map<String, Object> pmap) {
		logger.info("Board41Logic ==> boardInsert() 호출 성공");
		int	result			= 0;
		int	bm_no			= 0;
		bm_no = boardMDao.getBmNo();
		pmap.put("bm_no",bm_no);
		int	bm_group		= 0;
		// read.jsp에서 댓글쓰기를 눌렀다.
		if (pmap.get("bm_group") != null) {//read.jsp눌렀다
			bm_group = Integer.parseInt(String.valueOf(pmap.get("bm_group")));
		}
		// 댓글이야?
		if (bm_group > 0) {
			boardMDao.bmStepUpdate(pmap); //조건에 맞지 않으면 처리가 생략될 수 있다.
			pmap.put("bm_pos", Integer.parseInt(String.valueOf(pmap.get("bm_pos"))) + 1);
			pmap.put("bm_step", Integer.parseInt(String.valueOf(pmap.get("bm_step"))) + 1);
			//밸류오브로 바꿨음
		}
		// 새 글일 경우
		else {
			bm_group = boardMDao.getBmGroup(); // 새로운 채번번호를 내는 곳
			pmap.put("bm_group", bm_group);
			pmap.put("bm_pos", 0);
			pmap.put("bm_step", 0);
		}
		//첨부파일이 있어?
		if ((pmap.get("bs_file") != null) && (String.valueOf(pmap.get("bs_file")).length() > 0)) {
			logger.info("첨부파일  경유");
			pmap.put("bm_no", bm_no);
			pmap.put("bm_seq", 1);       //엥?
			boardSDao.boardSInsert(pmap);	
		}
		boardMDao.boardMInsert(pmap);
		result = 1;
		return result;
	}

	public int boardUpdate(Map<String, Object> pmap) {
		logger.info("boardUpdate 호출 성공");
		int result = 0;
		result = boardMDao.boardMUpdate(pmap);
		return result;
	}

	public int boardDelete(Map<String, Object> pmap) {
		logger.info("boardUpdate 호출 성공");
		int result = 0;
		try {
			result = boardMDao.boardMDelete(pmap);
			if(result == 1) {
			String filePath = "C:\\portfolio_kosmo\\lab_spring4\\spring4_1_1\\WebContent\\pds\\";
			String filename = pmap.get("bs_file").toString();
			String fullName = filePath+filename;
			//실제로 존재하는 파일 이름을 객체로 생성해주는 클래스
			File file = new File(fullName);
			if(file !=null ) {
				if(file.exists()) {
					boolean isOk = file.delete();
					logger.info(isOk);
					pmap.put("bs_seq", 1); //bs seq 컬럼의 값을 상수 1로 박아둠. 
					boardSDao.boardSDelete(pmap);
					}
				}
			}
		}catch (Exception e) {
			logger.info("Exception: " + e.toString());
		}
		return result;
	}
}//////////////////////////end of boardDelete
