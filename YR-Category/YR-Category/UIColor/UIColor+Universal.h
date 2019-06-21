//
//  UIColor+Universal.h
//  YR-Category
//
//  Created by 杨荣 on 2019/6/20.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Universal)

+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;// rgb颜色
+ (UIColor *)colorWithHexString:(NSString *)hexString;// 十六进制颜色
+ (UIColor *)colorWithHexValue:(NSInteger)hexValue;// 十六进制颜色
+ (UIColor *)colorWithRandomColor;// 随机颜色

@end

NS_ASSUME_NONNULL_END
