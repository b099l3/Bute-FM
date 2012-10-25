//
//  CustomDrawnCell.m
//  TableViewPerformance
//
//  Created by Mugunth Kumar on 7/11/11.
//

#import "CustomDrawnCell.h"

@implementation CustomDrawnCell

static UIFont *titleFont = nil;
static UIFont *subTitleFont = nil;
static UIFont *timeTitleFont = nil;


- (void)setTitle:(NSString*) aTitle subTitle:(NSString*) aSubTitle time:(NSString*) aTimeTitle thumbnail:(UIImage *)aThumbnail
{
    if (_title != aTitle) {
        _title = aTitle;        
    }
    
    if (_subTitle != aSubTitle) {
        _subTitle = aSubTitle;
    }

    if (_timeTitle != aTimeTitle) {
        _timeTitle = aTimeTitle;
    }

    if (_thumbnail != aThumbnail) {
        _thumbnail = aThumbnail;        
    }
    
    [self setNeedsDisplay];
}

+(void) initialize
{
    titleFont = [UIFont systemFontOfSize:20];
    subTitleFont = [UIFont systemFontOfSize:17];
    timeTitleFont = [UIFont systemFontOfSize:10];
}

+(void) dealloc
{
    [super dealloc];
}

-(void) drawContentView:(CGRect)r
{    
    static UIColor *titleColor;    
    titleColor = [UIColor darkTextColor];
    static UIColor *subTitleColor;    
    subTitleColor = [UIColor darkGrayColor];
    static UIColor *timeTitleColor;
    timeTitleColor = [UIColor whiteColor];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if(self.highlighted || self.selected)
	{
		CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
		CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
		CGContextSetFillColorWithColor(context, titleColor.CGColor);					
	}
	else
	{
		CGContextSetFillColorWithColor(context, timeTitleColor.CGColor);
		CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
		CGContextSetFillColorWithColor(context, titleColor.CGColor);					
	}
    
    [titleColor set];
    
    [_thumbnail drawInRect:CGRectMake(5, 5, 35, 35)];
    
    [_title drawAtPoint:CGPointMake(54, 10) 
                    forWidth:200 
                    withFont:titleFont 
                    fontSize:20 
          lineBreakMode: UILineBreakModeTailTruncation //NSLineBreakByTruncatingTail
          baselineAdjustment:UIBaselineAdjustmentAlignCenters];    

    [subTitleColor set];
    [_subTitle drawAtPoint:CGPointMake(200, 10) 
               forWidth:200 
               withFont:subTitleFont 
               fontSize:17 
          lineBreakMode:UILineBreakModeTailTruncation //NSLineBreakByTruncatingTail 
     baselineAdjustment:UIBaselineAdjustmentAlignCenters];    
}

- (void)removeStatus{
    
    [[UIColor whiteColor] set];
    [_subTitle drawAtPoint:CGPointMake(200, 10)
                  forWidth:200
                  withFont:subTitleFont
                  fontSize:17
             lineBreakMode:UILineBreakModeTailTruncation //NSLineBreakByTruncatingTail
        baselineAdjustment:UIBaselineAdjustmentAlignCenters];
}


@end
