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
    LJStarView *starView = [[LJStarView alloc] initWithTotolStarNum:4];
    starView.frame = CGRectMake(20, 150, 390, 44);
    starView.selectedStarNum = 1.5;
    starView.scrollEffect = YES;
    starView.starSpace = 20.;
    starView.emptyImg = [UIImage imageNamed:@"tasty_big_star_normal"];
    starView.fullImg = [UIImage imageNamed:@"tasty_big_star_select"];
    [starView setDelegate:self];
    [self.view addSubview:starView];
}
- (void)starView:(LJStarView *)starView selecedStar:(NSString *)numStr {
    NSLog(@"%@",numStr);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
