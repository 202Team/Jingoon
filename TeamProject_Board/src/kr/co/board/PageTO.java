package kr.co.board;

import java.util.List;

public class PageTO {

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
	// 컬럼을 추가할지 좀더 상의 하고 만들기
}
