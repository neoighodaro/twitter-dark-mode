#import "Tweak.h"

NSString *kTwitterUsername = @"neoighodaro";
NSString *kTwitterBundleIdentifier = @"com.atebits.Tweetie2";
NSString *kTwitterDarkModeBundleIdentifier = @"com.tapsharp.twitterdarkmode";

%group TWITTER_DARK_COLOR_FORCED_ACTIVATION
%hook TFNTwitterColorSettings
-(TFNTwitterColorPaletteSettingInfo *)currentColorPalette {
	TFNTwitterColorPaletteSettingInfo *colorPalette;

	for (TFNTwitterColorPaletteSettingInfo *palette in self.availableColorPalettes) {
		if (palette.isDark == YES && [palette.name isEqualToString:@"dark"]) {
			colorPalette = palette;
			break;
		}
	}

	return colorPalette != nil ? colorPalette : %orig;
}
%end
%end


%group TWITTER_DARK_COLOR
%hook TFNTwitterDarkColorPalette
-(UIColor *)twitterColorBackground {
    return UA_blvckColor;
}
-(UIColor *)twitterColorDarkBackground {
    return UA_blvckColor;
}
-(UIColor *)twitterColorAppBackground {
    return UA_blvckColor;
}
-(UIColor *)twitterColorNavigationBarBackground {
    return UA_blvckColor;
}
-(UIColor *)twitterColorNavigationBarItemDarkBackground {
    return UA_blvckColor;
}
-(UIColor *)twitterColorTabBarBackground {
    return UA_blvckColor;
}
-(UIColor *)twitterColorAppLaunchBackground {
    return UA_blvckColor;
}
-(UIColor *)twitterColorUnreadBackground {
    return UA_blvckColor200;
}
-(UIColor *)twitterColorItemDarkBackground {
    return UA_whiteColor;
}
-(UIColor *)twitterColorDarkBackgroundDivider {
    return UA_blvckColor200;
}
-(UIColor *)twitterColorProfileHeaderBackground {
    return UA_blvckColor;
}
-(UIColor *)twitterColorDMBubbleOutgoing {
    return UA_blvckColor100;
}
-(UIColor *)twitterColorDMBubbleIncoming {
    return UA_blvckColor200;
}
-(UIColor *)twitterColorHighlightBackground {
    return UA_blvckColor100;
}
-(UIColor *)twitterColorHighlightDarkBackground {
    return UA_blvckColor;
}
%end
%end


%ctor {
    BOOL blvckIsEnabled = YES;
    BOOL darkModeIsEnabled = YES;
    BOOL activateForcefully = YES;
    BOOL inTwitterApp = [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:kTwitterBundleIdentifier];

    if (inTwitterApp == YES && blvckIsEnabled == YES && darkModeIsEnabled == YES) {
        %init(TWITTER_DARK_COLOR);

        if (activateForcefully == YES) {
            %init(TWITTER_DARK_COLOR_FORCED_ACTIVATION);
        }
    }
}
