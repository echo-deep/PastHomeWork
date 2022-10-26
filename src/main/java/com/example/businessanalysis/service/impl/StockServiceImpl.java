package com.example.businessanalysis.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.businessanalysis.domain.Stock;
import com.example.businessanalysis.service.StockService;
import com.example.businessanalysis.mapper.StockMapper;
import org.springframework.stereotype.Service;

/**
* @author 74707
* @description 针对表【t_stock(库存表)】的数据库操作Service实现
* @createDate 2022-10-26 12:01:20
*/
@Service
public class StockServiceImpl extends ServiceImpl<StockMapper, Stock>
    implements StockService{

}




