//
//  ProgramModel.h
//  FenghuangFM
//
//  Created by tom555cat on 2016/11/23.
//  Copyright © 2016年 Hello World Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProgramDetailModel, PlayListModel, ProgramInfo;

/**
 *  返回总体数据
 **/
@interface ProgramModel : NSObject

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) ProgramDetailModel *data;

@end

/**
 *  program详细数据
 **/
@interface ProgramDetailModel : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *crTime;

@property (nonatomic, strong) NSString *resourceId;

@property (nonatomic, strong) NSString *conversationNum;

@property (nonatomic, strong) NSString *collectionNum;

@property (nonatomic, strong) NSString *comfrom;

@property (nonatomic, strong) NSString *resourceNum;

@property (nonatomic, strong) NSString *playOrder;

@property (nonatomic, strong) NSString *operator;

@property (nonatomic, strong) NSString *compere;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *downloadNum;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *subscribesNum;

@property (nonatomic, strong) NSString *subscribesNumShow;

@property (nonatomic, strong) NSString *programDetails;

@property (nonatomic, strong) NSString *resourceCreateTime;

@property (nonatomic, strong) NSString *creator;

@property (nonatomic, strong) NSString *thumbnail;

@property (nonatomic, strong) NSString *listenNum;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *sortRank;

@property (nonatomic, strong) NSString *resourceTitle;

@property (nonatomic, strong) NSString *updateTime;

@property (nonatomic, strong) NSString *ugcUser;

@property (nonatomic, strong) NSString *videoViewNum;

@property (nonatomic, strong) NSString *userId;

@property (nonatomic, strong) NSString *tags;

@property (nonatomic, strong) NSString *img297_194;

@property (nonatomic, strong) NSString *isYss;

@property (nonatomic, strong) NSString *downloadNumShow;

@property (nonatomic, strong) NSString *headImgUrl;

@property (nonatomic, strong) NSString *createTime;

@property (nonatomic, strong) NSString *programLogo;

@property (nonatomic, strong) NSString *img180_240;

@property (nonatomic, strong) NSString *isCron;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *shortName;

@property (nonatomic, strong) NSString *collectionNumShow;

@property (nonatomic, strong) NSString *programStatus;

@end

/**
 *  播放列表返回总体数据
 **/
@interface PlayModel : NSObject

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) PlayListModel* data;

@end

/**
 *  播放列表
 **/
@interface PlayListModel : NSObject

@property (nonatomic, strong) ProgramInfo *programInfo;

@property (nonatomic, strong) NSMutableArray *resourceList;

@end

/**
 *  播放列表中的频道信息
 **/
@interface ProgramInfo : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *thumbnail;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *compere;

@property (nonatomic, strong) NSString *playOrder;

@property (nonatomic, strong) NSString *tags;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *img297_194;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *programLogo;

@property (nonatomic, strong) NSString *img180_240;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *playerBackground;

@end

/**
 *  播放详细信息
 **/
@interface PlayDetailModel : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *focusMap;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *duration;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *videoUrl;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *sourceSort;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *smallPictureUrl;

@property (nonatomic, strong) NSString *bigPictureUrl;

@property (nonatomic, strong) NSString *middlePictureUrl;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *isVideo;

@property (nonatomic, strong) NSString *updateTime;

@property (nonatomic, strong) NSString *tags;

@property (nonatomic, strong) NSString *img297_194;

@property (nonatomic, strong) NSString *downloadNumShow;

@property (nonatomic, strong) NSString *createTime;

@property (nonatomic, strong) NSString *collectNumShow;

@property (nonatomic, strong) NSMutableArray *audiolist;

@property (nonatomic, strong) NSString *img180_240;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *programId;

@property (nonatomic, strong) NSString *watchingNum;

@end

/**
 *  Audio信息
 **/
@interface AudioModel : NSObject

@property (nonatomic, strong) NSString *isDefault;

@property (nonatomic, strong) NSString *size;

@property (nonatomic, strong) NSString *filePath;

@property (nonatomic, strong) NSString *audioStream;

@end
