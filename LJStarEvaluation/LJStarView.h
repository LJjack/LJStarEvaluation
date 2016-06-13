//
//  LJStarView.h
//  LJStarEvaluation
//
//  Created by liujunjie on 15-4-14.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJStarView;
@protocol LJStarViewDelegate<NSObject>
@optional
- (void)starView:(LJStarView *)starView selecedStar:(NSString *) numStr;

@end
@interface LJStarView : UIView

/**
 *  是否支持滑动手势, 默认是 YES
 */
@property (nonatomic, assign) BOOL scrollEffect;
/**
 *  星星的总个数, 默认5个
 */
@property (nonatomic, assign) NSUInteger totolStarNum;
/**
 *  选中星星的个数是 [0.0, totolStarNum], 默认是 0.0f
 */
@property (nonatomic, assign) CGFloat selectedStarNum;
/**
 *  空心图片
 */
@property (nonatomic, strong) UIImage *emptyImg;
/**
 *  实心图片
 */
@property (nonatomic, strong) UIImage *fullImg;
/**
 *  星之间的间隔, 默认是 8.
 */
@property (nonatomic, assign) CGFloat starSpace;
/**
 *  代理 scrollEffect 必须是 YES 才能使用
 */
@property(nonatomic, weak) id<LJStarViewDelegate> delegate;

- (instancetype)initWithTotolStarNum:(CGFloat)totolStarNum;

@end
