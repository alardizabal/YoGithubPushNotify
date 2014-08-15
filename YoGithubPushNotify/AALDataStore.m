//
//  AALDataStore.m
//  YoGithubPushNotify
//
//  Created by Albert Lardizabal on 7/19/14.
//  Copyright (c) 2014 Albert Lardizabal. All rights reserved.
//

#import "AALDataStore.h"
#import "AALYoAPIClient.h"

@implementation AALDataStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        _repositories = [NSMutableArray new];
    }
    return self;
}

+ (instancetype)sharedDataStore {
    static AALDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[AALDataStore alloc] init];
    });
    
    return _sharedDataStore;
}

- (void)getRepositoriesWithCompletion:(void (^)(BOOL))completionBlock
{
    [AALYoAPIClient getRepositoriesWithCompletion:^(NSArray *repoArray) {
        for (NSDictionary *repoDictionary in repoArray) {
            [self.repositories addObject:repoDictionary[@"full_name"]];
        }
        completionBlock(YES);
    }];
}

+ (void) createHookWithFullName:(NSString *)fullName
                completionBlock:(void (^)(void))completionBlock {
    
    [AALYoAPIClient createHookWithFullName:fullName completionBlock:^{
        
    }];
    
}
@end
