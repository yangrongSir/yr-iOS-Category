//
//  UIImage+Cut.h
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Cut)

- (UIImage *)cutWithRect:(CGRect)rect;// 根据rect裁剪成一张新的图片
- (UIImage *)cutWithSize:(CGSize)size;// 根据size等比例裁剪成一张新的图片
- (UIImage *)cutWithScaleValue:(CGFloat)scaleValue;// 等比例裁剪成放大/缩小倍数的图片（scaleValue：放大或者缩小的倍数）

@end

NS_ASSUME_NONNULL_END
