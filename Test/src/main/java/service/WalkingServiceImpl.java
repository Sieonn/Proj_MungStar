package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.WalkingDAO;
import dao.WalkingDAOImpl;
import dto.Walking;

public class WalkingServiceImpl implements WalkingService {
	private WalkingDAO walkDAO = new WalkingDAOImpl();
	
	@Override
	public void walkWriteForm(HttpServletRequest request) throws Exception {
		String walkName = request.getParameter("walkName");
		System.out.println("jsp의"+walkName);
	    String walkAddress3 = request.getParameter("walkAddress3");
	    Double walkLat = Double.parseDouble(request.getParameter("walkLat"));
	    Double walkLong = Double.parseDouble(request.getParameter("walkLong"));
	    String walkReason = request.getParameter("walkReason");
	    Walking walk = new Walking(walkName,walkLong,walkLat,walkAddress3,walkReason); 
		walkDAO.insertWalking(walk);
		

	}
	
	public List<Walking> allWalkingInfo() throws Exception{
	List<Walking> walkingList = walkDAO.selectWalkingList();
	return walkingList;
	
		
		
	
	}

	public Walking walkingDetail(Integer walkNum) throws Exception{
		return walkDAO.selectWalking(walkNum);
	}


}
