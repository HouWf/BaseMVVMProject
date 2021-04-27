//
//  STInterfaceContants.h
//  ScienceTechnology
//
//  Created by 候文福 on 2021/4/25.
//

#ifndef STInterfaceContants_h
#define STInterfaceContants_h

#if __OBJC__

    // !!!: 地址
    static NSString * const server_ip_local = @"http://172.16.13.11:9002";

    #if IF_DEV
    // 测试地址
    static NSString * const server_ip_url = @"http://business.split.dev.buff8.com:8181";
    #elif IF_REPUB
    // 预发布地址
    static NSString * const server_ip_url = @"https://business.pre.buff8.com";
    #else
    // 发布地址
    static NSString * const server_ip_url = @"https://business.buff8.com";
    #endif

#endif

#endif /* STInterfaceContants_h */
