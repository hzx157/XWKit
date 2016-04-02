//
//  INSPullToRefreshViewController.m
//  XWKitDemo
//
//  Created by xiaowuxiaowu on 16/4/2.
//  Copyright © 2016年 xiaowuxiaowu. All rights reserved.
//

#import "INSPullToRefreshViewController.h"

@interface INSPullToRefreshViewController()
@property (nonatomic,strong)NSMutableArray *dataArray;
@end
@implementation INSPullToRefreshViewController

-(void)viewDidLoad{

    [super viewDidLoad];
    self.dataArray = [[NSMutableArray alloc]init];
    [self.view xw_showHUDWithProgressTitle:@"加载中.."];
    [self test];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view xw_hideHUDafterDelay:@"加载完成"];
    });
    
    __weak typeof(self) weakSelf = self;
    [self.tableView xw_addPullToRefreshWithHandler:^(UIScrollView *scrollView) {
        [weakSelf.dataArray removeAllObjects];
        [weakSelf test];
        [scrollView xw_endPullToRefresh];
    }];
    
    
    [self.tableView xw_addInfinityScrollWithHandler:^(UIScrollView *scrollView) {
        [weakSelf test];
        [weakSelf.tableView xw_endInfinityRefreshAnimation:NO];
    }];
    [self.tableView reloadData];
    
}
-(void)test{

    NSMutableArray *array = [NSMutableArray new];
    for (NSInteger i = self.dataArray.count; i < self.dataArray.count + 15; i++) {
        [array addObject:[NSString stringWithFormat:@"test_%ld",i]];
    }
    [self.dataArray addObjectsFromArray:array];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    static NSString *indetifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifier];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
    
}
@end
