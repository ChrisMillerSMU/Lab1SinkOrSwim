//
//  AuthorImageModel.h
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/13/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AuthorImageModel : NSObject

+(AuthorImageModel*)sharedInstance;
-(UIImage*)getImageWithName:(NSString*)name;
-(UIImage*)getImageWithIndex:(NSInteger)index;

@property (strong, nonatomic) NSArray* authorNames;


@end

NS_ASSUME_NONNULL_END
