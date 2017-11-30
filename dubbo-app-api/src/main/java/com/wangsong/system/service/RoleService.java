package com.wangsong.system.service;

import java.util.List;

import com.wangsong.common.model.Result;
import com.wangsong.system.model.Role;
import com.wangsong.system.model.RolePage;
import com.wangsong.system.model.RoleResources;
import com.wangsong.system.vo.RoleVO;

public interface RoleService {

	Result insertRole(Role role, String[] resourcesId);
    
    Result updateRole(Role role, String[] resourcesId);
    
    Result deleteRole(String[] id);

	Object findTByPage(RolePage role);

	RoleVO selectByPrimaryKey(String id);

	List<Role> selectAll();

}
