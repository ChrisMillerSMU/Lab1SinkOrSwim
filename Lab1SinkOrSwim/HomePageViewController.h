//
//  HomePageViewController.h
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/5/23.
//

#import <UIKit/UIKit.h>
#import "ImagePageViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomePageViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *logoImage;
@property (strong, nonatomic) ImagePageViewController *imagePageVC;
@property (strong, nonatomic) UIButton *navigationButton;

-(IBAction)tapGestureOnImage:(UITapGestureRecognizer*)sender;

@end

NS_ASSUME_NONNULL_END
