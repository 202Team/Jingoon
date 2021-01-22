package kr.co.board;

import java.util.List;

public class PageTO{

	private int	curPage=1;
	private int perPage=10;
	private int perLine=10;
	private int amount;
	private List<BoardDTO> list;
	private int totalPage;
	private int starNum;
	private int endNum;
	private int beginLineNum;
	private int stopLineNum;

	public PageTO() {
		all();
	}

	public PageTO(int curPage) {
		super();
		this.curPage = curPage;
		all();
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
		all();
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
		all();
	}

	public int getPerLine() {
		return perLine;
	}

	public void setPerLine(int perLine) {
		this.perLine = perLine;
		all();
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		all();
	}

	public List<BoardDTO> getList() {
		return list;
	}

	public void setList(List<BoardDTO> list) {
		this.list = list;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStarNum() {
		return starNum;
	}

	public void setStarNum(int starNum) {
		this.starNum = starNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getBeginLineNum() {
		return beginLineNum;
	}

	public void setBeginLineNum(int beginLineNum) {
		this.beginLineNum = beginLineNum;
	}

	public int getStopLineNum() {
		return stopLineNum;
	}

	public void setStopLineNum(int stopLineNum) {
		this.stopLineNum = stopLineNum;
	}
	
	private void all() {
		totalPage = (amount-1)/perPage +1;
		
		starNum = (curPage-1)*perPage +1;
		endNum = curPage*perPage;
		if(endNum > amount) {
			endNum = amount;
		}
		
		beginLineNum = ((curPage-1)/perLine) * perLine +1;
		stopLineNum = beginLineNum + (perLine-1);
		if(stopLineNum > totalPage) {
			stopLineNum = totalPage;
		}
	}
	
	
}
