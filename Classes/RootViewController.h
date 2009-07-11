//
//  RootViewController.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AnalyzingViewController.h"

@interface RootViewController : UITableViewController {
	NSMutableArray *trackList;
	AnalyzingViewController *analyzingViewController;
}
@property (nonatomic, retain) NSMutableArray *trackList;
@property (nonatomic, retain) AnalyzingViewController *analyzingViewController;

@end
