//
//  LKWallpaper.m
//  LKWallpaper
//
//  Created by Lukj on 2017/5/22.
//  Copyright © 2017年 lukj. All rights reserved.
//

#import "LKWallpaper.h"


@implementation LKWallpaper 

+ (instancetype)sharedWallpaper {
    static LKWallpaper *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[LKWallpaper alloc]init];
    });
    return tools;
}


//  自定义模型数据与字段不匹配时用这个方法
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"wallpaperId" : @"id",
             @"backgroundColor" : @"color",
             @"regularUrl" : @"urls.regular",
             @"thumbUrl" : @"urls.thumb",
             @"smallUrl" : @"urls.small",
             @"fullUrl" : @"urls.full",
             @"rawUrl" : @"urls.raw"
             };
}


- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.wallpaperId forKey:@"wallpaperId"];
    [coder encodeBool:self.collected forKey:@"collected"];
    [coder encodeObject:self.backgroundColor forKey:@"backgroundColor"];
    [coder encodeObject:self.regularUrl forKey:@"regularUrl"];
    [coder encodeObject:self.thumbUrl forKey:@"thumbUrl"];
    [coder encodeObject:self.smallUrl forKey:@"smallUrl"];
    [coder encodeObject:self.fullUrl forKey:@"fullUrl"];
    [coder encodeObject:self.rawUrl forKey:@"rawUrl"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.wallpaperId = [coder decodeObjectForKey:@"wallpaperId"];
        self.collected = [coder decodeBoolForKey:@"collected"];
        self.backgroundColor = [coder decodeObjectForKey:@"backgroundColor"];
        self.regularUrl = [coder decodeObjectForKey:@"regularUrl"];
        self.thumbUrl = [coder decodeObjectForKey:@"thumbUrl"];
        self.smallUrl = [coder decodeObjectForKey:@"smallUrl"];
        self.fullUrl = [coder decodeObjectForKey:@"fullUrl"];
        self.rawUrl = [coder decodeObjectForKey:@"rawUrl"];

    }
    return self;
}




@end