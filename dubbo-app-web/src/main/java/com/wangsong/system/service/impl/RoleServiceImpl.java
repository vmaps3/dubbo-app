package com.wangsong.system.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Result;
import com.wangsong.system.dao.RoleMapper;
import com.wangsong.system.dao.RoleResourcesMapper;
import com.wangsong.system.dao.UserRoleMapper;
import com.wangsong.system.model.Resources;
import com.wangsong.system.model.Role;
import com.wangsong.system.model.RoleAddModel;
import com.wangsong.system.model.RolePage;
import com.wangsong.system.model.RoleResources;
import com.wangsong.system.model.UserRole;
import com.wangsong.system.service.ResourcesService;
import com.wangsong.system.service.RoleService;
import com.wangsong.system.service.UserService;
import com.wangsong.system.vo.RoleVO;


@Service("roleService")
@Transactional
public class RoleServiceImpl  implements RoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private UserService userService;
	@Autowired
	private RoleResourcesMapper roleResourcesMapper;
	@Autowired
	private ResourcesService resourcesService;
	
	@Override
	public Result insertRole(RoleAddModel role) {
		String[] resourcesId =role.getResourcesId();
		role.setId(UUID.randomUUID().toString());
		roleMapper.insertRoleAddModel(role);
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
	public Result updateRole(RoleAddModel role) {
		String[] resourcesId =role.getResourcesId();
		roleResourcesMapper.deleteByT(new RoleResources[]{new RoleResources(null,null,role.getId())});
		roleMapper.updateByPrimaryKeyRoleAddModel(role);
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

		userService.deleteByT(u);
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

	@Override
	public List<Resources> findResourcesByT(Resources resources) {
		List<Resources> resourcesList =new ArrayList<Resources>();
		List<UserRole>  userRoleList=userService.findByUserRole(new UserRole(null,resources.getId(),null));
		for(UserRole userRole: userRoleList){
			List<RoleResources> roleResourcesList=roleResourcesMapper.findTByT(new RoleResources(null,null, userRole.getRoleId()));
			for(RoleResources roleResources:roleResourcesList){
				resources.setId(roleResources.getResourcesId());
				resourcesList.addAll(resourcesService.selectByResources(resources));
			}
		}
		
		
		
		return distinct(resourcesList);
	}
	
	private List distinct(List arrayList){
		 Set set = new  HashSet(); 
		 List newList = new  ArrayList(); 
         for (Object cd:arrayList) {
            if(set.add(cd)){
            	newList.add(cd);
            }
        }
        Collections.sort(newList);
		return newList;
	}

	@Override
	public void deleteByT(RoleResources[] r) {
		roleResourcesMapper.deleteByT(r);
	}
}
