//
//  RootViewController.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AnalyzingViewController.h"
#import "VisualisationViewController.h"

@interface RootViewController : UITableViewController {
	NSMutableArray *trackList;
    NSMutableArray *trackUrls;
	AnalyzingViewController *analyzingViewController;
	VisualizationViewController *visualizationViewController;
}
@property (nonatomic, retain) NSMutableArray *trackList;
@property (nonatomic, retain) NSMutableArray *trackUrls;
@property (nonatomic, retain) AnalyzingViewController *analyzingViewController;
@property (nonatomic, retain) VisualizationViewController *visualizationViewController;

@end
