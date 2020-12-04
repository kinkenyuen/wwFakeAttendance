#import "WWCustomCell.h"
#import "WWSandbox.h"

@implementation WWCustomCell{
    UIImageView *_imageV;
    UIImage *_image;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];
    if(self){
        _imageV = [[UIImageView alloc] initWithFrame:CGRectZero];
        NSString *imagePath = [[[[WWSandbox sandBoxForBundleIdentify:@"com.tencent.ww"] stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"FakeImage"] stringByAppendingPathComponent:@"fakeimage.jpg"];
        _image = [[UIImage alloc] initWithContentsOfFile:imagePath];
        _imageV.image = _image;
        _imageV.clipsToBounds = YES;
        _imageV.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_imageV];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _imageV.frame = self.contentView.bounds;
}

@end