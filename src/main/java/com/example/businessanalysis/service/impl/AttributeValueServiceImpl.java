package com.example.businessanalysis.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.businessanalysis.domain.AttributeValue;
import com.example.businessanalysis.service.AttributeValueService;
import com.example.businessanalysis.mapper.AttributeValueMapper;
import org.springframework.stereotype.Service;

/**
* @author 74707
* @description 针对表【t_attribute_value(规格值表)】的数据库操作Service实现
* @createDate 2022-10-26 12:01:20
*/
@Service
public class AttributeValueServiceImpl extends ServiceImpl<AttributeValueMapper, AttributeValue>
    implements AttributeValueService{

}




