package com.example.businessanalysis.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 客户地址表
 * @TableName t_address
 */
@TableName(value ="t_address")
@Data
public class Address implements Serializable {
    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户ID
     */
    private Integer userId;

    /**
     * 客户ID
     */
    private Integer customerId;

    /**
     * 省ID
     */
    private Integer province;

    /**
     * 市ID
     */
    private Integer city;

    /**
     * 详细地址
     */
    private String detail;

    /**
     * 创建时间
     */
    private Date addTime;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 逻辑删除标志
     */
    private Integer delFlag;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}