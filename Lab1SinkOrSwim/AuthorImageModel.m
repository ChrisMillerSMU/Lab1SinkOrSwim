//
//  AuthorImageModel.m
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/13/23.
//

#import "AuthorImageModel.h"

@implementation AuthorImageModel
@synthesize authorNames = _authorNames;


#pragma mark - Shared Instance


+(AuthorImageModel*)sharedInstance {
    /*
      Create a sharedInstance type that causes memory to be allocated only once
      to this class, using the same instance over and over instead of creating
      LogoModel instances again and again
     */
    static AuthorImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[AuthorImageModel alloc] init];
    });
    
    return _sharedInstance;
}


#pragma mark - Lazy Instantiation

// IF WE DO THE MULTI-IMAGE THING, CHANGE THIS TO NSARRAY AND
// IMPLEMENT 4 SEPARATE IMAGES WITH THE BEER COUNT
-(NSArray*)authorNames {
    if (!_authorNames) {
        _authorNames = @[@"rafe", @"reece", @"chris", @"ethan"];
    }
    return _authorNames;
}


#pragma mark - Image Retrieval


-(UIImage*)getImageWithName:(NSString*)name {
    UIImage* image = nil;
    
    image = [UIImage imageNamed:name];
    
    return image;
}


-(UIImage*)getImageWithIndex:(NSInteger)index {
    UIImage* image = nil;

    image = [UIImage imageNamed:self.authorNames[index]];
    
    return image;
}


@end
