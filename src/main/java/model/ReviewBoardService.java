package model;

import java.sql.SQLException;
import java.util.List;
public class ReviewBoardService {
	private ReviewBoardDAO boardDao;
	
	public ReviewBoardService() {
		boardDao=new ReviewBoardDAO();
	}
	
	public List<ReviewBoardVO> selectMainNotice() throws SQLException {
		return boardDao.selectMainNotice();
	}
}
