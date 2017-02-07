//
//  MainFeatureModel.h
//  YLFHFM
//
//  Created by LYL on 2017/1/24.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MainFeatureModel, ActivityModel, ResourceInfo, Audio, TvDetails, RecommendModel, RecommendSectionModel, RecommendSpecialSectionModel, ListCategory, RecommendResource, RecommendAudio;
@interface MainFeatureModel : NSObject
@property (nonatomic, strong) NSString *msg;        // "调用成功"

@property (nonatomic, strong) NSString *code;       // "0"

@property (nonatomic, strong) NSMutableArray<ActivityModel *> *data; // ...

/**
 *  轮播模型
 */
@end

@interface ActivityModel : NSObject

@property (nonatomic, strong) NSString *activityUrl;

@property (nonatomic, strong) NSString *img640_292;             // image url

@property (nonatomic, strong) NSString *bannerTitle;            // 标题

@property (nonatomic, strong) NSString *bannerDesc;             // 和标题内容一样

@property (nonatomic, strong) NSString *linkUrl;                // ""空

@property (nonatomic, strong) NSString *redirectId;

@property (nonatomic, assign) NSInteger redirectType;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) ResourceInfo *resourceInfo;

@property (nonatomic, strong) TvDetails *tvDetails;

@end

/**
 *  轮播详细信息
 **/
@interface ResourceInfo : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *focusMap;

@property (nonatomic, strong) NSString *description;

@property (nonatomic, strong) NSString *source;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *compere;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *duration;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *videoUrl;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *sourceSort;

@property (nonatomic, strong) NSString *controllNum;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *publishTime;

@property (nonatomic, strong) NSString *smallPictureUrl;

@property (nonatomic, strong) NSString *bigPictureUrl;

@property (nonatomic, strong) NSString *middlePictureUrl;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *isVideo;

@property (nonatomic, strong) NSString *updateTime;

@property (nonatomic, strong) NSString *leadNumShow;

@property (nonatomic, strong) NSString *tags;

@property (nonatomic, strong) NSString *img297_194;

@property (nonatomic, strong) NSString *commentNum;

@property (nonatomic, strong) NSString *downloadNumShow;

@property (nonatomic, strong) NSString *collectNumShow;

@property (nonatomic, strong) NSMutableArray<Audio *> *audiolist;

@property (nonatomic, strong) NSString *img180_240;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *programId;

@property (nonatomic, strong) NSString *watchingNum;

@end

/**
 *  Audio信息
 **/
@interface Audio : NSObject

@property (nonatomic, strong) NSString *size;

@property (nonatomic, strong) NSString *filePath;

@property (nonatomic, strong) NSString *audioStream;

@end

/**
 *  tvDetails
 **/
@interface TvDetails : NSObject

@end


#pragma mark - 下边的table数据模型

@interface RecommendModel : NSObject

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) NSMutableArray *data;

@end

/**
 *  RecommendSectionModel
 **/

@interface RecommendSectionModel : NSObject

@property (nonatomic, strong) NSString *nodeName;

@property (nonatomic, strong) NSString *jumpType;

@property (nonatomic, strong) NSString *showNum;

@property (nonatomic, strong) NSMutableArray *listReource;

@property (nonatomic, strong) NSString *sourceType;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *cardDesc;

@property (nonatomic, strong) NSString *showPlace;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *nodeId;

@property (nonatomic, strong) NSString *cardTitle;

@property (nonatomic, strong) NSString *defaultList;

@end

/**
 *  RecommendSpecialSectionModel
 **/
@interface RecommendSpecialSectionModel : NSObject

@property (nonatomic, strong) NSString *nodeName;

@property (nonatomic, strong) NSString *jumpType;

@property (nonatomic, strong) ListCategory *listCategory;

@property (nonatomic, strong) NSString *showNum;

@property (nonatomic, strong) NSString *sourceType;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *cardDesc;

@property (nonatomic, strong) NSString *showPlace;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *nodeId;

@property (nonatomic, strong) NSString *cardTitle;

@property (nonatomic, strong) NSString *defaultList;

@end

/**
 *  ListCategory
 **/
@interface ListCategory : NSObject

@property (nonatomic, strong) NSString *nodeName;

@property (nonatomic, strong) NSMutableArray<RecommendResource *> *listReource;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *nodeType;

@end

/**
 *  RecommendResource
 **/

@interface RecommendResource : NSObject

@property (nonatomic, strong) NSString *listenNumShow;

@property (nonatomic, strong) NSString *focusMap;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *compere;

@property (nonatomic, strong) NSString *img194_194;

@property (nonatomic, strong) NSString *duration;

@property (nonatomic, strong) NSString *img370_370;

@property (nonatomic, strong) NSString *reTitle;

@property (nonatomic, strong) NSString *videoUrl;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, strong) NSString *sourceSort;

@property (nonatomic, strong) NSString *reSmallPictureUrl;

@property (nonatomic, strong) NSString *id;

@property (nonatomic, strong) NSString *smallPictureUrl;

@property (nonatomic, strong) NSString *bigPictureUrl;

@property (nonatomic, strong) NSString *middlePictureUrl;

@property (nonatomic, strong) NSString *img100_100;

@property (nonatomic, strong) NSString *isVideo;

@property (nonatomic, strong) NSString *reProgramName;

@property (nonatomic, strong) NSString *img297_194;

@property (nonatomic, strong) NSString *isYss;

@property (nonatomic, strong) NSString *downloadNumShow;

@property (nonatomic, strong) NSMutableArray<RecommendAudio *> *audiolist;

@property (nonatomic, strong) NSString *collectNumShow;

@property (nonatomic, strong) NSString *img180_240;

@property (nonatomic, strong) NSString *img640_640;

@property (nonatomic, strong) NSString *programId;

@property (nonatomic, strong) NSString *watchingNum;

@end

/**
 *  RecommendAudio
 **/

@interface RecommendAudio : NSObject

@property (nonatomic, strong) NSString *size;

@property (nonatomic, strong) NSString *filePath;

@property (nonatomic, strong) NSString *audioStream;
@end
