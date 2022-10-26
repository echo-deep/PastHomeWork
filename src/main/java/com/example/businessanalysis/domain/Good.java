package com.example.businessanalysis.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * 商品表
 * @TableName t_good
 */
@TableName(value ="t_good")
@Data
public class Good implements Serializable {
    /**
     * 商品id
     */
    @TableId
    private Integer id;

    /**
     * 商品名称
     */
    private String goodName;

    /**
     * 类别id
     */
    private Integer categoryId;

    /**
     * 品牌id
     */
    private Integer brandId;

    /**
     * 商品当前价格
     */
    private BigDecimal price;

    /**
     * 是否使用规格 0否1是
     */
    private Integer useAttribute;

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

    /**
     * 
     */
    private byte[] image;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}