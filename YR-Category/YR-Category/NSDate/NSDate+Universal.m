//
//  NSDate+Universal.m
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import "NSDate+Universal.h"

@implementation NSDate (Universal)

- (long long)toTimestamp {
    NSTimeInterval interval = [self timeIntervalSince1970];
    return (long long)(interval * 1000);
}
- (NSString *)toTimeformatWithDay {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *timeFormatStr = [dateFormatter stringFromDate:self];
    return timeFormatStr;
}
- (NSString *)toTimeformatWithMoment {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeFormatStr = [dateFormatter stringFromDate:self];
    return timeFormatStr;
}
@end
