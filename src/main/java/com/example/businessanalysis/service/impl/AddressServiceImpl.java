package com.example.businessanalysis.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.businessanalysis.domain.Address;
import com.example.businessanalysis.service.AddressService;
import com.example.businessanalysis.mapper.AddressMapper;
import org.springframework.stereotype.Service;

/**
* @author 74707
* @description 针对表【t_address(客户地址表)】的数据库操作Service实现
* @createDate 2022-10-26 12:01:20
*/
@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address>
    implements AddressService{

}




