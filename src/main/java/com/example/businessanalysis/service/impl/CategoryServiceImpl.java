package com.example.businessanalysis.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.businessanalysis.domain.Category;
import com.example.businessanalysis.service.CategoryService;
import com.example.businessanalysis.mapper.CategoryMapper;
import org.springframework.stereotype.Service;

/**
* @author 74707
* @description 针对表【t_category(类别表)】的数据库操作Service实现
* @createDate 2022-10-26 12:01:20
*/
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category>
    implements CategoryService{

}




