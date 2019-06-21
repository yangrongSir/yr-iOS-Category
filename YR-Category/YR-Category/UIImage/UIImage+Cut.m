//
//  UIImage+Cut.m
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import "UIImage+Cut.h"

@implementation UIImage (Cut)

- (UIImage *)cutWithRect:(CGRect)rect {
    UIImage *originalImage = self;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(originalImage.CGImage, rect);
    CGRect smallRect = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    // 开启图形上下文
    UIGraphicsBeginImageContext(smallRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallRect, subImageRef);
    UIImage * image = [UIImage imageWithCGImage:subImageRef];
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    CGImageRelease(subImageRef);
    
    return image;
}

- (UIImage *)cutWithSize:(CGSize)size {
    UIImage *originalImage = self;
    UIGraphicsBeginImageContext(size);
    [originalImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)cutWithScaleValue:(CGFloat)scaleValue {
    UIImage *image = self;
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleValue, image.size.height * scaleValue));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleValue, image.size.height * scaleValue)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
