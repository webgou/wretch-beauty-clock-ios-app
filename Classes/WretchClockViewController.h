//
//  WretchClockViewController.h
//  WretchClock
//
//  Created by Michael Su on 2010/11/4.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WretchClockViewController : UIViewController <UIWebViewDelegate> {
	UIWebView *clockWebView_;
	UIActivityIndicatorView *loadingView_;
}

@property (nonatomic, retain) IBOutlet UIWebView *clockWebView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *loadingView;

@end

