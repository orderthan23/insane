package com.kh.insane.organization.model.exception.deptSetFailed;

import com.kh.insane.organization.model.exception.DepartmentSetFailedException;

public class SelectDeptSetListFailed extends DepartmentSetFailedException {
	public SelectDeptSetListFailed(String msg) {
		super(msg);
	}
}
