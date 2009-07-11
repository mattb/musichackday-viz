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
    NSString *mp3Filename;
}

@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) TrackSegmentInfo *trackInfo;
@property (nonatomic, retain) CocosView *cocosView;
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) NSString *mp3Filename;

@end
