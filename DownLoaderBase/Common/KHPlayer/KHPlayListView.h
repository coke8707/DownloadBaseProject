//
//  KHPlayListView.h
//  KHPlayer
//
//  Created by MiniMon on 23/10/2018.
//  Copyright © 2018 coke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface KHPlayListView : UIView


-(void)showPlaytList:(AVPlayer *)player withPlaylistItem:(NSArray *)items;
-(void)showRecommandVideoList:(AVPlayer *)player withPlaylistItem:(NSArray *)items;

@end

NS_ASSUME_NONNULL_END
