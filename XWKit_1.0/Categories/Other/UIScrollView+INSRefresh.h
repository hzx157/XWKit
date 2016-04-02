//
//  UIScrollView+INSRefresh.h
//  XWKit
//
//  Created by xiaowuxiaowu on 16/3/29.
//  Copyright © 2016年 xiaowuxiaowu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <INSPullToRefresh/INSInfiniteScrollBackgroundView.h>
#import <INSPullToRefresh/INSPullToRefreshBackgroundView.h>
#import <INSPullToRefresh/INSDefaultPullToRefresh.h>
#import <INSPullToRefresh/INSDefaultInfiniteIndicator.h>
#import <INSPullToRefresh/INSAnimatable.h>
@interface UIScrollView (INSRefresh)


/* 添加上拉加载
 * handlerBlock : UIScrollView回调
 */
-(void)xw_addPullToRefreshWithHandler:(void(^)(UIScrollView *scrollView))handlerBlock;

/* 结束上拉加载
 *
 */
-(void)xw_endPullToRefresh;



/* 添加上提加载
 * handlerBlock : UIScrollView回调
 */
-(void)xw_addInfinityScrollWithHandler:(void(^)(UIScrollView *scrollView))handlerBlock;


/* 结束上提加载
 * animation : 是否刷新时有动画
 */

-(void)xw_endInfinityRefreshAnimation:(BOOL)animation;



/*
 * 如果contentInset有变化记得调用改方法
 */
-(void)xw_preserveContentInset;

@end
