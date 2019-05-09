#import "Common.h"
#import "Colors.h"

@interface TFNTwitterColorPaletteSettingInfo: NSObject
@property (nonatomic, assign) BOOL isDark;
@property (nonatomic, copy, readwrite) NSString *name;
@end

@interface TFNTwitterColorSettings: NSObject
@property (nonatomic, copy, readwrite) NSArray *availableColorPalettes;
-(TFNTwitterColorPaletteSettingInfo *)currentColorPalette;
+(id)sharedSettings;
@end
