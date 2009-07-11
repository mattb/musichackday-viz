/*
 * Copyright 2009 Ullrich Schäfer, Gernot Poetsch for SoundCloud Ltd.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * For more information and documentation refer to
 * http://soundcloud.com/api
 * 
 */

#import <Foundation/Foundation.h>

// Domain of errors coming from a call to the SoundCloutAPI
#define SCAPIErrorDomain				@"SoundCloudAPIError"

// If the code of the error is SCAPIErrorHttpResponseError you can find the original HTTPError under this Key in the userInfo
#define SCAPIHttpResponseErrorStatusKey	@"httpErrorStatus"

enum {
	SCAPIErrorNotAuthenticted =			-1001,
	SCAPIErrorHttpResponseError =		-2001
};
