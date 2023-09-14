//
//  LogoModel.m
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/9/23.
//

#import "LogoModel.h"

@implementation LogoModel
@synthesize logoNames = _logoNames;


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


-(NSArray*)logoNames {
    if (!_logoNames) {
        _logoNames = @[@"logo", @"photorealistic_logo"];
    }
    return _logoNames;
}


#pragma mark - Image Retrieval


-(UIImage*)getImageWithName:(NSString*)names {
    UIImage* image = nil;
    
    image = [UIImage imageNamed:names];
    
    return image;
}


-(UIImage*)getImageWithIndex:(NSInteger)index {
    UIImage* image = nil;

    image = [UIImage imageNamed:self.logoNames[index]];
    
    return image;
}



@end
