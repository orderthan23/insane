package com.kh.insane.company.model.exception;

public class FailedUpdateCodeException extends Exception {

    private int result;
	
	public FailedUpdateCodeException(String msg) {
		super(msg);
	}
	
	public FailedUpdateCodeException(String msg, int result) {
		super(msg);
		this.result = result;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}
	
	
}
