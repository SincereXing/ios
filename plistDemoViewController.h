//
//  plistDemoViewController.h
//  PlistDemo
//
//  Created by xing wang on 12-8-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface plistDemoViewController : UIViewController
{
    UITextField *currentField;
    UITextField *allField;
    UILabel *currentLabel;
    UILabel *allLabel;
}

@property (retain, nonatomic) IBOutlet UITextField *currentField;
@property (retain, nonatomic) IBOutlet UITextField *allField;
@property (retain, nonatomic) IBOutlet UILabel *currentLabel;
@property (retain, nonatomic) IBOutlet UILabel *allLabel;
- (IBAction)test:(id)sender;

@end
