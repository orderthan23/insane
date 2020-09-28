package com.kh.insane.organization.model.exception.deptSetFailed;

import com.kh.insane.organization.model.exception.DepartmentSetFailedException;

public class SelectOneDeptFailed extends DepartmentSetFailedException {
	public SelectOneDeptFailed(String msg) {
		super(msg);
	}
}
