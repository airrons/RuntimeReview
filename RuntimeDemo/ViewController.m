//
//  ViewController.m
//  MethodSwizzing
//
//  Created by Rainbow on 2018/11/11.
//  Copyright © 2018 Rainbow. All rights reserved.
//

#import "ViewController.h"
#import "NSURL+Safe.h"
#import "KMPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)write:(id)sender{
    
    KMPerson * person = [KMPerson new];
    person.name = @"王大帅";
    person.sex = 1;
    person.height = 175;
    person.weight = 160;
    person.address = @"湖北省洪山区黄家湖大道501号";
    person.age = 28;
    
    NSString * path = NSTemporaryDirectory();
    NSString * filePath = [path stringByAppendingPathComponent:@"temp.person"];
    
    NSError * error;
    NSData * achivedData = [NSKeyedArchiver archivedDataWithRootObject:person requiringSecureCoding:YES error:&error];
    BOOL success = [achivedData writeToFile:filePath atomically:YES];
    if (success) {
        NSLog(@"写入成功！%@",filePath);
    }else{
        NSLog(@"写入失败！");
    }
}

- (IBAction)read:(id)sender{
    
    NSString * path = NSTemporaryDirectory();
    NSString * filePath = [path stringByAppendingPathComponent:@"temp.person"];
    
    NSData * achivedData = [NSData dataWithContentsOfFile:filePath];
    NSError * error;
    KMPerson * person = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObject:KMPerson.class] fromData:achivedData error:&error];
    if (!error && person) {
        NSLog(@"%@",person);
    }else{
        NSLog(@"解析失败！");
    }
}


@end
