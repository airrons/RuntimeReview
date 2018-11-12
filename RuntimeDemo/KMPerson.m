//
//  KMPerson.m
//  MethodSwizzing
//
//  Created by Rainbow on 2018/11/11.
//  Copyright © 2018 Rainbow. All rights reserved.
//

#import "KMPerson.h"
#import <objc/runtime.h>

@implementation KMPerson

+ (BOOL)supportsSecureCoding{
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    //Ivar : runtime 里面 Ivar表示成员变量。
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    //C语言中一旦遇到create，new，copy 均需要手动释放。ARC无法管理该部分内存。
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i<count; i++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        //C语言中一旦遇到create，new，copy 均需要手动释放。ARC无法管理该部分内存。
        free(ivars);
    }
    return self;
}

- (NSString *)description{
    return ([NSString stringWithFormat:@"name : %@ \n age : %ld \n sex : %@ \n height : %ld cm \n weight : %ld kg \n address : %@",self.name,self.age,self.sex == 0 ? @"男" : @"女",self.height,self.weight,self.address]);
}


@end
