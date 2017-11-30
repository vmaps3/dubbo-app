package com.wangsong.system.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Result;
import com.wangsong.system.dao.RoleMapper;
import com.wangsong.system.dao.RoleResourcesMapper;
import com.wangsong.system.dao.UserRoleMapper;
import com.wangsong.system.model.Role;
import com.wangsong.system.model.RolePage;
import com.wangsong.system.model.RoleResources;
import com.wangsong.system.model.UserRole;
import com.wangsong.system.service.RoleService;
import com.wangsong.system.vo.RoleVO;


@Service("roleService")
@Transactional
public class RoleServiceImpl  implements RoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private RoleResourcesMapper roleResourcesMapper;
	
	

	@Override
	public Result insertRole(Role role, String[] resourcesId) {
		role.setId(UUID.randomUUID().toString());
		roleMapper.insert(role);
		if(resourcesId==null){
			return  new Result("success",null);
		}
		for(int i=0;i<resourcesId.length;i++){		
			roleResourcesMapper.insert(new RoleResources(UUID.randomUUID().toString()
					,resourcesId[i],role.getId()));
		}
		return  new Result("success",null);
	}

	@Override
	public Result updateRole(Role role,String[] resourcesId) {
		roleResourcesMapper.deleteByT(new RoleResources[]{new RoleResources(null,null,role.getId())});
		roleMapper.updateByPrimaryKey(role);
		if(resourcesId==null){
			return  new Result("success",null);
		}
		for(int i=0;i<resourcesId.length;i++){
			roleResourcesMapper.insert(new RoleResources(UUID.randomUUID().toString(),resourcesId[i],role.getId()));
		}
		return  new Result("success",null);
	}

	@Override
	public Result deleteRole(String[] id) {
		RoleResources[] r=new RoleResources[id.length];
		UserRole[] u=new UserRole[id.length];
		for(int i=0;i<id.length;i++){
			r[i]=new RoleResources(null,null,id[i]);
			u[i]=new UserRole(null,null,id[i]);
		}

		userRoleMapper.deleteByT(u);
		roleResourcesMapper.deleteByT(r);
		roleMapper.deleteBy(id);
		return  new Result("success",null);
	}

	@Override
	public Object findTByPage(RolePage role) {
		role.setFirst((role.getPage() - 1) * role.getRows());
		return new GetEasyUIData(roleMapper.findTByPage(role)
				,roleMapper.findTCountByT(role));
	}

	@Override
	public RoleVO selectByPrimaryKey(String id) {
		RoleVO role=roleMapper.selectRoleVOByPrimaryKey(id);
		role.setRoleResourcesList(roleResourcesMapper.findTByT(new RoleResources(null,null,id)));
		return role;
	}

	@Override
	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}
}
