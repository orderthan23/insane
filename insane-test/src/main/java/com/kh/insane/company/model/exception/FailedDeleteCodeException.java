package com.kh.insane.company.model.exception;

public class FailedDeleteCodeException extends Exception {
	
	  private int result;
		
		public FailedDeleteCodeException(String msg) {
			super(msg);
		}
		
		public FailedDeleteCodeException(String msg, int result) {
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
