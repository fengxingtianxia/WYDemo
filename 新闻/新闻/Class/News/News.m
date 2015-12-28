//
//  News.m
//  新闻
//
//  Created by yangfeng on 15/12/27.
//  Copyright © 2015年 yangfeng. All rights reserved.
//

#import "News.h"
#import "NetworkTools.h"
#import <objc/objc-runtime.h>

@implementation News


+ (instancetype)newWithClass:(NSDictionary *)dict{
    
    id obj = [[self alloc] init];

    NSArray *propertis = [self loadPropertis];//@[@"title",@"digest",@"imgsrc"];
    
    for (NSString *key in propertis) {
        
        //判断是否存在key
        if (dict[key] != nil) {
            [obj setValue:dict[key] forKey:key];
        }
        
    }
    
//    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
    
}

const char *KPropertieskey = "KPropertieskey";

//动态加载类属性
+ (NSArray *)loadPropertis{

    //利用关联对象，给类添加属性 OC中的类，本身就是一个特殊的对象
    /*
     获取关联对象
     1.对象，属性关联到得对象
     
     */
    
    NSArray *pList =  objc_getAssociatedObject(self, KPropertieskey);
    if (pList != nil) {
        return pList;
    }
    
    /*
     1.类
     2.属性计数指针
     3
     
     */
    unsigned int count = 0;
    
   objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSMutableArray *arraM = [NSMutableArray arrayWithCapacity:count];

    for (unsigned int i = 0; i < count; ++i) {
        
        //C语言中没有对象的概念，一般不需要使用 ‘*’
        objc_property_t pty = list[i];
        
        //属性名称
        const char *cname = property_getName(pty);
        
//        printf("%s\t" , cname);
        [arraM addObject:[NSString stringWithUTF8String:cname]];
        
    }
    
//    NSLog(@"%d",count);
    
    //释放对象
    free(list);
    
    //设置关联对象  在OC开发中，关联对象使用最多
    //1.属性关联的对象
    //2.key
    //3.值
    //4.引用策略
    objc_setAssociatedObject(self, KPropertieskey, arraM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, KPropertieskey);
}



//异步方法，不能用返回值
+ (void)loadNewsListWithURLString:(NSString *)urlString finished:(void (^)(NSArray *))finished{
    
    NSAssert(finished != nil, @"必须传入完成回调");

    [[NetworkTools shareNetWorkTools] GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *responseObject) {
        
        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        
        //字典转模型
        NSMutableArray *arryM = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *obj in array) {
            [arryM addObject:[self newWithClass:obj]];
        }
    
        NSLog(@"%@",arryM);
        
        finished(arryM.copy);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"aaaaa");

        
    }];

}

- (NSString *)description{
    
    NSArray *propertis = [self.class loadPropertis];// @[@"title",@"digest",@"imgsrc"];

    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class , self , dict];
}

@end
