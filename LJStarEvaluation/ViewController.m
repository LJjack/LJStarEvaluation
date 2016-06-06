//
//  ViewController.m
//  LJStarEvaluation
//
//  Created by liujunjie on 15-4-14.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "ViewController.h"
#import "LJStarView.h"
@interface ViewController ()<LJStarViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LJStarView *starView = [[LJStarView alloc] initWithFrame:CGRectMake(20, 150, 234, 47)];
    [starView setDelegate:self];
    [self.view addSubview:starView];
}
- (void)starView:(LJStarView *)starView selecedStar:(NSString *)numStr
{
    NSLog(@"%@",numStr);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
