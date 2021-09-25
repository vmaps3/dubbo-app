package com.wangsong.system.model;

import cn.hutool.core.util.StrUtil;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Xiaoyue Xiao
 */
@Getter
@ToString
@NoArgsConstructor
public class CustomUserDetails extends UserDO implements UserDetails, Serializable {

    private static final long serialVersionUID = 1702923242319850756L;

    private boolean enabled;
    private boolean accountNonExpired;
    private boolean credentialsNonExpired;
    private boolean accountNonLocked;
    private Set<GrantedAuthority> authorities;


    public CustomUserDetails(UserDO user, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        if (user != null
                && StrUtil.isNotBlank(user.getUsername())
                && StrUtil.isNotBlank(user.getPassword())) {
            setId(user.getId());
            setUsername(user.getUsername());
            setPassword(user.getPassword());
            this.enabled = enabled;
            this.accountNonExpired = accountNonExpired;
            this.credentialsNonExpired = credentialsNonExpired;
            this.accountNonLocked = accountNonLocked;
            this.authorities = Collections.unmodifiableSet(new HashSet<>(
                    null == authorities ? Collections.emptyList() : authorities));
        } else {
            throw new IllegalArgumentException("Cannot pass null or empty values to constructor");
        }
    }

}
