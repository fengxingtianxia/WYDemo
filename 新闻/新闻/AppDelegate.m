//
//  AppDelegate.m
//  新闻
//
//  Created by yangfeng on 15/12/24.
//  Copyright © 2015年 yangfeng. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //1设置缓存
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 *1024 diskPath:nil];
    [NSURLCache setSharedURLCache:cache];
    
    //2. 设置网络指示器
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    return YES;
}













































@end
