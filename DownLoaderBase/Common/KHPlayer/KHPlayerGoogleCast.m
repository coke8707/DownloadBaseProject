//
//  KHPlayerGoogleCast.m
//  KHPlayer
//
//  Created by MiniMon on 24/10/2018.
//  Copyright © 2018 coke. All rights reserved.
//

#import "KHPlayerGoogleCast.h"
#import <AVKit/AVKit.h>
@implementation KHPlayerGoogleCast

 
-(void)googleCastRemovePlay:(id)playInfo
{
    GCKCastSession *session =
    [GCKCastContext sharedInstance].sessionManager.currentCastSession;
    
    if (session.connectionState != GCKConnectionStateConnected) {
        return;
    }
    
    AVAsset *currentPlayerAsset = [(AVPlayerItem *)playInfo asset];
    NSString *title = @"hello";
    NSString *subTitle = @"subTitle";
    NSString *studio = @"";
    
    NSString *imageUrl = @"";
    
    NSString *playUrl = [(AVURLAsset *) currentPlayerAsset  URL].absoluteString;
    
    GCKMediaMetadata *metadata = [[GCKMediaMetadata alloc] initWithMetadataType:GCKMediaMetadataTypeMovie];
    [metadata setString:title forKey:kGCKMetadataKeyTitle];
    
    [metadata setString:subTitle forKey:@"description"];
    [metadata setString:studio forKey:kGCKMetadataKeyStudio];
    
    [metadata addImage:[[GCKImage alloc] initWithURL:[NSURL URLWithString:imageUrl]
                                               width:320
                                              height:480]];
    
 
    
    
    
    GCKMediaInformation *mediaInfo = [[GCKMediaInformation alloc]
                                      initWithContentID:playUrl
                                      streamType:GCKMediaStreamTypeBuffered
                                      contentType:@"video/mp4"
                                      metadata:metadata
                                      streamDuration:0
                                      mediaTracks:nil
                                      textTrackStyle:nil
                                      customData:nil];
    
    
    
    
    if (session) {
        GCKMediaLoadOptions *options = [[GCKMediaLoadOptions alloc]init];
        options.autoplay = YES;
        [session.remoteMediaClient loadMedia:mediaInfo withOptions:options];
    }
    
    
    [[GCKCastContext sharedInstance] presentDefaultExpandedMediaControls];
    
    
    
}






@end
