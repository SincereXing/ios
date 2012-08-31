//
//  plistDemoViewController.m
//  PlistDemo
//
//  Created by xing wang on 12-8-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "plistDemoViewController.h"
#import "OperatePlist.h"

@interface plistDemoViewController ()

@end

@implementation plistDemoViewController
@synthesize currentField;
@synthesize allField;
@synthesize currentLabel;
@synthesize allLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [currentField release];
    [allField release];
    [currentLabel release];
    [allLabel release];
    [super dealloc];
}

- (IBAction)test:(id)sender {
    [currentField resignFirstResponder];
    [allField resignFirstResponder];
    [OperatePlist writeToPlist:self.currentField.text key:@"name"];
    [OperatePlist writeInfoToPlist:(NSMutableArray*)[self.allField.text componentsSeparatedByString:@","] key:@"names"];
    self.currentLabel.text = [OperatePlist read:@"name"];
    for (NSString *temp in [OperatePlist readInfoFromPlist:@"names"]) {
        if ([self.allLabel.text isEqualToString:@""]) {
            self.allLabel.text = temp;
        }
        else {
            self.allLabel.text = [self.allLabel.text stringByAppendingFormat:@", %@",temp];
        }
    }
}
@end
