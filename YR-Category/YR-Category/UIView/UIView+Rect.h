//
//  UIView+Rect.h
//  LSaleRetailClothingForIpad
//
//  Created by 杨荣 on 2018/1/17.
//  Copyright © 2018年 深圳市乐售云科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rect)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGPoint origin;

@property (nonatomic,assign) CGFloat left;
@property (nonatomic,assign) CGFloat right;
@property (nonatomic,assign) CGFloat top;
@property (nonatomic,assign) CGFloat bottom;

@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;

@end
