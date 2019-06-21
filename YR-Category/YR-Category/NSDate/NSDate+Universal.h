//
//  NSDate+Universal.h
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Universal)

- (long long)toTimestamp;// data转时间戳（精确到毫秒，也就是13位的long long数值）
- (NSString *)toTimeformatWithDay;// data转时间格式（精确到天：xxxx-xx-xx）
- (NSString *)toTimeformatWithMoment;// data转时间格式（精确到秒：xxxx-xx-xx xx:xx:xx）

@end

NS_ASSUME_NONNULL_END
