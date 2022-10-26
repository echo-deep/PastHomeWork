package com.example.businessanalysis.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.businessanalysis.domain.Good;
import com.example.businessanalysis.service.GoodService;
import com.example.businessanalysis.mapper.GoodMapper;
import org.springframework.stereotype.Service;

/**
* @author 74707
* @description 针对表【t_good(商品表)】的数据库操作Service实现
* @createDate 2022-10-26 12:01:20
*/
@Service
public class GoodServiceImpl extends ServiceImpl<GoodMapper, Good>
    implements GoodService{

}




