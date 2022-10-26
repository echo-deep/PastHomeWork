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
 * 规格值表
 * @TableName t_attribute_value
 */
@TableName(value ="t_attribute_value")
@Data
public class AttributeValue implements Serializable {
    /**
     * 规格值id/sku_id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 商品id
     */
    private Integer goodId;

    /**
     * 如该商品1个规格值是 [黑，64G]
     */
    private String attributeValue;

    /**
     * 该规格的商品价格
     */
    private BigDecimal price;

    /**
     * 
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