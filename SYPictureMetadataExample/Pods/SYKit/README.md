SYKit
=======


Some useful categories and other classes on UIKit and Foundation


####UIDevice+SYCategories

Obtain an enum value representing the current device model:

	+ (UIDeviceModel)sy_deviceModelFromHardwareString:(NSString *)value;
	+ (UIDeviceModel)sy_deviceModelFromModelNumber:(NSString *)value;
	- (UIDeviceModel)sy_deviceModel;
	- (BOOL)sy_isIpad;

	// UIDeviceModeliPhone5C
	[UIDevice sy_deviceModelFromHardwareString:@"iPhone5,4"]


Help you identifying if the current device supports well blurring views. For now this isn't customizable. I used reports found on the web of people using `FXBlurView` but feel free to send a push request if you want to remove or add a model. The iOS version is not used, only the device model. Models where blurring is too slow for use:

	UIDeviceModeliPodTouch1G
	UIDeviceModeliPodTouch2G
	UIDeviceModeliPodTouch3G
	UIDeviceModeliPodTouch4G
	
	UIDeviceModeliPhone
	UIDeviceModeliPhone3G
	UIDeviceModeliPhone3GS
	UIDeviceModeliPhone4
	UIDeviceModeliPhone4S
	
	UIDeviceModeliPad1
	UIDeviceModeliPad3
 
	- (BOOL)sy_shouldSupportViewBlur;


Methods to access and use the iOS version string:

	- (NSString*)sy_systemVersionCached;

	- (BOOL)sy_iOSisEqualTo:(NSString *)version;
	- (BOOL)sy_iOSisGreaterThan:(NSString *)version;
	- (BOOL)sy_iOSisGreaterThanOrEqualTo:(NSString *)version;
	- (BOOL)sy_iOSisLessThan:(NSString *)version;
	
	+ (BOOL)sy_iOSis6Plus;
	+ (BOOL)sy_iOSis7Plus;
	+ (BOOL)sy_iOSis8Plus;

####UIScreen+SYCategories

In iOS8 Apple changed the behavior of `-[UIScreen bounds]` method. It used to return the size of the screen independently of the interface orientation, but this is no longer the case. The following method restores this behavior:

	- (CGRect)sy_boundsFixedToPortraitOrientation;

If like me you still support old iOS versions and therefore don't use auto-layout this method allows you to obtain the usable scree, size as a frame with some options:

	- (CGRect)sy_screenRectForOrientation:(UIInterfaceOrientation)orientation
    	   showStatusBarOnIphoneLandscape:(BOOL)showStatusBarOnIphoneLandscape
        	      ignoreStatusBariOSOver7:(BOOL)ignoreStatusBariOSOver7;


####SYScreenHelper

Wrapper around `UIScreen (SYCategories)` methods to create frames representing the full screen or usable screen space (uses y offset to ignore iOS7+ statys bar). 

It uses a gcd-based singleton to keep a shared instance. A single property can be changed: `BOOL showStatusBarOnIphoneLandscape`. It controls whether or not the iOS status bar will be hidden or not on an iPhone in landscape.

Methods:

	- (void)sy_updateStatusBarVisibility:(UIInterfaceOrientation)orientation animated:(BOOL)animated;
	- (CGRect)sy_screenRect:(UIInterfaceOrientation)orientation; // has offset (origin.y != 0) on iOS >= 7
	- (CGRect)sy_fullScreenRect:(UIInterfaceOrientation)orientation; // ignores status bar

####CGTools

Contains C functions to work with `CGRect`s

	CGRect CGRectCenteredInsideRectWithSize(CGRect inside, CGSize size, BOOL fromOutside);
	CGRect CGRectCenteredSquarreInsideRectWithSize(CGRect inside, CGFloat size, BOOL fromOutside);
	CGRect CGRectInsetPercent(CGRect rect, CGFloat percentX, CGFloat percentY);

####UIImage+SYKit

