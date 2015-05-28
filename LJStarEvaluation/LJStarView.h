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

- (void)starView:(LJStarView *)starView selecedStar:(NSString *) numStr;

@end
@interface LJStarView : UIView
@property(weak,nonatomic) id<LJStarViewDelegate> delegate;
@end
