//
//  NSData+Universal.m
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import "NSData+Universal.h"

@implementation NSData (Universal)

- (NSString *)toString {
    NSString *string = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    return string;
}

@end