Some methods to play with images, mainly to create resized copies of images or new images from a plain color

	// convert an image to an iOS6 like bar button image
	- (UIImage *)sy_imageWithToolbarButtonStyling;

	// mask an image with another color. the image needs to have an alpha channel
	- (UIImage *)sy_imageMaskedWithColor:(UIColor *)maskColor;

	// create a new 1x1 image with the given color
	+ (UIImage *)sy_imageWithColor:(UIColor *)color;

	// create a new image with the given color, size and corner radius
	+ (UIImage *)sy_imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

	// rotate an image with an arbitrary angle
	- (UIImage *)sy_imageWithAngle:(CGFloat)angle;

	// create a new image from the receiver by adding transparent padding
	- (UIImage *)sy_imageByAddingPaddingTop:(CGFloat)top
	                                   left:(CGFloat)left
	                                  right:(CGFloat)right
	                                 bottom:(CGFloat)bottom;

	// resize image to new size, without checking if the new image will be distrorted or not
	- (UIImage *)sy_imageResizedTo:(CGSize)size;
	
	// resize image to a new squarre size
	- (UIImage *)sy_imageResizedSquarreTo:(CGFloat)size;
	
	// resize image with correct ascpect to a new height
	- (UIImage *)sy_imageResizedHeightTo:(CGFloat)height;
	
	// resize image with correct ascpect to a new width
	- (UIImage *)sy_imageResizedWidthTo:(CGFloat)width;

	// access image size without loading it into memory
	+ (CGSize)sy_sizeOfImageAtURL:(NSURL *)url


####SYSearchBar

Simple reproduction of iOS Safari search/URL bar. There is no simple way to customize this yet, but if you need just ask me and I'll update with some customization methods.

	@interface SYSearchField : UIView
	
	@property (nonatomic, strong) NSURL *displayedURL;
	@property (nonatomic, weak) IBOutlet id<SYSearchFieldDelegate> delegate;
	
	- (void)showLoadingIndicator:(BOOL)showLoadingIndicator;
	
	@end


####SYButton

Button class to look a bit like material design buttons, ya know the round ones with a drop shadow — oO — ya, those.

	@interface SYButton : UIControl
	
	@property (nonatomic, strong) NSString *text;
	@property (nonatomic, assign) CGFloat contentInset;
	@property (nonatomic, assign) CGFloat fontSize;
	@property (nonatomic, assign) CGFloat textVOffset;
	@property (nonatomic, strong) UIColor *backColor;
	@property (nonatomic, strong) UIColor *selectedBackColor;
	
	@end

####SYShapeView and SYGradientView

`UIView` subclasses that changes the type of the layer to `CAShapeLayer` and `CAGradientLayer`, and allowing you to update the shape/gradient using its `layoutSubviewsBlock` block.

######SYShapeView.h

	@interface SYShapeView : UIView
	
	@property (nonatomic, readonly, strong) CAShapeLayer *layer;
	
	// will use clearColor for the view background and set/get 
	// backgroundColor will become a proxy to the layer's fillColor
	// super usefull for UITableViewCell selectedBackgroundView for instance
	@property (nonatomic, assign) BOOL useBackgroundColorAsFillColor;
	
	// will be called right after [super layoutSubviews]
	@property (nonatomic, copy) void(^layoutSubviewsBlock)(SYShapeView *view);
	
	@end

######SYGradientView.h

	@interface SYGradientView : UIView

	@property (nonatomic, readonly, strong) CAGradientLayer *layer;
	@property (nonatomic, copy) void(^layoutSubviewsBlock)(SYShapeView *view);

	@end

####UIButton+SYKit

Category on `UIButton` to add some new features.

	// creates a 1x1 image of color buttonColor and associates it as a background for the given state
	-(void)sy_setButtonBackgroundColor:(UIColor *)buttonColor forState:(UIControlState)state;

####UIView+SYKit

	@interface UIView (SYKit)
	
	// override `pointInside:withEvent:` to "grow" your view touch areas outside of their natural bounds.
	@property (nonatomic, assign) UIEdgeInsets sy_tapInsets;
	
	// find all subviews of a given class
	- (NSArray <UIView *> *)sy_findSubviewsOfClass:(Class)class recursive:(BOOL)recursive;
	
	@end

####NSObject+SYKit

Adds to methods to work with swizzling object methods, executing a block on a specific `NSThread` and obtaining a class name as `NSString` easily.

	@interface NSObject (SYKit)

	- (void)sy_performBlock:(void(^)(void))block onThread:(NSThread *)thread;
	+ (void)sy_swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector;
	+ (BOOL)sy_instance:(id)instance overridesSelector:(SEL)selector;
	
	+ (NSString *)sy_className;
	+ (NSString *)sy_className;

	@end

