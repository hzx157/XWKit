//
//  UIScrollView+INSRefresh.m
//  XWKit
//
//  Created by xiaowuxiaowu on 16/3/29.
//  Copyright © 2016年 xiaowuxiaowu. All rights reserved.
//
#import "UIScrollView+INSRefresh.h"

static CGFloat const ins_MaxHeight = 65.0f; //显示高度
static NSInteger const ins_MaxNumber = 15; //显示下拉最大数


@implementation UIScrollView (INSRefresh)

-(void)xw_addPullToRefreshWithHandler:(void(^)(UIScrollView *scrollView))handlerBlock{
    [self ins_addPullToRefreshWithHeight:ins_MaxHeight handler:handlerBlock];
    
    UIView <INSAnimatable> *infinityIndicator = [self infinityIndicatorViewFromCurrentStyle];
    [self.ins_infiniteScrollBackgroundView addSubview:infinityIndicator];
    UIView <INSPullToRefreshBackgroundViewDelegate> *pullToRefresh = [self pullToRefreshViewFromCurrentStyle];
    self.ins_pullToRefreshBackgroundView.delegate = pullToRefresh;
    [self.ins_pullToRefreshBackgroundView addSubview:pullToRefresh];
}
-(void)xw_endPullToRefresh{

    if([NSThread mainThread]){
        [self ins_endPullToRefresh];
        [(UITableView *)self reloadData];
    }else{
      dispatch_async(dispatch_get_main_queue(), ^{
           [self ins_endPullToRefresh];
           [(UITableView *)self reloadData];
      });
    
    }
  
}



-(void)xw_addInfinityScrollWithHandler:(void(^)(UIScrollView *scrollView))handlerBlock{

    [self ins_addInfinityScrollWithHeight:ins_MaxHeight handler:handlerBlock];
    UIView <INSAnimatable> *infinityIndicator = [self infinityIndicatorViewFromCurrentStyle];
    [self.ins_infiniteScrollBackgroundView addSubview:infinityIndicator];
    [infinityIndicator startAnimating];
}
-(void)xw_endInfinityRefreshAnimation:(BOOL)animation{
    

     dispatch_async(dispatch_get_main_queue(), ^{
         [self endInfinityRefreshAnimation:animation];
     });
    
}

-(void)endInfinityRefreshAnimation:(BOOL)animation{
    
    UITableView *table = (UITableView *)self;
    NSInteger numberOfRows = [table numberOfRowsInSection:0];
    if([table numberOfSections]>1 && !animation){  //如果是多numberOfSections 那么直接刷新
        [self ins_endInfinityScrollWithStoppingContentOffset:YES]; //结束刷新
        [table reloadData];
        return;
    }
    
    
    [table beginUpdates];
    numberOfRows += ins_MaxNumber;
    NSMutableArray* newIndexPaths = [NSMutableArray new];
    
    for(NSInteger i = numberOfRows - ins_MaxNumber; i < numberOfRows; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [newIndexPaths addObject:indexPath];
    }
    
    [table insertRowsAtIndexPaths:newIndexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [table endUpdates];
    
    [self ins_endInfinityScrollWithStoppingContentOffset:YES]; //结束刷新
    self.ins_infiniteScrollBackgroundView.enabled = numberOfRows%ins_MaxNumber == 0; //隐藏上提
}


-(void)xw_preserveContentInset{
   self.ins_pullToRefreshBackgroundView.preserveContentInset = YES;
}

/*
 * 设置参数
 */
- (UIView <INSAnimatable> *)infinityIndicatorViewFromCurrentStyle {
    
    CGRect defaultFrame = CGRectMake(0, 0, 24, 24);
    return [[INSDefaultInfiniteIndicator alloc] initWithFrame:defaultFrame];

}

- (UIView <INSPullToRefreshBackgroundViewDelegate> *)pullToRefreshViewFromCurrentStyle {
    
    CGRect defaultFrame = CGRectMake(0, 0, 24, 24);
    return [[INSDefaultPullToRefresh alloc] initWithFrame:defaultFrame backImage:[UIImage imageNamed:@"light_circle"] frontImage:[UIImage imageNamed:@"dark_circle"]];


}
@end
