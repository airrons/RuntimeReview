//
//  KMPerson.h
//  MethodSwizzing
//
//  Created by Rainbow on 2018/11/11.
//  Copyright © 2018 Rainbow. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KMPerson : NSObject<NSSecureCoding>

@property(nonatomic,strong)NSString * name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,assign)NSInteger sex;
@property(nonatomic,assign)NSInteger height;
@property(nonatomic,assign)NSInteger weight;
@property(nonatomic,strong)NSString * address;

@end

NS_ASSUME_NONNULL_END
