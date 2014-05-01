//
//  JaswaitImagePickerViewController.m
//  ImagePicker
//
//  Created by Jasonwaiting on 1/5/14.
//  Copyright (c) 2014 jasonwaiting. All rights reserved.
//

#import "JaswaitImagePickerViewController.h"

@interface JaswaitImagePickerViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *loadImageBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic) UIImagePickerController *imagePickerController;

- (void) scrollViewDoubleTapped:(UITapGestureRecognizer *) recognizer;
- (void) handleSwipeUpFrom:(UISwipeGestureRecognizer *) recognizer;

@end

@implementation JaswaitImagePickerViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];

    self.loadImageBtn.action = @selector(showImagePickerFromLibrary);
    self.loadImageBtn.target = self;
    
    self.imageScrollView.delegate = self;
    self.imageScrollView.maximumZoomScale = 20.0f;
    
    [self setupGestureRecognizer];
}

- (void) setupGestureRecognizer
{
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(scrollViewDoubleTapped:)];
    doubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapRecognizer.numberOfTouchesRequired = 1;
    [self.imageScrollView addGestureRecognizer:doubleTapRecognizer];
    
    UISwipeGestureRecognizer* swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                           action:@selector(handleSwipeUpFrom:)];
    swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.imageScrollView addGestureRecognizer:swipeUpGestureRecognizer];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshZoomScale];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.imageView = nil;
}

- (void) showImagePickerFromLibrary
{
    NSLog(@"Enter showImagePickerFromLibrary");

    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    self.imagePickerController = imagePickerController;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"Enter imagePickerController delegate");
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self setNewImage:image];
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.imagePickerController = nil;
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (CGFloat) getMinZoomScale: (UIScrollView *) scrollView
{
    CGFloat scaleWidth = scrollView.frame.size.width / scrollView.contentSize.width;
    CGFloat scaleHeight = scrollView.frame.size.height / scrollView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    NSLog (@"Minimum Scale: %f", minScale);
    return minScale;
}

- (CGFloat) getDefaultScale: (UIScrollView *) scrollView
{
    CGFloat scaleWidth = scrollView.frame.size.width / scrollView.contentSize.width;
    CGFloat scaleHeight = scrollView.frame.size.height / scrollView.contentSize.height;
    CGFloat maxScale = MAX(scaleWidth, scaleHeight);
    NSLog (@"Default Scale: %f", maxScale);
    return maxScale;
}

- (void) setNewImage: (UIImage *) image
{
    [self.imageView removeFromSuperview];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView setImage:image];
    imageView.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=image.size};
    self.imageView = imageView;
    
    [self.imageScrollView addSubview:self.imageView];
    self.imageScrollView.contentSize = image.size;
    
}

- (void) refreshZoomScale
{
    self.imageScrollView.minimumZoomScale = [self getMinZoomScale:self.imageScrollView];
    self.imageScrollView.zoomScale = [self getDefaultScale:self.imageScrollView];
}

- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer
{
    [self.imageScrollView setZoomScale:1.0f animated:YES];
}

- (void) handleSwipeUpFrom:(UISwipeGestureRecognizer *) recognizer
{
    [self showImagePickerFromLibrary];
}


@end