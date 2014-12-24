//
//  XXUILazyImageView.m
//  XXUILazyImageView
//
//  Created by Xiao Xiao on 12/22/14.
//  Copyright (c) 2014 SeanLionheart. All rights reserved.
//

#import "XXUILazyImageView.h"

@implementation XXUILazyImageView {
    UIActivityIndicatorView *_activityIndicator;
    NSMutableData *_imageData;
    NSURL *_imageURL;
    NSURLConnection *_imageConnection;
    BOOL _isLoading;
}

- (instancetype)initWithFrame:(CGRect)rect imageURL:(NSURL *)imageURL
{
    self = [super initWithFrame:rect];
    if (self) {
        _imageData = [NSMutableData data];
        _imageURL = imageURL;
    }
    return self;
}

- (void)cancel
{
    if (_isLoading) {
        [_imageConnection cancel];
        [self endLoading];
        [self displayError];
    }
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    [self startLoading];
}

- (void)startLoading
{
    _isLoading = YES;
    NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:_imageURL];
    _imageConnection = [[NSURLConnection alloc] initWithRequest:imageRequest delegate:self];
    [_imageConnection start];
    if (self.loadingView) {
        [self addSubview:self.loadingView];
    } else {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicator.center = self.center;
        [_activityIndicator startAnimating];
        [self addSubview:_activityIndicator];
    }
}

- (void)endLoading
{
    _isLoading = NO;
    if (self.loadingView) {
        [self.loadingView removeFromSuperview];
    } else {
        [_activityIndicator removeFromSuperview];
    }
}

- (void)displayImage
{
    [self setImage:[UIImage imageWithData:_imageData]];
}

- (void)displayError
{
    if (self.failureView) {
        [self addSubview:self.failureView];
    }
}

#pragma -mark NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    NSInteger code = [httpResponse statusCode];
    if (code >= 400) {
        [self endLoading];
        [self displayError];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_imageData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self endLoading];
    [self displayImage];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self endLoading];
    [self displayError];
}

@end
