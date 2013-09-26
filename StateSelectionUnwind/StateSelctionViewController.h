//
//  StateSelctionViewController.h
//  StateSelection
//
//  Created by Manuel Meyer on 25.09.13.
//  Copyright (c) 2013 bit.fritze. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StateSelctionViewController : UITableViewController
@property (nonatomic, strong) NSString *selectedNation;
@property (nonatomic, strong, readonly) NSString *selectedState;

@end
