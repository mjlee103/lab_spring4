package kosmo80.mvc.sp4;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class EmpController extends MultiActionController {
	private EmpLogic empLogic = null; //인스턴스화 하면 절대 안된다. setter만 필요하니까 그것만 생성
	public ModelAndView getEmpList(HttpServletRequest req
								, HttpServletResponse res) {
		logger.info("getEmpList 호출 성공");
		ModelAndView mav = new ModelAndView();
		/*<property name="prefix" value="/WEB-INF/views/"/>
		<property name="suffix" value=".jsp"/>
		/WEB-INF/views/getEmpList.jap 
		*/
		List<Map<String,Object>> empList = new ArrayList<>();
		Map<String,Object> rmap = new HashMap<>();
		rmap.put("mem_name", "이순신장군");
		empList.add(rmap);
		//NPE(NullPointerException)이 안 일어남. 
		empList = empLogic.getEmpList();
		//ModelAndView는 scope 속성이 request이다. 
		mav.addObject("mem_name", empList);
		mav.setViewName("di/getEmpList"); //경로 di까지 가져오기
		return mav;
		//return "redirect:getEmpList.jsp"; 
	}
	public void empInsert(HttpServletRequest req
						, HttpServletResponse res)
	throws Exception
	{
		logger.info("empInsert 호출 성공");
		res.sendRedirect("di/empInsertOK.jsp");
	}
	//setter 객체 주입코드 
	public void setEmpLogic(EmpLogic empLogic) {
		this.empLogic = empLogic;
	}
}
