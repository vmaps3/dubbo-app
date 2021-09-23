package com.wangsong.system.vo;

import com.wangsong.system.entity.Role;
import com.wangsong.system.entity.RoleResources;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoleVO extends Role {
    private List<RoleResources> roleResourcesList;
}
