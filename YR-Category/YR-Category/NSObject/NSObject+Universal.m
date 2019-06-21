//
//  NSObject+Universal.m
//  YR-Category
//
//  Created by 杨荣 on 2019/6/21.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import "NSObject+Universal.h"

@implementation NSObject (Universal)

- (BOOL)isEmpty {
    BOOL result = NO;
    
    if (self != nil && (NSNull *)self != [NSNull null]) {
        
        if ([self isKindOfClass:[NSString class]] ) {
            
            NSString *str = [(NSString *)self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            result = [str isEqualToString:@""]?NO:YES;
            
        }else if ([self isKindOfClass:[NSArray class]]) {
            
            result = [(NSArray *)self count];
            
        }else if ([self isKindOfClass:[NSDictionary class]]) {
            
            result = [(NSDictionary *)self count];
            
        }else {
            
            result = YES;
        }
        
    }
    
    return result;
}

@end
