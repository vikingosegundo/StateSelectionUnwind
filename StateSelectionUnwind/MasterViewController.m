//
//  MasterViewController.m
//  StateSelection
//
//  Created by Manuel Meyer on 25.09.13.
//  Copyright (c) 2013 bit.fritze. All rights reserved.
//

#import "MasterViewController.h"
#import "StateSelctionViewController.h"

@interface MasterViewController ()

@property (nonatomic, strong) NSMutableDictionary *statesDictionray;

-(IBAction)returned:(UIStoryboardSegue *)sender;
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
    
    self.statesDictionray = [@{} mutableCopy];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *selectedNation =[[[self.tableView cellForRowAtIndexPath:indexPath] textLabel] text];
        [[segue destinationViewController] setSelectedNation:selectedNation];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.detailTextLabel.text = _statesDictionray[cell.textLabel.text];
    return cell;
}



-(void)returned:(UIStoryboardSegue *)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.statesDictionray setObject:[sender.sourceViewController selectedState]
                              forKey:[sender.sourceViewController selectedNation]];
    [self.tableView reloadData];
}

@end
