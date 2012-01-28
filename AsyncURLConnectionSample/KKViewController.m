//
//  KKViewController.m
//  AsyncURLConnectionSample
//
//  Created by 憲治 衣川 on 12/01/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KKViewController.h"
#import "AsyncURLConnection.h"

@implementation KKViewController
@synthesize imageView1_;
@synthesize imageView2_;
@synthesize imageView3_;
@synthesize imageView4_;
@synthesize imageView5_;
@synthesize imageView6_;
@synthesize imageView7_;
@synthesize imageView8_;
@synthesize imageView9_;
@synthesize imageView10_;
@synthesize imageView11_;
@synthesize imageView12_;
@synthesize imageView13_;
@synthesize imageView14_;
@synthesize imageView15_;
@synthesize imageView16_;
@synthesize imageView17_;
@synthesize imageView18_;
@synthesize imageView19_;
@synthesize imageView20_;
@synthesize imageView21_;
@synthesize imageView22_;
@synthesize imageView23_;
@synthesize imageView24_;
@synthesize imageView25_;
@synthesize imageView26_;
@synthesize imageView27_;
@synthesize imageView28_;
@synthesize imageView29_;
@synthesize imageView30_;
@synthesize imageView31_;
@synthesize imageView32_;
@synthesize imageView33_;
@synthesize imageView34_;
@synthesize imageView35_;
@synthesize imageView36_;
@synthesize imageView37_;
@synthesize imageView38_;
@synthesize imageView39_;
@synthesize imageView40_;
@synthesize imageView41_;
@synthesize imageView42_;
@synthesize imageView43_;
@synthesize imageView44_;
@synthesize imageView45_;
@synthesize imageView46_;
@synthesize imageView47_;
@synthesize imageView48_;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)funcWithImageView:(UIImageView *)imageView{
    NSString * url = @"http://theinterviews.jp/theme/header/57/L_c898590df12b1b7a657b6d2c67392d18.jpg";
    [AsyncURLConnection request:url completeBlock:^(NSData *data) {
        
        /* success! */
        NSLog(@"success!");
        [AsyncURLConnection dispatchAsyncTaskOnGlobalQueue:^{
            
            /* process downloaded data in Concurrent Queue */            
            [AsyncURLConnection dispatchAsyncTaskOnMainQueue:^{
                
                /* update UI on Main Thread */
                [imageView setImage: [UIImage imageWithData:data]];
                
            }];            
        }];
        
    } errorBlock:^(NSError *error) {
        
        /* error! */
        
    }];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray * array = [NSArray arrayWithObjects:
                       self.imageView1_,
                       self.imageView2_,
                       self.imageView3_,
                       self.imageView4_,
                       self.imageView5_,
                       self.imageView6_,
                       self.imageView7_,
                       self.imageView8_,
                       self.imageView9_,
                       self.imageView10_,
                       self.imageView11_,
                       self.imageView12_,
                       self.imageView13_,
                       self.imageView14_,
                       self.imageView15_,
                       self.imageView16_,
                       self.imageView17_,
                       self.imageView18_,
                       self.imageView19_,
                       self.imageView20_,
                       self.imageView21_,
                       nil];
    
    for (UIImageView * imageView in array) {
        [self funcWithImageView:imageView];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
