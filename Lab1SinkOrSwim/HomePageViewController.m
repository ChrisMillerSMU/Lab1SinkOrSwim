//
//  HomePageViewController.m
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/6/23.
//

#import "HomePageViewController.h"


@interface HomePageViewController ()

@end


@implementation HomePageViewController
@synthesize logoImage = _logoImage;
@synthesize imagePageVC = _imagePageVC;
@synthesize navigationButton = _navigationButton;


-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Add the UIImage to the View
    [self.view addSubview:self.logoImage];
    
    // Add UITapGesture to the logoImage private variable
//    [self.logoImage addGestureRecognizer:self.tapGestureOnImage];
}


#pragma mark - Lazy Instantiation


-(UIImageView*)logoImage {
    if (!_logoImage) {
        _logoImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)]; // CHANGE THIS DIMENSION
        _logoImage.userInteractionEnabled = YES;
        _logoImage.image = [UIImage imageNamed:@"logo"];
    }
    return _logoImage;
}



#pragma mark - Gesture Recognizer Selector


-(void)imageViewTapped:(UITapGestureRecognizer*)recognizer {
    [self.navigationController pushViewController:self.imagePageVC animated:YES];
}

-(IBAction)tapGestureOnImage:(UITapGestureRecognizer *)sender {
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
