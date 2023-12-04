//
//  NewsTableCell.m
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import "NewsTableCell.h"


@implementation NewsTableCell
@synthesize imgView,title,desc,publishedDate;

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.imgView.image = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)cellModel:(NewsCellModel *)cellModel {
    if (cellModel != nil) {
    self.title.text = cellModel.headline ?: @"";
    @try {
        [self downloadedImage: cellModel.imageUrl];
    } @catch (NSException *exception) {
        NSLog(@"cellModelException = %@", [exception debugDescription]);
    }
    
    self.desc.text = cellModel.desc ?: @"" ;
    self.publishedDate.text = cellModel.publishedDate ?: @"";
    }
}

-(void)downloadedImage:(NSString *)imageURLString {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:imageURLString]];
        if ( data == nil || [data length] < 1)
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            self.imgView.image = [UIImage imageWithData: data];
        });
    });
}

@end
