package com.wangsong.system.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "User", description = "用户")
public class UserDO implements Serializable {

    long serialVersionUID = -1390703452625033155L;

    @ApiModelProperty(value = "id")
    private Long id;
    @ApiModelProperty(value = "账户名")
    private String username;
    @ApiModelProperty(value = "密码")
    private String password;

}