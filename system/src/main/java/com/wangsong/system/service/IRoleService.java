package com.wangsong.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.system.entity.Role;
import com.wangsong.system.vo.RoleAddModel;
import com.wangsong.system.vo.RolePage;
import com.wangsong.system.vo.RoleVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jobob
 * @since 2021-09-18
 */
public interface IRoleService extends IService<Role> {

    void insertRole(RoleAddModel role);

    void updateRole(RoleAddModel role);

    void deleteRole(Long[] id);

    GetEasyUIData findTByPage(RolePage role);

    RoleVO selectByPrimaryKey(Long id);
}
