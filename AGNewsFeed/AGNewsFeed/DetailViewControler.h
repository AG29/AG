//
//  DetailViewControler.h
//  AGNewsFeed
//
//  Created by AG on 29/11/23.
//

#import <UIKit/UIKit.h>

@interface DetailViewControler : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UILabel *newsURLLabel;

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *content;



@end
