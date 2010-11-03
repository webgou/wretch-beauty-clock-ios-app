//
//  WretchClockViewController.m
//  WretchClock
//
//  Created by Michael Su on 2010/11/4.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WretchClockViewController.h"

@implementation WretchClockViewController

@synthesize clockWebView = clockWebView_;
@synthesize loadingView = loadingView_;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// TRANSFORM from 200x360 to 320*480
	CGAffineTransform transform = CGAffineTransformMakeScale(1.3,1.3);
	transform = CGAffineTransformTranslate(transform, 60, 60);
	[self.clockWebView setTransform:transform];
	
	// BACKGROUND
	[self.clockWebView setBackgroundColor:[UIColor clearColor]];
	
	// DELEGATE
	[self.clockWebView setDelegate:self];
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	// CLOCK HTML
	NSStringEncoding enc;
	NSError *err;
	NSString *clockHTML = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"clock.html" ofType:nil]
												usedEncoding:&enc
													   error:&err];
	[self.clockWebView loadHTMLString:clockHTML baseURL:[NSURL URLWithString:@"http://tw.yahoo.com/"]];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.clockWebView = nil;
	self.loadingView = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark UIWebViewDelegate
- (void) webViewDidStartLoad:(UIWebView *)webView {
	[self.loadingView startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
	[self.loadingView stopAnimating];
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	return YES;
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
}

@end
