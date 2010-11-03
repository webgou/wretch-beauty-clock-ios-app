//
//  WretchClockAppDelegate.h
//  WretchClock
//
//  Created by Michael Su on 2010/11/4.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WretchClockViewController;

@interface WretchClockAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WretchClockViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WretchClockViewController *viewController;

@end

