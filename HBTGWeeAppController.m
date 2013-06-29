#import "HBTGWeeAppController.h"
#import <Flipswitch/Flipswitch.h>

#define kHBTGToggleWidth 52.f
#define kHBTGToggleHeight 40.f
#define kHBTGSpaceWidth 1.f

@implementation HBTGWeeAppController
@synthesize view = _view;

- (id)init {
	self = [super init];

	if (self) {
		_bundle = [[NSBundle bundleForClass:self.class] retain];
	}

	return self;
}

- (float)viewHeight {
	return kHBTGToggleHeight + 4.f;
}

- (void)loadPlaceholderView {
	_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 316.f, self.viewHeight)];
	_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

	UIImage *backgroundImage = [UIImage imageWithContentsOfFile:[_bundle pathForResource:@"WeeAppBackground" ofType:@"png"]];
	_backgroundView = [[UIImageView alloc] initWithImage:[backgroundImage stretchableImageWithLeftCapWidth:backgroundImage.size.width / 2.f topCapHeight:backgroundImage.size.height / 2.f]];
	_backgroundView.frame = CGRectInset(_view.frame, 2.f, 0);
	_backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[_view addSubview:_backgroundView];

	_scrollView = [[UIScrollView alloc] initWithFrame:_backgroundView.frame];
	_scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	_scrollView.pagingEnabled = YES;
	_scrollView.scrollsToTop = NO;
	_scrollView.showsHorizontalScrollIndicator = NO;
	[_view addSubview:_scrollView];

	float left = 0;

	for (NSString *identifier in [NSArray arrayWithObjects:@"com.a3tweaks.switch.airplane-mode", @"com.a3tweaks.switch.wifi", @"com.a3tweaks.switch.rotation", @"com.a3tweaks.switch.vibration", @"com.a3tweaks.switch.respring", @"com.a3tweaks.switch.flashlight", nil]) {
		UIButton *toggle = [[FSSwitchPanel sharedPanel] buttonForSwitchIdentifier:identifier usingTemplate:_bundle];
		toggle.frame = CGRectMake(left, 0, kHBTGToggleWidth, kHBTGToggleHeight);
		toggle.showsTouchWhenHighlighted = YES;
		[_scrollView addSubview:toggle];

		left += kHBTGToggleWidth + kHBTGSpaceWidth;
	}

	_scrollView.contentSize = CGSizeMake(left, _scrollView.frame.size.height);
}

- (void)unloadView {
	[_view release];
	_view = nil;
	[_backgroundView release];
	_backgroundView = nil;
	[_scrollView release];
	_scrollView = nil;
}

- (void)dealloc {
	[_view release];
	[_backgroundView release];
	[_scrollView release];
	[_bundle release];
	[_shownToggles release];
	[super dealloc];
}
@end
