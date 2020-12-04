#import <UIKit/UIKit.h>
%hook WWKAttendanceCameraViewController

- (id)p_renderWaterMarkImageWithOriginalImage:(id)arg1 {
    %log;
    NSString *imageDir = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"FakeImage" ];
    NSString *imagePath = [imageDir stringByAppendingPathComponent:@"fakeimage.jpg"];
    UIImage *fakeImage = [[UIImage alloc] initWithContentsOfFile:imagePath];
    NSLog(@"kk | fakeImage : %@",fakeImage);
    return %orig(fakeImage);
}

%end

static BOOL tweakEnable = NO;
static void loadPrefs() {
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.kinken.prefs.plist"];
    tweakEnable = [settings objectForKey:@"tweakEnable"] ? [[settings objectForKey:@"tweakEnable"] boolValue] : NO;
}

%ctor {
    loadPrefs();
    if (tweakEnable)
    {
    	NSLog(@"kk | tweakInit");
        %init(_ungrouped);
    }
    
}



