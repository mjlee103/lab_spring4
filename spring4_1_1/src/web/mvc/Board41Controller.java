package web.mvc;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;
import com.util.HashMapBinder;

public class Board41Controller extends MultiActionController {
	Logger					logger		= Logger.getLogger(Board41Controller.class);
	private Board41Logic	boardLogic	= null;

	// setter메소드를 통하여 게으른 객체 주입
	public void setBoardLogic(Board41Logic boardLogic) {
		this.boardLogic = boardLogic;
	}

	// request로 유지
	// 메소드를 정의한는 것은 가능하다.
	// 파라미터(req,res)가 없이도 괜찮은 건가?
	// 파라미터에 req나 res가 없으면 아무리 xml문서에 url매핑을 해두었다 하더라도 찾지를 못합니다.3.
	// 이 사싱 하나만 보더라도 이것은 의존적이다 라고 이야기 할 수 있지 않을까요? - 여러분의 생각은 무엇입니까?
	// 최초 나는 ModalAndView를 사용하였습니다. 이것은 MultiActionController를 상속 받았을 때
	// 우리가 doGet에서는 누릴 수 없었떤 반환 타입을 바꾸어 쓸 수 있는 혜택을 누릴 수 있게 된 것이죠
	// 여기에 동의 하시나요? 동의 하신다면 ModelAndView의 scope를 request로 한 이유도 생각해보세요.
	// 이 생각의 끝에 forward로 페이지를 부른 다는 사실을 인지하게 될 것입니다.
	// ModelAndView가 있는데 굳이 파라미터에 req,res가 있어야만 한다 그렇지 않으면 매핑을 해주지 않을 것이라고
	// 말하는 것은 앞뒤가 맞지 않는 것이다. 이상한 태도를 보이는 것이죠
	// 굳이 없어도 되는 것을 형식적으로 가지고 있어야 한다. doGet안에 있는 것이니까 너도 있어야 해줄거야? 라고 말하는 것이죠

	// 1. ModelAndView로 반환하는 경우
	// ModelAndView를 만나 WEB-INF에 간다
	public ModelAndView getBoardList(HttpServletRequest req, HttpServletResponse res)
								throws Exception {
		logger.info("Board41Controller ==> getBoardList() 호출 성공");
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> boardList = null;
		boardList = boardLogic.getBoardList(target);// where bm_no=? and bm_title LIKE '%'||?||'%'
		logger.info("boardList: " + boardList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/getBoardList"); // 이것이 UI/UX가 된다, 페이지 이름
		mav.addObject("boardList", boardList);
		// RequestDispatcher view = req.getRequestDispatcher("getBoardList.jsp");
		// view.forward(req, res);
		return mav;
	}
	/*****************************************************************************
	 * 게시글 상세보기 구현
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 * 주의사항 - 전체조회와 하나로 합쳐 지니까 target에 구분값을 추가할것.
	 ****************************************************************************/
	public ModelAndView getBoardDetail(HttpServletRequest req, HttpServletResponse res)
								throws Exception {
		logger.info("Board41Controller ==> getBoardDetail() 호출 성공");
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<>();
		hmb.bind(target); // bm_no값 담음.
		target.put("gubun", "detail");
		logger.info("bm_no : " + target.get("bm_no"));
		List<Map<String,Object>> boardDetail = null;
		boardDetail=boardLogic.getBoardList(target);
		logger.info("boardDetail: " + boardDetail);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/read");
		mav.addObject("boardDetail", boardDetail);
		return mav;
	}

	// 2.json으로 반환하는 경우
	// json으로 내보내준다. - @RestController:String, @Controller:void, ModelAndView,
	// String
	public void jsonGetBoardList(HttpServletRequest req, HttpServletResponse res)
								throws Exception {
		logger.info("jsonGetBoard 호출 성공");
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> boardList = null;
		boardList = boardLogic.getBoardList(target);
		Gson	g		= new Gson();
		String	imsi	= g.toJson(boardList);
		res.setContentType("application/json;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(imsi);
	}

	public void boardInsert(HttpServletRequest req, HttpServletResponse res)
								throws Exception {
		logger.info("boardInsert 호출 성공");
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	pmap	= new HashMap<>();
		// 사용자가 입력한 값이나 서버에서 클라이언트에게 요청한 값 넘김.
		//hmb.bindPost(pmap);
		hmb.multiBind(pmap);
		int result = 0;
		result = boardLogic.boardInsert(pmap);

		if (result == 1) {
			res.sendRedirect("./getBoardList.sp4");
		}
		else {
			res.sendRedirect("./boardInsertFail.jsp");
		}
	}

}
