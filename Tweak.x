#import "AlderisColorPicker.h"

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
	%orig([UIColor PF_colorWithHex:@"#F6F9DB"]);
}
-(void)setTextColor:(UIColor *)arg1{
	%orig([UIColor PF_colorWithHex:@"#591C00"]);
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