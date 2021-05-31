package web.mvc;

import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class Board41Controller extends MultiActionController {
	//<bean id="board-controller">
	//	<property name="setter 네임 "> -> <property name="boardLogic">
	private Board41Logic boardLogic = null;
	//setter 메소드를 통해 게으론 객체 주입
	public void setBoardLogic(Board41Logic boardLogic) {
		this.boardLogic = boardLogic;
	}
	
}
