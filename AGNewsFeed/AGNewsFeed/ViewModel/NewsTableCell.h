//
//  NewsTableCell.h
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import <UIKit/UIKit.h>
#import "NewsCellModel.h"

@interface NewsTableCell : UITableViewCell

 @property (nonatomic, strong) NewsCellModel *cellModel;
 @property (weak, nonatomic) IBOutlet UIImageView *imgView;
 @property (weak, nonatomic) IBOutlet UILabel *title;
 @property (weak, nonatomic) IBOutlet UILabel *desc;
 @property (weak, nonatomic) IBOutlet UILabel *publishedDate;

- (void)cellModel:(NewsCellModel *)cellModel;

@end
