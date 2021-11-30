package com.semiproject.board.model;

public class GradeVO {
	private int gradeNo;
	private String gradeName;
	
	public GradeVO() {
		super();
	}

	public GradeVO(int gradeNo, String gradeName) {
		super();
		this.gradeNo = gradeNo;
		this.gradeName = gradeName;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	@Override
	public String toString() {
		return "GradeVO [gradeNo=" + gradeNo + ", gradeName=" + gradeName + "]";
	}
	
	
}
