//
//  LeaderBoardModel.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/12/8.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LeaderBoardData, TopModel, TopAudioModel, TopSubscribeModel, BdModel;

@interface LeaderBoardModel : NSObject

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) LeaderBoardData *data;

@end

/**
 *  leaderboard data
 **/
@interface LeaderBoardData : NSObject

@property (nonatomic, strong) NSMutableArray<TopModel *> *praiseList;

@property (nonatomic, strong) NSMutableArray<TopModel *> *hotResourceList;

@property (nonatomic, strong) NSMutableArray<TopSubscribeModel *> *subList;

@property (nonatomic, strong) NSMutableArray<TopSubscribeModel *> *newsList;

@property (nonatomic, strong) NSMutableArray<BdModel *> *bkBdList;

@end

/**
 *  Top Model
 **/
@interface TopModel : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *isVideo;

@property (nonatomic, strong) NSString *updateTime;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *downloadNumShow;

@property (nonatomic, strong) NSString *videoUrl;

@property (nonatomic, strong) NSString *createTime;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *collectNumShow;

@property (nonatomic, strong) NSMutableArray<TopAudioModel *> *audiolist;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *programId;

@end

/**
 *  TopAudio Model
 **/
@interface TopAudioModel : NSObject

@property (nonatomic, strong) NSString *isDefault;

@property (nonatomic, strong) NSString *size;

@property (nonatomic, strong) NSString *filePath;

@property (nonatomic, strong) NSString *audioStream;

@end

/**
 *  Subscribe Model
 **/
@interface TopSubscribeModel : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *resourceId;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *resourceTitle;

@property (nonatomic, strong) NSString *updateTime;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *isYss;

@property (nonatomic, strong) NSString *downloadNumShow;

@property (nonatomic, strong) NSString *createTime;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *programLogo;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *subscribesNumShow;

@end

/**
 *  专辑精选
 **/
@interface BdModel : NSObject

@property (nonatomic, strong) NSString *topDesc;

@property (nonatomic, strong) NSString *iosBanner;

@property (nonatomic, strong) NSString *createTime;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *androidLogo;

@property (nonatomic, strong) NSString *topTitle;

@property (nonatomic, strong) NSString *iosLogo;

@property (nonatomic, strong) NSString *updateTime;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *img1035_441;

@property (nonatomic, strong) NSString *sort;

@property (nonatomic, strong) NSString *androidBanner;

@end
