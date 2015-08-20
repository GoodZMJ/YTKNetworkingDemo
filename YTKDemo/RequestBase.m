//
//  RequestBase.m
//  YTKDemo
//
//  Created by 钟宝健 on 15/8/14.
//  Copyright © 2015年 joiway. All rights reserved.
//

#import "RequestBase.h"
#import <objc/runtime.h>

@implementation RequestBase

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeJSON;
}

- (NSDictionary *)requestHeaderFieldValueDictionary
{
    return @{@"apikey": @"61979cba44a3b9abb16c5127574dd2e5"};
}


@end
