#import <BulletinBoard/BBWeeAppController.h>

@interface HBTGWeeAppController : NSObject <BBWeeAppController> {
	NSBundle *_bundle;
	NSArray *_shownToggles;
	UIView *_view;
	UIScrollView *_scrollView;
	UIImageView *_backgroundView;
}

@property (nonatomic, retain) UIView *view;
@end
