package com.example.businessanalysis.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.businessanalysis.domain.Instock;
import com.example.businessanalysis.service.InstockService;
import com.example.businessanalysis.mapper.InstockMapper;
import org.springframework.stereotype.Service;

/**
* @author 74707
* @description 针对表【t_instock(入库表)】的数据库操作Service实现
* @createDate 2022-10-26 12:01:20
*/
@Service
public class InstockServiceImpl extends ServiceImpl<InstockMapper, Instock>
    implements InstockService{

}




