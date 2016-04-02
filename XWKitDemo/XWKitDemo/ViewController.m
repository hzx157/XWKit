//
//  ViewController.m
//  XWKitDemo
//
//  Created by xiaowuxiaowu on 16/4/2.
//  Copyright © 2016年 xiaowuxiaowu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSDictionary *dataSouerArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSouerArray = @{
                            @"刷新":@"INSPullToRefreshViewController",
                            @"请求":@"RequstViewController",
                            @"请求1":@"INSPullToRefreshViewController"
                            };
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.dataSouerArray allKeys] count];

 }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
     static NSString *cidentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cidentifier];
    if(!cell){
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cidentifier];
    }
    
    cell.textLabel.text = [self.dataSouerArray allKeys][indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
//    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    [self.navigationController pushViewController:[board instantiateViewControllerWithIdentifier:[self.dataSouerArray allValues][indexPath.row]] animated:YES];

    [self performSegueWithIdentifier:[NSString stringWithFormat:@"%ld",(long)indexPath.row] sender:nil];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
