//
//  AALDataStore.h
//  YoGithubPushNotify
//
//  Created by Albert Lardizabal on 7/19/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AALDataStore : NSObject

@property (nonatomic) NSMutableArray *repositories;
@property (nonatomic) NSInteger subscribers;

+ (instancetype)sharedDataStore;

- (void)getRepositoriesWithCompletion:(void (^)(BOOL success))completionBlock;

+ (void) createHookWithFullName:(NSString *)fullName
                completionBlock:(void (^)(void))completionBlock;

@end
