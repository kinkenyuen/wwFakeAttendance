#include "WWRootListController.h"
#import <UIKit/UIkit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "WWSandbox.h"

@interface WWRootListController() <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation WWRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

- (void)selectPhoto {
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
		UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
		pickerController.delegate = self;
		pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		pickerController.mediaTypes = @[(NSString *)kUTTypeImage];
		[self presentViewController:pickerController animated:YES completion:nil];
	}
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<UIImagePickerControllerInfoKey, id> *)editingInfo {
	NSString *sandBox = [WWSandbox sandBoxForBundleIdentify:@"com.tencent.ww"];
	if (sandBox) {
		NSString *dir = [[sandBox stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"FakeImage"];
		if ([[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil]) {
			NSData *imageData = UIImageJPEGRepresentation(image, 0.3);
			BOOL result = [imageData writeToFile:[dir stringByAppendingPathComponent:@"fakeimage.jpg"] atomically:YES];
			if (result) {
				UIAlertView *v = [[UIAlertView alloc] initWithTitle:@"提示" message:@"设置成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
				[v show];
			}
		}
	}
	[self performSelector:@selector(reload)];
	[picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[picker dismissViewControllerAnimated:YES completion:nil];
}

@end
