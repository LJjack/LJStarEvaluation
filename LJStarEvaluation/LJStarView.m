//
//  LJStarView.m
//  LJStarEvaluation
//
//  Created by liujunjie on 15-4-14.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "LJStarView.h"

CGFloat const kStarSpace = 10.f;

@interface LJStarView ()

@property (nonatomic, assign) BOOL oneSetup;
@property (nonatomic, strong) UIView *bgView;//空心星
@property (nonatomic, strong) UIView *foreView;//实心星

@end

@implementation LJStarView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.totolStarNum = 5;
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithTotolStarNum:(CGFloat)totolStarNum {
    if (self = [super init]) {
        self.totolStarNum = totolStarNum;
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    if (CGRectIsEmpty(self.frame)) return;
    if (self.oneSetup) {
        CGFloat imgWidth = CGRectGetHeight(self.frame);
        CGFloat imgHeight = imgWidth;
        for (NSInteger i = 0; i < _totolStarNum; i ++) {
            UIImageView *emptyImgView = self.bgView.subviews[i];
            UIImageView *fullImgView  = self.foreView.subviews[i];
            
            CGFloat imgX = i*(imgWidth + kStarSpace);
            CGRect frame = CGRectMake(imgX, 0, imgWidth, imgHeight);
            emptyImgView.frame = frame;
            fullImgView.frame = frame;
        }
        self.bgView.frame = self.bounds;
        NSInteger zs = floor(self.selectedStarNum);
        CGFloat xs = self.selectedStarNum - zs;
        CGFloat foreViewWidth = CGRectGetMinX(self.foreView.subviews[zs].frame) + CGRectGetWidth(self.foreView.subviews[zs].frame)*xs;
        self.foreView.frame = CGRectMake(0, 0, foreViewWidth, self.frame.size.height);
        CGRect frame = self.frame;
        frame.size.width = CGRectGetMaxX(self.bgView.subviews.lastObject.frame);
        self.frame = frame;
        self.oneSetup = NO;
    }
    
}

- (void)setupUI {
    self.oneSetup = YES;
    self.selectedStarNum = 0.0f;
    
    //----添加手势----
    //点击
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesture:)]];
    //拖动
    [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gesture:)]];
    
    [self setBackgroundColor:[UIColor greenColor]];
}

- (UIView *)createImgViewWithImg:(UIImage *)img {
    UIView *conView = [[UIView alloc] init];
    conView.backgroundColor = [UIColor clearColor];
    conView.clipsToBounds = YES;
    for (NSInteger i = 0; i < _totolStarNum; i ++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = img;
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [conView addSubview:imgView];
    }
    return conView;
}

#pragma mark - Action

- (void)gesture:(UIGestureRecognizer *)ges {
//    CGFloat x = [ges locationInView:ges.view].x;
//    if (x < 0) return;
//    CGRect frame = _fullImgView.frame;
//    frame.size.width = x;
//    _fullImgView.frame = frame;
//    if (ges.state == UIGestureRecognizerStateEnded) {
//        NSString *numStr = [NSString stringWithFormat:@"%.1f",(x/self.frame.size.width)*5.0];
//       if ([_delegate respondsToSelector:@selector(starView:selecedStar:)]) {
//            [_delegate starView:self selecedStar:numStr];
//        }
//        
//    }
}

#pragma mark - Getters And Setters

- (void)setSelectedStarNum:(CGFloat)selectedStarNum {
    _selectedStarNum = selectedStarNum;
    
}

- (void)setScrollEffect:(BOOL)scrollEffect {
    _scrollEffect = scrollEffect;
    self.userInteractionEnabled = scrollEffect;
    
}

- (void)setEmptyImg:(UIImage *)emptyImg {
    _emptyImg = emptyImg;
    self.bgView = [self createImgViewWithImg:emptyImg];
    [self addSubview:self.bgView];
}

- (void)setFullImg:(UIImage *)fullImg {
    _fullImg = fullImg;
    self.foreView = [self createImgViewWithImg:fullImg];
    [self addSubview:self.foreView];
}

@end
