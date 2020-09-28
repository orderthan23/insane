package com.kh.insane.organization.model.exception.deptSetFailed;

import com.kh.insane.organization.model.exception.DepartmentSetFailedException;

public class UpdateDeptInfoFailed extends DepartmentSetFailedException {
	public UpdateDeptInfoFailed(String msg) {
		super(msg);
	}
}
