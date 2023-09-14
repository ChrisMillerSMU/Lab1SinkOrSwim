//
//  LogoModel.h
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/9/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// NOTE: This is a Singleton class
@interface LogoModel : NSObject


+(LogoModel*)sharedInstance;
-(UIImage*)getImageWithName:(NSString*)names;
-(UIImage*)getImageWithIndex:(NSInteger)index;

@property (strong, nonatomic) NSArray* logoNames;


@end

NS_ASSUME_NONNULL_END