####UITableViewCell+SYKit

Adds some help to compute a cell height using auto layout. Implementation may not be perfect, feel free to send PR my way if you have any suggestion.

	@interface UITableViewCell (SYKit)

	+ (CGFloat)sy_cellHeightForWidth:(CGFloat)width
    	          configurationBlock:(void(^)(UITableViewCell *sizingCell))configurationBlock;

	@end

####SYWindow

`UIWindow` subclass allowing for easy creation of a the main window and ability to shake the device while in debug to slow down animations.

####NSData+SYKit

Could be helpful to determine if a `NSData` is complete or not. For instance when showing all images in a folder but files are still being transfered.

	@interface NSData (SYKit)

	- (BOOL)sy_imageDataIsValidPNG;
	- (BOOL)sy_imageDataIsValidJPEG;

	@end


####NSString+SYKit

	@interface NSString (SYKit)
	
	/**
	 *  Returns a string without the white and new line characters at beginning and ending
	 *
	 *  @return Trimmed string
	 */
	- (instancetype)sy_stringByTrimmingWhiteCharacters;
	
	@end


####NSAttributedString+SYKit

Various methods to created new attributed strings, concatenate them, and estimate their size when displayed.

	@interface NSAttributedString (SYKit)
	
	+ (NSAttributedString *)sy_stringWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;
	+ (NSAttributedString *)sy_stringWithStrings:(NSArray <NSAttributedString *> *)strings;
	+ (NSAttributedString *)sy_stringWithStrings:(NSArray <NSAttributedString *> *)strings addLineBreak:(BOOL)addLineBreak;
	
	- (CGSize)sy_sizeInBoundingSize:(CGSize)size;
	- (CGSize)sy_sizeInBoundingWidth:(CGFloat)width;
	
	@end

####NSLayoutConstraint+SYKit

Create autolayout constraints quickly. Definitely not the best option out here, but it prevents the need to have `Masonry` or similar as a dependency of this library.

	@interface NSLayoutConstraint (SYKit)
	
	+ (instancetype)sy_equalConstraintWithItems:(NSArray *)items
	                                  attribute:(NSLayoutAttribute)attribute;
	
	+ (instancetype)sy_equalConstraintWithItems:(NSArray *)items
	                                  attribute:(NSLayoutAttribute)attribute
	                                     offset:(CGFloat)offset;
	
	+ (instancetype)sy_equalConstraintWithItems:(NSArray *)items
	                                 attribute1:(NSLayoutAttribute)attribute1
	                                 attribute2:(NSLayoutAttribute)attribute2
	                                     offset:(CGFloat)offset;
	
	+ (instancetype)sy_constraintWithItems:(NSArray *)items
	                             attribute:(NSLayoutAttribute)attribute
	                             relatedBy:(NSLayoutRelation)relation
	                                offset:(CGFloat)offset;
	
	+ (instancetype)sy_constraintWithItems:(NSArray *)items
	                            attribute1:(NSLayoutAttribute)attribute1
	                            attribute2:(NSLayoutAttribute)attribute2
	                             relatedBy:(NSLayoutRelation)relation
	                                offset:(CGFloat)offset;

	@end


####UIScrollView+SYKit

Gives the ability to know when the `contentSize` has changed. Tested on `UICollectionView` and `UITextView`.

	@interface UIScrollView (SYKit)

	- (void)sy_setContentSizeChangedBlock:(void(^)(CGSize newSize))block;

	@end

Common use case: keep the size of a `UITextView` or `UICollectionView` equal to its content height.

    [self.collectionView sy_setContentSizeChangedBlock:^(CGSize newSize) {
        [self.collectionViewHeightConstraint setConstant:newSize.height];
    }];


	// Because the reported contentSize's height is wrong we compute it
	// ourself using NSAtttributedString+SYKit methods
	
    [self.labelDetails sy_setContentSizeChangedBlock:^(CGSize newSize) {
        [self.labelDetailsHeightConstraint setConstant:
         [self.labelDetails.attributedText sy_sizeInBoundingWidth:newSize.width].height];
    }];

License
===

Use it as you like in every project you want, redistribute with mentions of my name and don't blame me if it breaks :)

-- dvkch
 
