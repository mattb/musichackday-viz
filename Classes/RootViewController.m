//
//  RootViewController.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController
@synthesize trackList, analyzingViewController;
static NSArray *trackNames = nil;

- (void)dealloc{
	[trackList release];
	[analyzingViewController release];
	[super dealloc];
}


- (void)viewDidLoad
{
	// Make the title of this page the same as the title of this app
	self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
	
	self.trackList = [NSMutableArray array];
    if (!trackNames)
	{
		trackNames = [[NSArray alloc] initWithObjects:@"track one", @"track two", @"track three", nil];
    }
	
    for (NSString *trackName in trackNames)
	{
		[self.trackList addObject:trackName];
	}
	[self.tableView reloadData];
	
}

- (void)viewDidUnload
{
	self.tableView = nil;
	self.trackList = nil;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return trackList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellIdentifier = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (!cell)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kCellIdentifier] autorelease];
        
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.backgroundColor = [UIColor clearColor];
		cell.textLabel.opaque = NO;
		cell.textLabel.textColor = [UIColor blackColor];
		cell.textLabel.highlightedTextColor = [UIColor whiteColor];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
		
		cell.detailTextLabel.backgroundColor = [UIColor clearColor];
		cell.detailTextLabel.opaque = NO;
		cell.detailTextLabel.textColor = [UIColor grayColor];
		cell.detailTextLabel.highlightedTextColor = [UIColor whiteColor];
		cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    }
    cell.textLabel.text = [trackList objectAtIndex:indexPath.row];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSMutableDictionary *rowData = [self.trackList objectAtIndex:indexPath.row];
	//TODO - wire up the current playing track
	if (!self.analyzingViewController)
	{
        self.analyzingViewController = [[AnalyzingViewController alloc] 
								initWithNibName:@"AnalyzingViewController" bundle:nil];
    }
    [self.navigationController pushViewController:analyzingViewController animated:YES];
}

@end

