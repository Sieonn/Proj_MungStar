package dto;


public class Like {
	private String memId;
	private Integer boardNum;
	private boolean likeOrnot;

	public Like() {
		super();
	}

	public Like(String memId, Integer boardNum, boolean likeOrnot) {
		super();
		this.memId = memId;
		this.boardNum = boardNum;
		this.likeOrnot = likeOrnot;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public Integer getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(Integer boardNum) {
		this.boardNum = boardNum;
	}

	public boolean isLikeOrnot() {
		return likeOrnot;
	}

	public void setLikeOrnot(boolean likeOrnot) {
		this.likeOrnot = likeOrnot;
	}
	
	
	
	
}
