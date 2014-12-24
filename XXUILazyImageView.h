//
//  XXUILazyImageView.h
//  XXUILazyImageView
//
//  Created by Xiao Xiao on 12/22/14.
//  Copyright (c) 2014 SeanLionheart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXUILazyImageView : UIImageView<NSURLConnectionDataDelegate>

- (instancetype)initWithFrame:(CGRect)rect imageURL:(NSURL *)imageURL;

- (void)cancel;

@property (nonatomic, retain) UIView *failureView;

@property (nonatomic, retain) UIView *loadingView;

@end
