//
//  NSString+Path.h
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Path)

+ (NSString *)getDocumentsPath;// 获取Documents目录
+ (NSString *)getCachePath;// 获取Cache目录
+ (NSString *)getTempPath;// 获取tmp目录

@end

NS_ASSUME_NONNULL_END
