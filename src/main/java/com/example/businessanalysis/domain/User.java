package com.example.businessanalysis.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户表
 * @TableName t_user
 */
@TableName(value ="t_user")
@Data
public class User implements Serializable {
    /**
     * 用户id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户昵称
     */
    private String userName;

    /**
     * 用户账户名
     */
    private String account;

    /**
     * 用户密码MD5加密
     */
    private String userPassword;

    /**
     * 用户性别 0男 1女
     */
    private Integer gender;

    /**
     * 用户生日
     */
    private Date birthday;

    /**
     * 
     */
    private String mobile;

    /**
     * 
     */
    private String email;

    /**
     * 上次登录时间
     */
    private Date lastLoginTime;

    /**
     * 用户状态 1在线 0离线
     */
    private Integer isOnline;

    /**
     * 创建时间
     */
    private Date addTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 逻辑删除标志
     */
    private Integer delFlag;

    /**
     * 0 普通用户 1 高级用户 3管理员
     */
    private Integer roleId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}