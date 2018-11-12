//
//  NSURL+Safe.m
//  MethodSwizzing
//
//  Created by Rainbow on 2018/11/11.
//  Copyright © 2018 Rainbow. All rights reserved.
//

#import "NSURL+Safe.h"
#import <objc/runtime.h>

@implementation NSURL (Safe)

+ (void)load{
    Method method1 = class_getClassMethod([self class], @selector(URLWithString:));
    Method method2 = class_getClassMethod([self class], @selector(KM_URLWithString:));
    method_exchangeImplementations(method1, method2);
}

+ (instancetype)KM_URLWithString:(NSString *)urlStr{
    if (!urlStr || urlStr.length == 0) {
        return nil;
    }
    return [NSURL KM_URLWithString:urlStr];
}

@end
