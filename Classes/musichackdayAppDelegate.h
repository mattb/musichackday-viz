//
//  musichackdayAppDelegate.h
//  musichackday
//
//  Created by George Cook on 11/07/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

@interface musichackdayAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

