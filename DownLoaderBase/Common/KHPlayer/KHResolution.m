//
//  KHResolution.m
//  Parser
//
//  Created by MiniMon on 19/10/2018.
//  Copyright © 2018 Minimon. All rights reserved.
//

#import "KHResolution.h"

@implementation KHResolution



+(instancetype)playUrl:(NSString *)playUrl
{
    NSCharacterSet *set = [NSCharacterSet URLFragmentAllowedCharacterSet];
    playUrl = [playUrl stringByAddingPercentEncodingWithAllowedCharacters:set];
    
    KHResolution *resolutionInfo = [[KHResolution alloc]init];
    [resolutionInfo setIsPlayingType:KHResolutionTypeAuto];
    
    NSMutableArray *playItems = [NSMutableArray new];
    
    KHResolutionItem *autoItem = [[KHResolutionItem alloc]init];
    [autoItem setResolution:KHResolutionTypeAuto];
    [autoItem setPlayUrl:[NSURL URLWithString:playUrl]];
    
    [playItems addObject:autoItem];
    
    
    NSString *m3u8String = [NSString stringWithContentsOfURL:[NSURL URLWithString:playUrl] encoding:NSUTF8StringEncoding error:nil];
    
    if (![m3u8String containsString:@"#EXTM3U"]) {
        [resolutionInfo setResolutionItems:playItems];
        return resolutionInfo;
    }
    
    
    for (NSString *value in [self getFilterM3U8:m3u8String]) {
        
        KHResolutionItem *item = [[KHResolutionItem alloc]init];
        
        if ([value hasPrefix:@"#EXT-X-STREAM-INF"]) {
            NSArray *infoValue = [value componentsSeparatedByString:@","];
            for (NSString *secValue in infoValue) {
                if ([secValue rangeOfString:@"="].location != NSNotFound) {
                    NSArray *varItem = [secValue componentsSeparatedByString:@"="];
                    if ([varItem.firstObject isEqualToString:@"PLAYURL"]) {
                        NSString *playUrl = [secValue stringByReplacingOccurrencesOfString:@"PLAYURL=" withString:@""];
                        [item setPlayUrl:[NSURL URLWithString:playUrl]];
                    }
                    else if ([varItem.firstObject isEqualToString:@"RESOLUTION"]) {
                        if ([varItem.lastObject hasSuffix:@"480"]) {
                            [item setResolution:KHResolutionTypeSD];
                        }
                        else if ([varItem.lastObject hasSuffix:@"720"]) {
                            [item setResolution:KHResolutionTypeHD];
                        }
                        else if ([varItem.lastObject hasSuffix:@"1080"]) {
                            [item setResolution:KHResolutionTypeFHD];
                        }
                    }
                }
            }
            [playItems addObject:item];
        }
    }
    
    [resolutionInfo setResolutionItems:playItems];
    
    
    
    return resolutionInfo;
}

+(NSArray *)getFilterM3U8:(NSString *)m3u8Content
{
    
    NSArray *subStringArr = [m3u8Content componentsSeparatedByString:@"\n"];
    
    
    NSMutableString *mString = [NSMutableString new];
    
    
    for (NSString *print in subStringArr) {
        
        if ([print hasPrefix:@"#EXT-X-STREAM-INF"]||[print hasPrefix:@"http"]) {
            if ([print hasPrefix:@"http"]) {
                NSCharacterSet *set = [NSCharacterSet URLFragmentAllowedCharacterSet];
                NSString *result = [print stringByAddingPercentEncodingWithAllowedCharacters:set];
                [mString appendFormat:@",PLAYURL=%@\n",result];
            }
            else {
                [mString appendString:print];
            }
        }
    }
    
    
    
    return [mString componentsSeparatedByString:@"\n"];
}

-(KHResolutionItem *)getNeedResolution:(KHResolutionType)needType

{
    KHResolutionItem *needItem = nil;
    for (KHResolutionItem *item in self.resolutionItems) {
        if (needType == item.resolution) {
            needItem = item;
            break;
        }
    }
    return needItem;
}



@end

@implementation KHResolutionItem

@end
