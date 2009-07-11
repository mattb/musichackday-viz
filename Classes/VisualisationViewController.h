//
// attach Demo
// a cocos2d example
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TrackSegmentInfo.h"
#import "CocosView.h"

//CLASS INTERFACE
@interface VisualizationViewController : UIViewController <AVAudioPlayerDelegate>
{
	int	state;
    AVAudioPlayer *player;
	TrackSegmentInfo *trackInfo;
	NSTimer *timer;
	CocosView *cocosView;
}

@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) TrackSegmentInfo *trackInfo;
@property (nonatomic, retain) CocosView *cocosView;
@property (nonatomic, retain) NSTimer *timer;

@end
