//
//  NewsFeedViewModel.h
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import <Foundation/Foundation.h>
#import "NewsCellModel.h"

@interface NewsFeedViewModel : NSObject

@property (nonatomic,strong) NSMutableArray *newsViewModelArray;

-(void)newsAPICallCompletionHandler:(void (^)(_Bool success))completionHandler;

-(NewsCellModel *)newsViewModelForIndex:(int)Index;

@end
