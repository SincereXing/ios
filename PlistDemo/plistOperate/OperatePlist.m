//
//  OperatePlist.m
//  ReceivePad
//
//  Created by xing wang on 12-6-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OperatePlist.h"

@implementation OperatePlist


+ (void) writeToPlist:(NSString *)item key:(NSString *)key
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //get the plist file from bundle
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [NSString stringWithFormat:@"%@/Caches/",[paths objectAtIndex:0]];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"Demo.plist"];
    // build the array from the plist
    if ([fileManager fileExistsAtPath: plistPath]) 
    {
        NSMutableDictionary *  dict = [[NSMutableDictionary alloc]initWithContentsOfFile : plistPath];
        [dict setObject:item forKey:key];
        [dict writeToFile : plistPath  atomically : YES  ] ;
        [dict release];
    }
    else {
        NSString *resourceSampleImagesFolderPath =[[NSBundle mainBundle]
                                                   pathForResource:@"Demo"
                                                   ofType:@"plist"];
        NSData *mainBundleFile = [NSData dataWithContentsOfFile:resourceSampleImagesFolderPath];
        [[NSFileManager defaultManager] createFileAtPath:plistPath contents:mainBundleFile attributes:nil];
        NSMutableDictionary *  dict = [[NSMutableDictionary alloc]initWithContentsOfFile : plistPath];
        [dict setObject:item forKey:key];
        [dict writeToFile : plistPath  atomically : YES  ] ;
        [dict release];
    }
}

+ (NSString *) read:(NSString *)temp
{
    NSString *returnTemp = [[[NSString alloc]init]autorelease];
    //get the plist file from bundle
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [NSString stringWithFormat:@"%@/Caches/",[paths objectAtIndex:0]];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"Demo.plist"];
    // build the array from the plist
    NSMutableDictionary *  dict = [[[NSMutableDictionary alloc]initWithContentsOfFile : plistPath]autorelease];
    returnTemp = [dict objectForKey:temp];
    return returnTemp;
}

//write array infomation into plist
+ (void) writeInfoToPlist:(NSMutableArray *)infoArray key:(NSString *)key
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //get the plist file from bundle
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [NSString stringWithFormat:@"%@/Caches/",[paths objectAtIndex:0]];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"Demo.plist"];
    // build the array from the plist
    if ([fileManager fileExistsAtPath: plistPath]) 
    {
        NSMutableDictionary *  dict = [[NSMutableDictionary alloc]initWithContentsOfFile : plistPath];
        [dict setObject:infoArray forKey:key];
        [dict writeToFile : plistPath  atomically : YES  ] ;
        [dict release];
    }
    else {
        NSString *resourceSampleImagesFolderPath =[[NSBundle mainBundle]
                                                   pathForResource:@"Demo"
                                                   ofType:@"plist"];
        NSData *mainBundleFile = [NSData dataWithContentsOfFile:resourceSampleImagesFolderPath];
        [[NSFileManager defaultManager] createFileAtPath:plistPath contents:mainBundleFile attributes:nil];
        NSMutableDictionary *  dict = [[NSMutableDictionary alloc]initWithContentsOfFile : plistPath];
        [dict setObject:infoArray forKey:key];
        [dict writeToFile : plistPath  atomically : YES  ] ;
        [dict release];
    }
}

//read array infomation from plist with NSArray return
+ (NSArray *) readInfoFromPlist:(NSString *)key
{
    //get the plist file from bundle
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [NSString stringWithFormat:@"%@/Caches/",[paths objectAtIndex:0]];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"Demo.plist"];
    // build the array from the plist
    NSMutableDictionary *  dict = [[NSMutableDictionary alloc]initWithContentsOfFile : plistPath];
    NSArray *array =[[[NSArray alloc] initWithArray:[dict objectForKey:key]]autorelease];
    [dict release];
    return array;
}

@end
