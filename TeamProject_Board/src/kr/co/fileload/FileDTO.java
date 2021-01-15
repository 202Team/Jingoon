package kr.co.fileload;

import java.io.Serializable;

public class FileDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int num;
	private String save = "fileload";
	private String realPath;
	private String id;
	private String sysFileName;
	private String orgFileName;
	private int boardNum;
	
	public FileDTO() {
		// TODO Auto-generated constructor stub
	}
	

	public FileDTO(int num, String realPath, String id, String sysFileName, String orgFileName, int boardNum) {
		super();
		this.num = num;
		this.realPath = realPath;
		this.id = id;
		this.sysFileName = sysFileName;
		this.orgFileName = orgFileName;
		this.boardNum = boardNum;
	}


	public FileDTO(int num, String save, String realPath, String id, String sysFileName, String orgFileName,
			int boardNum) {
		super();
		this.num = num;
		this.save = save;
		this.realPath = realPath;
		this.id = id;
		this.sysFileName = sysFileName;
		this.orgFileName = orgFileName;
		this.boardNum = boardNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSave() {
		return save;
	}

	public void setSave(String save) {
		this.save = save;
	}

	public String getRealPath() {
		return realPath;
	}

	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSysFileName() {
		return sysFileName;
	}

	public void setSysFileName(String sysFileName) {
		this.sysFileName = sysFileName;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
