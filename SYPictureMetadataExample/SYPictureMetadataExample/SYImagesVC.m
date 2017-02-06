//
//  SYImagesVC.m
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 06/02/2017.
//  Copyright © 2017 Syan. All rights reserved.
//

#import "SYImagesVC.h"
#import "SYImageVC.h"

@interface SYImagesVC () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (nonatomic, assign) NSUInteger nextIndex;
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, strong) NSArray <NSURL *> *URLs;
@end

@implementation SYImagesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setDataSource:self];
    [self setDelegate:self];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor darkGrayColor]];
    
    NSString *rootPath = [[NSBundle mainBundle] pathForResource:@"Test images" ofType:nil];
    NSArray <NSString *> *imageNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:rootPath error:NULL];
    
    NSMutableArray <NSURL *> *URls = [NSMutableArray array];
    for (NSString *imageName in imageNames)
    {
        NSURL *picUrl = [NSURL fileURLWithPath:[rootPath stringByAppendingPathComponent:imageName]];
        [URls addObject:picUrl];
    }
    self.URLs = [URls copy];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self openIndex:0 animated:NO forceForwardAnimation:NO];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Data

- (void)setURLs:(NSArray<NSURL *> *)URLs
{
    self->_URLs = URLs;
    [self openIndex:self.currentIndex animated:NO forceForwardAnimation:NO];
}

- (SYImageVC *)viewControllerAtIndex:(NSUInteger)index
{
    if (!self.URLs.count)
        return nil;
    
    if (index >= self.URLs.count)
        return nil;
    
    NSURL *url = self.URLs[index];
    
    SYImageVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(SYImageVC.class)];
    [vc setPictureURL:url];
    [vc setIndex:index];
    
    return vc;
}

#pragma mark - Actions

- (void)openIndex:(NSUInteger)index animated:(BOOL)animated forceForwardAnimation:(BOOL)forceForwardAnimation
{
    UIViewController *vc = [self viewControllerAtIndex:index];
    if (!vc)
        return;
    
    UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
    if (index < self.currentIndex && !forceForwardAnimation) // going backwards
        direction = UIPageViewControllerNavigationDirectionReverse;
    
    self.currentIndex = index;
    [self setViewControllers:@[vc] direction:direction animated:animated completion:nil];
}

- (void)setCurrentIndex:(NSUInteger)currentIndex
{
    self->_currentIndex = currentIndex;
    [self.navigationItem setTitle:self.URLs[currentIndex].lastPathComponent];
}

#pragma mark - PageController Data Source

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    // disable infinity scroll when only has a single item
    if (self.URLs.count == 1)
        return nil;
    
    SYImageVC *prevVC = (SYImageVC *)viewController;
    return [self viewControllerAtIndex:prevVC.index - 1];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    // disable infinity scroll when only has a single item
    if (self.URLs.count == 1)
        return nil;
    
    SYImageVC *prevVC = (SYImageVC *)viewController;
    return [self viewControllerAtIndex:prevVC.index + 1];
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
    SYImageVC *vc = (SYImageVC *)[pendingViewControllers firstObject];
    self.nextIndex = vc.index;
}

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray <UIViewController *> *)previousViewControllers
       transitionCompleted:(BOOL)completed
{
    if (completed)
        self.currentIndex = self.nextIndex;
    
    self.nextIndex = 0;
}
@end
