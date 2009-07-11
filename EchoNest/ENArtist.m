//
//  ENArtist.m
//  EchoNest
//
//  Created by Kamel Makhloufi on 17/06/09.
//  Copyright 2009 melka. All rights reserved.
//

#import "ENArtist.h"


@implementation ENArtist

- (id) initWithArtistId:(NSString*)artistID {
	self = [super init];
	if (self != nil) {
		NSLog(@"%@",artistID);
	}
	return self;
}

@end
