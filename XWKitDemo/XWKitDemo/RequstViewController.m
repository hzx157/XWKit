//
//  RequstViewController.m
//  XWKitDemo
//
//  Created by xiaowuxiaowu on 16/4/2.
//  Copyright © 2016年 xiaowuxiaowu. All rights reserved.
//

#import "RequstViewController.h"
#import "XWKitMacro.h"
#import "APIRequestClient.h"
@implementation RequstViewController
-(void)viewDidLoad{
 
    [super viewDidLoad];
    
    
    
    [[APIRequestClient sharedClient]uploadTaskWithUrlString:@"interfaceFileUploadcommonFileUploadByByte.aspf" fromFile:[[NSBundle mainBundle] pathForResource:@"2222" ofType:@"png"] progress:^(NSProgress *uploadProgress) {
        
        NSLog(@"%@",uploadProgress);
        
    } completionHandler:^(NSURLResponse *response, id responseObject, NSError *error, id model) {
         NSLog(@"error = %@,responseObject = %@",error,responseObject);
    }];
    
}


- (IBAction)ButtonClick:(id)sender {
    NSDictionary *dict = [[NSDictionary alloc]initWithObjectsAndKeys:
                          @"清远",@"city",
                          nil];
     [[APIRequestClient sharedClient]POST:@"interfaceAdvertsearchAdvert.aspf" parameters:dict progress:^(NSProgress *uploadProgress) {
          NSLog(@"%@",uploadProgress);
     } success:^(NSURLSessionDataTask *task, id responseObject, id respone) {
         NSLog(@"responseObject = %@",responseObject);
     } failure:^(NSURLSessionDataTask *task, NSError *error, id respone) {
         NSLog(@"error = %@",error);
     }];
    
}
@end
