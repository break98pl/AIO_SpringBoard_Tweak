#import "AlderisColorPicker.h"

@interface SBIconView : UIView
@property (nonatomic,copy) NSString * location;
@end

@interface MTMaterialLayer : CALayer
@property (nonatomic, copy, readwrite) NSString *recipeName;
@property (atomic, assign, readonly) CGRect visibleRect;
@end

@interface CALayer ()
@property (atomic, assign, readwrite) id unsafeUnretainedDelegate;
@end

//Change Notification Center Name
%hook NCNotificationListSectionHeaderView
-(void)setTitle:(NSString *)arg1{
	%orig(@"Trung tâm phiền toái");
}
%end

//NoLiveClock
%hook SBHClockApplicationIconImageView
-(void) _setAnimating:(bool) value{
	%orig(false);
}
-(void)_updateUnanimatedWithComponents:(id)arg1{
}
%end

//Change Label Icon & Background
%hook SBMutableIconLabelImageParameters
-(void)setFocusHighlightColor:(UIColor *)arg1{
	%orig([UIColor colorWithRed:0.96 green:0.98 blue:0.86 alpha:1.0]);
}
-(void)setTextColor:(UIColor *)arg1{
	%orig([UIColor colorWithRed:0.35 green:0.11 blue:0.00 alpha:1.0]);
}
%end

//Change carrier name
%hook STMutableTelephonySubscriptionInfo
-(void)setOperatorName:(NSString *)arg1{
	%orig(@"Tờ Rung");
}
%end

//Disable Emergency Call
%hook SBTelephonyManager
-(BOOL)emergencyCallSupported{
	return false;
}
%end

//Change home bar width height
%hook MTLumaDodgePillSettings
-(double)height{
	return (double)(5);
}
-(void)setHeight:(double)arg1{
	%orig((double)(5));
}

-(void)setMinWidth:(double)arg1{
	%orig((double)(45.8));
}

-(void)setMaxWidth:(double)arg1{
	%orig((double)(45.8));
}

-(double)maxWidth{
    return (double)(45.8);
}

-(double)minWidth{
    return (double)(45.8);
}
%end

//Change swipe to unlock
%hook CSTeachableMomentsContainerViewController
-(void)_updateText:(id)arg1{
	%orig(@"Tờ Rung ✌🏻");
}
%end

//Change passcode text
%hook SBUIPasscodeLockViewWithKeypad
-(void)updateStatusText:(id)arg1 subtitle:(id)arg2 animated:(BOOL)arg3{
	%orig(@"Xin cái Pass 😒", arg2, arg3);
}
%end

//Change dot beta testflight location
%hook SBIconView
-(CGRect)_frameForLabelAccessoryViewWithLabelFrame:(CGRect)arg1 labelImage:(id)arg2 labelImageParameters:(id)arg3 imageFrame:(CGRect)arg4{
	CGRect orig = %orig();
  	if(![self.location containsString:@"Dock"]){
		orig.origin.x = 28;
		orig.origin.y = orig.origin.y + 14;
  	}
	return orig;
}
%end

//Round CC

CGFloat calculatedRadius(CGRect visibleRect, CGFloat radius) {
    CGFloat width = visibleRect.size.width;
    CGFloat height = visibleRect.size.height;

	if (CGSizeEqualToSize(visibleRect.size, [UIScreen mainScreen].bounds.size) || width <= 60 || height <= 60) {
        return radius;
    }

    if (width == height && height <= 80) {
        return width / 2;
    }

    return radius;
}

%hook MTMaterialLayer
- (CGFloat)cornerRadius {
    NSArray <NSString *> *titles = @[@"modules", @"moduleFill.highlight.generatedRecipe"];

    if (![titles containsObject:self.recipeName]) {
        return %orig;
    }
    return calculatedRadius(self.visibleRect, %orig);
}
%end

%hook CALayer
- (CGFloat)cornerRadius {
    if (![self.superlayer.unsafeUnretainedDelegate isKindOfClass:NSClassFromString(@"CCUIButtonModuleView")]) {
        return %orig;
    }
    return calculatedRadius(self.visibleRect,  %orig);
}
%end