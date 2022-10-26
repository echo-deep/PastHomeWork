package com.example.businessanalysis.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.businessanalysis.domain.User;
import com.example.businessanalysis.service.UserService;
import com.example.businessanalysis.mapper.UserMapper;
import org.springframework.stereotype.Service;

/**
* @author 74707
* @description 针对表【t_user(用户表)】的数据库操作Service实现
* @createDate 2022-10-26 12:01:20
*/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
    implements UserService{

}




