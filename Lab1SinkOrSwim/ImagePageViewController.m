//
//  ImageViewController.m
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/6/23.
//

#import "ImagePageViewController.h"

@interface ImagePageViewController ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation ImagePageViewController
@synthesize imageView = _imageView;
@synthesize scrollView = _scrollView;


-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Add UIImageView and UIScrollView to the view
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView];
}


#pragma mark - Lazy Instantiation


-(UIScrollView*)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//        _scrollView.delegate = self;
        _scrollView.minimumZoomScale = 1.0;
        _scrollView.maximumZoomScale = 4.0;
        _scrollView.contentSize = self.imageView.bounds.size;
    }
    return _scrollView;
}


-(UIImageView*)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    }
    return _imageView;
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
