//
//  RootViewController.m
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "TrackSegmentInfo.h"
#import "GTMHTTPFetcher.h"
#import "NSString+SBJSON.h"
@interface RootViewController(Private)
-(void) startVisualization: (NSNotification *)notification;
-(void) visualizeTrack;
-(void) analyzeTrack:(NSString *)url;

@end


@implementation RootViewController
@synthesize trackUrls, trackList, analyzingViewController, visualizationViewController;
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
    self.trackUrls = [NSMutableArray array];
    if (!trackNames)
	{
		trackNames = [[NSArray alloc] initWithObjects:@"loading...", nil];
    }

    for (NSString *trackName in trackNames)
	{
		[self.trackList addObject:trackName];
	}
	[self.tableView reloadData];	

	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(startVisualization:)
												 name:@"startVisualization" object:nil];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.soundcloud.com/users/thesmith/tracks.json"]];
    GTMHTTPFetcher* myFetcher = [GTMHTTPFetcher httpFetcherWithRequest:request];
    [myFetcher setCredential:[NSURLCredential credentialWithUser:@"mattb" password:@"biddulph" persistence:NSURLCredentialPersistenceNone]];
    [myFetcher beginFetchWithDelegate:self
					didFinishSelector:@selector(myFetcher:finishedWithData:)
                      didFailSelector:@selector(myFetcher:failedWithError:)];
    
}

- (void)myFetcher:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)data {
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *tracks = [json JSONValue];
    [self.trackList removeAllObjects];
    [self.trackUrls removeAllObjects];
    for(NSDictionary *track in tracks) {
        NSString *title = [track objectForKey:@"title"];
        if([track objectForKey:@"download_url"] != nil) {
            [self.trackList addObject:title];
            [self.trackUrls addObject:[track objectForKey:@"download_url"]];
        } else {
            NSLog(@"%@ is not downloadable.");
        }
	}
	[self.tableView reloadData];
}

- (void)myFetcher:(GTMHTTPFetcher *)fetcher failedWithError:(NSError *)error {
	NSLog(@"ERROR: %@", error);
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
	[self analyzeTrack:[trackUrls objectAtIndex:indexPath.row]];
}
-(void) analyzeTrack:(NSString *)url {
	if (!self.analyzingViewController)
	{
        self.analyzingViewController = [[AnalyzingViewController alloc] 
										initWithNibName:@"AnalyzingViewController" bundle:nil];
    }
    self.analyzingViewController.url = url;
    [self.navigationController pushViewController:analyzingViewController animated:YES];
}

-(void) startVisualization: (NSNotification *)notification{
	if (!self.visualizationViewController)
	{
        self.visualizationViewController = [[VisualizationViewController alloc] 
										initWithNibName:@"VisualizationViewController" bundle:nil];
    }
    TrackSegmentInfo *info = [notification object];
	self.visualizationViewController.trackInfo = info;
	self.visualizationViewController.mp3Filename = info.fileName;
    [self.navigationController pushViewController:visualizationViewController animated:YES];
}

@end

