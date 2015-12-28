 //
//  News.h
//  新闻
//
//  Created by yangfeng on 15/12/27.
//  Copyright © 2015年 yangfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

///标题
@property (nonatomic ,copy) NSString *title;

///新闻摘要
@property (nonatomic ,copy) NSString *digest;

///配图地址
@property (nonatomic ,copy) NSString *imgsrc;

///跟帖数量
@property (nonatomic ,assign) int replyCount;


+ (instancetype)newWithClass:(NSDictionary *)dict;

+ (void)loadNewsListWithURLString:(NSString *)urlString finished:(void (^)(NSArray *newsList)) finished;
@end
