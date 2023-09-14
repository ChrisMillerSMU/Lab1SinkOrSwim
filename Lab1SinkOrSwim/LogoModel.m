//
//  LogoModel.m
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/9/23.
//

#import "LogoModel.h"

@implementation LogoModel
@synthesize logoName = _logoName;


#pragma mark - Shared Instance


+(LogoModel*)sharedInstance {
    /*
      Create a sharedInstance type that causes memory to be allocated only once
      to this class, using the same instance over and over instead of creating
      LogoModel instances again and again
     */
    static LogoModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[LogoModel alloc] init];
    });
    
    return _sharedInstance;
}


#pragma mark - Lazy Instantiation


-(NSString*)logoName {
    if (!_logoName) {
        _logoName = @"logo";
    }
    return _logoName;
}


#pragma mark - Image Retrieval


-(UIImage*)getImageWithName:(NSString*)name {
    UIImage* image = nil;
    
    image = [UIImage imageNamed:name];
    
    return image;
}



@end
