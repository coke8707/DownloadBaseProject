//
//  KHResolution.h
//  Parser
//
//  Created by MiniMon on 19/10/2018.
//  Copyright © 2018 Minimon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, KHResolutionType) {
    KHResolutionTypeAuto = 1,
    KHResolutionTypeSD = 2,
    KHResolutionTypeHD = 3,
    KHResolutionTypeFHD = 4
};

@class KHResolutionItem;

@interface KHResolution : NSObject
@property (nonatomic, assign) KHResolutionType isPlayingType;
@property (nonatomic, strong) NSArray<KHResolutionItem *>* resolutionItems;


+(instancetype)playUrl:(NSString *)playUrl;
-(KHResolutionItem *)getNeedResolution:(KHResolutionType)needType;
@end



@interface KHResolutionItem : NSObject
@property (nonatomic, assign) KHResolutionType resolution;
@property (nonatomic, strong) NSURL *playUrl;
@end

