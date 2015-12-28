//
//  NetworkTools.m
//  新闻
//
//  Created by yangfeng on 15/12/24.
//  Copyright © 2015年 yangfeng. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+ (instancetype)shareNetWorkTools{
    
    
    static NetworkTools *instace;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        
        instace = [[self alloc] initWithBaseURL:url];
        
        instace.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/jacascript",@"text/html", nil];
        
    });
    
    
    return instace;
    
}


@end
