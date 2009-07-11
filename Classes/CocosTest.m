
#import "CocosTest.h"
@implementation CocosTest

enum {
	kTagSprite = 1,
};


-(id) init
{
	if( (self=[super init] ) )
	{
		self.isTouchEnabled = YES;
		
		CGSize s = [[Director sharedDirector] winSize];
		
		Sprite *grossini = [Sprite spriteWithFile:@"grossini.png"];
		Label *label = [Label labelWithString:[NSString stringWithFormat:@"%dx%d",(int)s.width, (int)s.height] fontName:@"Marker Felt" fontSize:28];
		
		[self addChild:label];
		[self addChild:grossini z:0 tag:kTagSprite];
		
		grossini.position = ccp( s.width/2, s.height/2);
		label.position = ccp( s.width/2, s.height-40);
		
		id sc = [ScaleBy actionWithDuration:2 scale:1.5f];
		id sc_back = [sc reverse];
		[grossini runAction: [RepeatForever actionWithAction:
							  [Sequence actions: sc, sc_back, nil]]];
	}
	return self;
}
@end