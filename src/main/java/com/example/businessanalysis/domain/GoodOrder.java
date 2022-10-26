package com.example.businessanalysis.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * 商品销售订单表
 * @TableName t_good_order
 */
@TableName(value ="t_good_order")
@Data
public class GoodOrder implements Serializable {
    /**
     * 订单id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 客户id
     */
    private Integer customerId;

    /**
     * 商品id
     */
    private Integer goodId;

    /**
     * 规格id
     */
    private Integer attributeValueId;

    /**
     * 单价
     */
    private BigDecimal price;

    /**
     * 数量
     */
    private Integer num;

    /**
     * 订单总价
     */
    private BigDecimal payment;

    /**
     * 用户是否评论 0否 1是
     */
    private Integer isComment;

    /**
     * 订单支付时间
     */
    private Date addTime;

    /**
     * 
     */
    private Date updateTime;

    /**
     * 
     */
    private Integer delFlag;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}