package com.wangsong.system.service;

import java.util.List;

import com.wangsong.common.service.BaseService;
import com.wangsong.system.model.Role;
import com.wangsong.system.model.RoleResources;

public interface RoleService extends BaseService<Role>{

    int insert(Role role, String[] resourcesId);
    
    int update(Role role, String[] resourcesId);
    
    int delete(String[] id);

	List<RoleResources> findRoleResourcesByRole(Role role);

}
