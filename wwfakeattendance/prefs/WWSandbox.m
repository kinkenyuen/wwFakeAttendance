#import "WWSandbox.h"

@implementation WWSandbox

+ (NSString *)sandBoxForBundleIdentify:(NSString *)bundleID {
	// NSLog(@"kk | bundleID : %@",bundleID);
    Class cls = NSClassFromString(@"LSApplicationWorkspace");
    id s = [(id)cls performSelector:@selector(defaultWorkspace)];
    NSArray *array = [s performSelector:@selector(allApplications)];
    Class LSApplicationProxy_class = NSClassFromString(@"LSApplicationProxy");
    for (LSApplicationProxy_class in array){
        NSString *strBundleID = [LSApplicationProxy_class performSelector:
            @selector(bundleIdentifier)];
        // NSLog(@"kk | strBundleID : %@",strBundleID);
        // NSString *strVersion =  [LSApplicationProxy_class performSelector:@selector(bundleVersion)];
        // NSString *strShortVersion =  [LSApplicationProxy_class performSelector:
        //     @selector(shortVersionString)];
        NSURL *strContainerURL = [LSApplicationProxy_class performSelector:@selector(containerURL)];
        NSString *strContainerDataPath = [strContainerURL path];
        // NSLog(@"kk | strContainerDataPath : %@",strContainerDataPath);
        // NSURL *strResourcesDirectoryURL = [LSApplicationProxy_class performSelector:
        //     @selector(resourcesDirectoryURL)];
        // NSString *strContainerBundlePath = [strResourcesDirectoryURL path];
        // NSString *strLocalizedName = [LSApplicationProxy_class performSelector:
        //     @selector(localizedName)];
        // NSString *strBundleExecutable = [LSApplicationProxy_class performSelector:
        //     @selector(bundleExecutable)];
        if ([strBundleID isEqualToString:bundleID]) {
            return strContainerDataPath;
        }
    }
    return nil;
}

@end