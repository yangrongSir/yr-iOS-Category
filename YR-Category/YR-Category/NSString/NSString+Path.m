//
//  NSString+Path.m
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import "NSString+Path.h"

@implementation NSString (Path)

+ (NSString *)getDocumentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getCachePath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getTempPath {
    return NSTemporaryDirectory();
}

@end
