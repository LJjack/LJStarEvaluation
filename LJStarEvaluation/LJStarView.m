//
//  LJStarView.m
//  LJStarEvaluation
//
//  Created by liujunjie on 15-4-14.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "LJStarView.h"
#define kBundleStarImgPath(imgName) [@"LJStarImg.bundle" stringByAppendingPathComponent:imgName]
@implementation LJStarView
{
    UIImageView *_fullImage;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor greenColor]];
        //1.空心星
        UIImageView *emptyImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [emptyImage setImage:[UIImage imageNamed:kBundleStarImgPath(@"EmptyStar")]];
        [emptyImage setUserInteractionEnabled:YES];
        //----添加手势----
        //点击
        [emptyImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gesture:)]];
        //拖动
        [emptyImage addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gesture:)]];
        [self addSubview:emptyImage];
        //2.实心星
        UIImageView *fullImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kBundleStarImgPath(@"FullStar")]];
        [fullImage setClipsToBounds:YES];
        [fullImage setContentMode:UIViewContentModeLeft];
        CGRect tempFrame = emptyImage.frame;
        tempFrame.size.width = 0.0f;
        fullImage.frame = tempFrame;

        
        
        [self addSubview:fullImage];
        _fullImage = fullImage;
    }
    return self;
}
- (void)gesture:(UIGestureRecognizer *)ges
{
    CGPoint anPoint = [ges locationInView:ges.view];
    CGRect frame = _fullImage.frame;
    frame.size.width = anPoint.x;
    _fullImage.frame = frame;
    if (ges.state == UIGestureRecognizerStateEnded) {
        NSString *numStr = [NSString stringWithFormat:@"%.1f",(anPoint.x/self.frame.size.width)*5.0];
       if ([_delegate respondsToSelector:@selector(starView:selecedStar:)]) {
            [_delegate starView:self selecedStar:numStr];
        }
        
    }
}
@end
