//
//  ProgramViewModel.m
//  YLFHFM
//
//  Created by LYL on 2017/2/7.
//  Copyright © 2017年 LYL. All rights reserved.
//

#import "ProgramViewModel.h"
#import "ProgramAPI.h"
#import "MJExtension.h"
#define kProgramUpdateSignalName @"ProgramUpdateContentSignal"
@implementation ProgramViewModel
-(instancetype)init
{
    if (self =[super init]) {
        self.updateContentSignal =[[RACSubject subject]setNameWithFormat:kProgramUpdateSignalName];
    }
    return self;
}
#pragma mark---public
-(void)refreshDataSource
{
    @weakify(self);
    RACSignal*signalProgram =[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self requestProgram:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    RACSignal *signalPlayList = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self requestPlayList:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    
    [[RACSignal combineLatest:@[signalProgram, signalPlayList]] subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"Two signal arrives!!!");
        [(RACSubject *)self.updateContentSignal sendNext:nil];
    }];
}
- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    if (self.programModel.data.compere.length == 0 || self.programModel.data.headImgUrl.length == 0) {
        // 如果创建者为空，就少一行创建者cell
        return self.playModel.data.resourceList.count + 1;
    } else {
        return self.playModel.data.resourceList.count + 2;
    }
}

- (CGFloat)heightForRowAtIndex:(NSIndexPath *)indexPath
{
    if (self.programModel.data.compere.length == 0 || self.programModel.data.headImgUrl.length == 0) {
        if (indexPath.item == 0) {
            return 40.0;
        } else {
            return 110;
        }
    } else {
        if (indexPath.item == 0) {          // 作者cell
            return 70.0;
        } else if (indexPath.item == 1) {   // 功能性cell
            return 40.0;
        } else {
            return 110;
        }
    }
    return 100;
}
#pragma mark - private

- (void)requestProgram:(void(^)())completion
{
    [ProgramAPI requestProgramDetailWithPid:self.pid completion:^(id response, NSString *message, BOOL success) {
        if (success) {
            self.programModel = [ProgramModel mj_objectWithKeyValues:response];
        }
        
        if (completion) {
            completion();
        }
    }];
}

- (void)requestPlayList:(void(^)())completion
{
    [ProgramAPI requestPlayListWithPid:self.pid rid:@"0" completion:^(id response, NSString *message, BOOL success) {
        if (success) {
            [PlayListModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"resourceList":@"PlayDetailModel"
                         };
            }];
            [PlayDetailModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"audiolist":@"AudioModel"
                         };
            }];
            self.playModel = [PlayModel mj_objectWithKeyValues:response];
        }
        
        if (completion) {
            completion();
        }
    }];
}

@end
