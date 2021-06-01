package web.mvc;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class Board41Controller extends MultiActionController {
   Logger logger = Logger.getLogger(Board41Controller.class);
   private Board41Logic boardLogic = null;
   //setter메소드를 통하여 게으른 객체 주입
   public void setBoardLogic(Board41Logic boardLogic) {
      this.boardLogic = boardLogic;
   }
   /*
    * request로 유지
   // 메소드를 정의하는 것은 가능하다.
   // 파라미터가 없이도 가능할까?
   // 이 사실 하나만 보더라도 이것은 의존적이다 라고 이야기 할 수 있지 않을까? - 여러분의 생각은 무엇입니까?
   // 최초 나는 ModelAndView를 사용했습니다. 이것은 MultiActionController를 상속 받았을 때
   // 우리가 doGet에서는 누릴 수 없었던 반환 타입을 바꾸어 쓸 수 있는 혜택을 누릴 수 있게 된 것이다.
   // 여기에 동의 하나? 동의 한다면 ModelAndView의 scope를 request로 한 이유로 생각해보자.
   // 이 생각의 끝에 forward로 페이지를 부른 다는 사실을 인지하게 될 것이다.
   // ModelAndView가 있는데 굳이 파라미터에 req, res가 있어야만 한다. 그렇지 않으면 매핑을 해주지 않을 것이라고
   // 말하는 것은 앞뒤가 맞지 않는 것이다. 이상한 태도를 보이는 것이다.
   // 굳이 없어도 되는 것을 형식적으로 가지고 있어야 한다. doGet안에 있는 것이니까 너도 있어야 해줄거야? 라고 말하는 것이다.
    * 
    */
   public ModelAndView getBoardList(HttpServletRequest req, HttpServletResponse res) 
   throws Exception
   {
      logger.info("getBoardList 호출 성공");
      ModelAndView mav = new ModelAndView();
//      RequestDispatcher view = req.getRequestDispatcher("getBoardList.jsp");
//      view.forward(req, res);
      return mav;
   }
   public void jsoGetBoardList(HttpServletRequest req, HttpServletResponse res) {
      
   }
}