//
//  JaswaitAutoLayoutView.m
//  AutoLayoutContent
//
//  Created by Jasonwaiting on 30/4/14.
//  Copyright (c) 2014 jasonwaiting. All rights reserved.
//

#import "JaswaitAutoLayoutView.h"

@implementation JaswaitAutoLayoutView

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        /* Sub views */
        /* Content View with padding 10px */
        self.contentView = [[UIView alloc] init];
        [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
        //self.contentView.backgroundColor = [UIColor redColor];
        [self addSubview: self.contentView];
        
        /* Top-left corner view */
        self.imageView = [[UIImageView alloc] init];
        [self.imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.imageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.imageView];
        
        /* UISwitch */
        self.switchView = [[UISwitch alloc] init];
        [self.switchView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.switchView setOn:NO];
        [self.contentView addSubview:self.switchView];
        
        /* UITextView */
        self.textView = [[UITextView alloc] init];
        [self.textView setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.textView.text = @"1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20";
        self.textView.layer.borderWidth = 1.0f;
        self.textView.layer.borderColor = [[UIColor grayColor] CGColor];
        [self.contentView addSubview:self.textView];
        
        [self setConstraints];
    }
    return self;
}

-(void) setConstraints
{
    /* Constraints - contentView */
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:10.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:-10.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:30.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.0
                                                      constant:-20.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0
                                                      constant:-40.0f]];
    /* Constraints - Image View */
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.5
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:100.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0]];
    /* Constraints - Switch */
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.switchView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.switchView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.imageView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0]];
    /* Constraints - TextView */
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.imageView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:110.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textView
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:0.0]];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
