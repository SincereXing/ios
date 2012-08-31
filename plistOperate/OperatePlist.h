//
//  OperatePlist.h
//  ReceivePad
//
//  Created by xing wang on 12-6-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperatePlist : NSObject


//write some information into plist
+ (void) writeToPlist:(NSString *)item key:(NSString *)key;

//read some information from plist with NSString return
+ (NSString *) read:(NSString *)temp;

//write array infomation into plist
+ (void) writeInfoToPlist:(NSMutableArray *)infoArray key:(NSString *)key;

//read array infomation from plist with NSArray return
+ (NSArray *) readInfoFromPlist:(NSString *)key;

@end
