package com.example.businessanalysis.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.businessanalysis.domain.GoodOrder;
import com.example.businessanalysis.service.GoodOrderService;
import com.example.businessanalysis.mapper.GoodOrderMapper;
import org.springframework.stereotype.Service;

/**
* @author 74707
* @description 针对表【t_good_order(商品销售订单表)】的数据库操作Service实现
* @createDate 2022-10-26 12:01:20
*/
@Service
public class GoodOrderServiceImpl extends ServiceImpl<GoodOrderMapper, GoodOrder>
    implements GoodOrderService{

}




