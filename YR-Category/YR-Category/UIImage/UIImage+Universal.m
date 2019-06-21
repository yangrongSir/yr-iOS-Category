//
//  UIImage+Universal.m
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import "UIImage+Universal.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (Universal)

- (UIImage *)getBlurImage:(CGFloat)blur {
    UIImage *image = self;
    // 模糊度越界
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    if (inBitmapData) {
        inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    }
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (color) {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        // 开启图形上下文
        UIGraphicsBeginImageContext(rect.size);
        // 获取当前的上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        // 将颜色填充到上下文
        CGContextSetFillColorWithColor(context, color.CGColor);
        // 将内容填满指定的尺寸
        CGContextFillRect(context, rect);
        // 从上下文获取图片
        UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
        // 关闭上下文
        UIGraphicsEndImageContext();
        
        return image;
    }
    return nil;
}

- (UIImage *)getCircleImageWithborderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    
    UIImage *originImage = self;
    // 设置圆形图片的直径
    CGFloat imageDia = originImage.size.width;
    // 计算外圆的直径(边框是在图片外额外添加的区域)
    CGFloat borderDia = imageDia + 2 * borderWidth;
    
    // 开启图形上下文
    UIGraphicsBeginImageContext(originImage.size);
    // 画一个包含边框的圆形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, borderDia, borderDia)];
    // 设置颜色
    [borderColor set];
    [path fill];
    
    // 设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, imageDia, imageDia)];
    // 裁剪图片
    [clipPath addClip];
    
    // 绘制图片
    [originImage drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    // 从上下文中获取图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return resultImage;
}
@end
