//
// attach Demo
// a cocos2d example
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

//CLASS INTERFACE
@interface VisualizationViewController : UIViewController <AVAudioPlayerDelegate>
{
	int	state;
    AVAudioPlayer *player;
}

@property (nonatomic, retain) AVAudioPlayer *player;
@end
