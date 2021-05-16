package kosmo80.mvc.sp4;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class EmpLogic { //엔지니어기 때문에 순수해야한다. 상속 받는거 없이 순수한 자바야 된다. 
	Logger logger = Logger.getLogger(EmpLogic.class);
	public List<Map<String,Object>> getEmpList(){
		logger.info("getEmpList 호출 성공");
		return null;
	}
}
