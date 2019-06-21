//
//  UIImage+Universal.h
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Universal)

- (UIImage *)getBlurImage:(CGFloat)blur;// 根据image获取一张新的模糊图片 blur：模糊程度（0~1）
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;// 根据颜色生成一张图片
- (UIImage *)getCircleImageWithborderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;// 生成一张圆形图片

@end

NS_ASSUME_NONNULL_END
