//
//  BKExtensionUtils.m
//  BKHousePet
//
//  Created by Tayte on 2017/3/20.
//  Copyright © 2017年 Tayte. All rights reserved.
//

#import "TCExtension.h"

#define IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0)

@implementation TCExtension

@end


@implementation UIImage(Utils)

+ (UIImage *)resizeImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat imageW = image.size.width * 0.5;
    CGFloat imageH = image.size.height * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW) resizingMode:UIImageResizingModeTile];
}

+(UIImage *)imageWithColor:(UIColor *)color
{
    CGSize imageSize = CGSizeMake(1, 1);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)imageWithColor:(UIColor *)color alpha:(float)alpha
{
    color=[color colorWithAlphaComponent:alpha];
    CGSize imageSize = CGSizeMake(1, 1);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageFromView:(UIView *)theView
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    
    if([[UIScreen mainScreen] scale] == 2.0){
        UIGraphicsBeginImageContextWithOptions(newSize, NO, 2.0);
    }else{
        UIGraphicsBeginImageContext(newSize);
    }
   
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
   
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
 
    UIGraphicsEndImageContext();
    
    return scaledImage;
}
@end

#pragma UIButton
@implementation UIButton (Utils)


+(UIButton *)buttonWithFrame:(TCGRect)frame
                 normalTitle:(NSString *)title
            normalTitleColor:(UIColor *)titleColor
            normalTiltleFont:(CGFloat)font
                  cornerRadiu:(CGFloat)cornerRadiu
             backGroundColor:(UIColor*)backGroundColor
                      target:(id)target selector:(SEL)selector
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
   
    
    button.frame = frame;
    if (cornerRadiu!=0) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:cornerRadiu];
//        [button.layer setBorderWidth:1.0];
    }

    

    [button setTitle:title forState:UIControlStateNormal];
    
    UIFont *fontP ;//这个是9.0以后自带的平方字体
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);

    [button.titleLabel setFont:fontP];

    
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backGroundColor];
    if (target!=nil&&selector!=nil) {
        
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;

}
+(UIButton *)buttonWithFrame:(TCGRect)frame
                 normalTitle:(NSString *)title
            normalTitleColor:(UIColor *)titleColor
            normalTiltleFont:(CGFloat)font
                 cornerRadiu:(CGFloat)cornerRadiu
         selectedGroundColor:(UIColor*)selectedGroundColor
             backGroundColor:(UIColor*)backGroundColor
                      target:(id)target selector:(SEL)selector{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (cornerRadiu!=0) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:cornerRadiu];
        }
    
    [button setTitle:title forState:UIControlStateNormal];
    UIFont*fontP;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);
    
    [button.titleLabel setFont:fontP];
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backGroundColor];
    [button setBackgroundImage:[UIImage imageWithColor:backGroundColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:selectedGroundColor] forState:UIControlStateSelected];
    if (target!=nil&&selector!=nil) {
        
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
 
}
+(UIButton *)buttonWithFrame:(TCGRect)frame
         BackgroundImageName:(NSString *)backgroundImageName
                      target:(id)target selector:(SEL)selector{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    [button setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];

    return button;
}

@end
#pragma UIView
@implementation UIView (Utils)

- (CGFloat)originX {
    return self.frame.origin.x;
}

- (void)setOriginX:(CGFloat)originX {
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
    return;
}

- (CGFloat)originY {
    return self.frame.origin.y;
}

- (void)setOriginY:(CGFloat)originY {
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
    return;
}

- (CGFloat)rightX {
    return [self originX] + [self width];
}

- (void)setRightX:(CGFloat)rightX {
    CGRect frame = self.frame;
    frame.origin.x = rightX - [self width];
    self.frame = frame;
    return;
}

- (CGFloat)bottomY {
    return [self originY] + [self height];
}

- (void)setBottomY:(CGFloat)bottomY {
    CGRect frame = self.frame;
    frame.origin.y = bottomY - [self height];
    self.frame = frame;
    return;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
    return;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
    return;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    return;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
    return;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
    return;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
    return;
}

///< 移除此view上的所有子视图
- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    return;
}



#pragma mark-------------------------------
+(UIView*)viewWithFrame:(TCGRect)frame
          backGroundColor:(UIColor*)color{
    
    UIView *view=[[UIView alloc]initWithFrame:frame];
    view.backgroundColor=color;
    return view;
}



@end



#pragma 

@implementation UILabel (Utils)

+(UILabel*)labelWithFrame:(TCGRect)frame
                     text:(NSString*)text
                 textFont:(CGFloat)font
                textColor:(UIColor*)textColor
            TextAlignment:(NSTextAlignment)alignment
{
    
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
  
    label.text=text;
    
    UIFont*fontP;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);
    label.font=fontP;
    label.textColor=textColor;
    label.textAlignment=alignment;
    return label;
}

@end



@implementation UIImageView (Utils)

+(UIImageView*)imageViewWithFrame:(TCGRect)frame
                            image:(NSString*)imageName{
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:imageName];
    return imageView;
}

@end

@implementation UITextField (Utils)

+(UITextField*)textFieldWithFrame:(TCGRect)frame
                     keyboardType:(UITextBorderStyle)borderStyle
                placeholderString:(NSString*)placeholderString
            placeholderStringFont:(CGFloat)placeFont
                 placeholderColor:(UIColor*)placeholderColor
                        textColor:(UIColor*)textColor
                         textFont:(CGFloat)textFont
                    textAlignment:(NSTextAlignment)alignment{
    
    
    UITextField* field=[[UITextField alloc]initWithFrame:frame];
    field.keyboardType=UITextBorderStyleNone;
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:placeholderString];
//    [placeholder addAttribute:NSForegroundColorAttributeName
//                        value:placeholderColor
//                        range:NSMakeRange(0, placeholderString.length)];
//    [placeholder addAttribute:NSFontAttributeName
//                        value:[UIFont systemFontOfSize:placeFont*SCALE]
//                        range:NSMakeRange(0, placeholderString.length)];
//
    
    UIFont *fontP ;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:placeFont*SCALE] ): (fontP = [UIFont systemFontOfSize:placeFont*SCALE]);
    
   
        [placeholder setAttributes:[NSDictionary dictionaryWithObjectsAndKeys: placeholderColor,
                                    NSForegroundColorAttributeName,
                                    fontP,
                                    NSFontAttributeName, nil] range:NSMakeRange(0, placeholderString.length)];
    
    UIFont*textFontP;
    IS_IOS9 ?( textFontP = [UIFont fontWithName:@"PingFangSC-Regular" size:textFont*SCALE] ): (textFontP = [UIFont systemFontOfSize:textFont*SCALE]);

    field.font=textFontP;


    
    
    


    field.attributedPlaceholder = placeholder;
    field.textColor=textColor;
    field.textAlignment = alignment;
    return field;
}
    
@end



@implementation NSData (AES)

static char base64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

- (NSData *)AES256EncryptWithKey:(NSString *)key {
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    char keyPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
    
    // fetch key data
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    
    //See the doc: For block ciphers, the output size will always be less than or
    //equal to the input size plus the size of one block.
    //That's why we need to add the size of one block here
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          keyPtr, kCCKeySizeAES256,
                                          NULL /* initialization vector (optional) */,
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer); //free the buffer;
    return nil;
}



- (NSData *)AES256DecryptWithKey:(NSString *)key {
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    char keyPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
    
    // fetch key data
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    
    //See the doc: For block ciphers, the output size will always be less than or
    //equal to the input size plus the size of one block.
    //That's why we need to add the size of one block here
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          keyPtr, kCCKeySizeAES256,
                                          NULL /* initialization vector (optional) */,
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer); //free the buffer;
    return nil;
}

- (NSData *)AES128Operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv
{
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128 + 1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(operation,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
    if (cryptStatus == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
    }
    free(buffer);
    return nil;
}

- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv
{
    return [self AES128Operation:kCCEncrypt key:key iv:iv];
}

- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv
{
    return [self AES128Operation:kCCDecrypt key:key iv:iv];
}



- (NSData *)AES128EncryptWithKey:(NSString *)key   //加密
{
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}


- (NSData *)AES128DecryptWithKey:(NSString *)key   //解密
{
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}




- (NSString *)newStringInBase64FromData            //追加64编码
{
    NSMutableString *dest = [[NSMutableString alloc] initWithString:@""];
    unsigned char * working = (unsigned char *)[self bytes];
    NSInteger srcLen = [self length];
    for (int i=0; i<srcLen; i += 3) {
        for (int nib=0; nib<4; nib++) {
            int byt = (nib == 0)?0:nib-1;
            int ix = (nib+1)*2;
            if (i+byt >= srcLen) break;
            unsigned char curr = ((working[i+byt] << (8-ix)) & 0x3F);
            if (i+nib < srcLen) curr |= ((working[i+nib] >> ix) & 0x3F);
            [dest appendFormat:@"%c", base64[curr]];
        }
    }
    return dest;
}

+ (NSString*)base64encode:(NSString*)str
{
    if ([str length] == 0)
        return @"";
    const char *source = [str UTF8String];
    NSInteger strlength  = strlen(source);
    char *characters = malloc(((strlength + 2) / 3) * 4);
    if (characters == NULL)
        return nil;
    NSUInteger length = 0;
    NSUInteger i = 0;
    while (i < strlength) {
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < strlength)
            buffer[bufferLength++] = source[i++];
        characters[length++] = base64[(buffer[0] & 0xFC) >> 2];
        characters[length++] = base64[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1)
            characters[length++] = base64[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        else characters[length++] = '=';
        if (bufferLength > 2)
            characters[length++] = base64[buffer[2] & 0x3F];
        else characters[length++] = '=';
    }
    NSString *g = [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES] ;
    return g;
}

//base64 解密
+ (NSData *)dataWithBase64EncodedString:(NSString *)string
{
    if (string == nil)
        [NSException raise:NSInvalidArgumentException format:@""];
    if ([string length] == 0)
        return [NSData data];
    
    static char *decodingTable = NULL;
    if (decodingTable == NULL)
    {
        decodingTable = malloc(256);
        if (decodingTable == NULL)
            return nil;
        memset(decodingTable, CHAR_MAX, 256);
        NSUInteger i;
        for (i = 0; i < 64; i++)
            decodingTable[(short)base64[i]] = i;
    }
    
    const char *characters = [string cStringUsingEncoding:NSASCIIStringEncoding];
    if (characters == NULL)     //  Not an ASCII string!
        return nil;
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    if (bytes == NULL)
        return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (YES)
    {
        char buffer[4];
        short bufferLength;
        for (bufferLength = 0; bufferLength < 4; i++)
        {
            if (characters[i] == '\0')
                break;
            if (isspace(characters[i]) || characters[i] == '=')
                continue;
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            if (buffer[bufferLength++] == CHAR_MAX)      //  Illegal character!
            {
                free(bytes);
                return nil;
            }
        }
        
        if (bufferLength == 0)
            break;
        if (bufferLength == 1)      //  At least two characters are needed to produce one byte!
        {
            free(bytes);
            return nil;
        }
        
        //  Decode the characters in the buffer to bytes.
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        if (bufferLength > 2)
            bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        if (bufferLength > 3)
            bytes[length++] = (buffer[2] << 6) | buffer[3];
    }
    
    bytes = realloc(bytes, length);
    return [NSData dataWithBytesNoCopy:bytes length:length];
}

@end


//@implementation CATextLayer (util)

//-(CATextLayer*)CATextLayerTextFrame:(TCGRect)frame
//                               text:(NSString*)text
//                           textFont:(CGFloat)font
//                          textColor:(UIColor*)textColor
//                      TextAlignment:(NSTextAlignment)alignment
//{
//    CATextLayer * xlTextLayer = [CATextLayer layer];
//    xlTextLayer.frame           = frame;
//    xlTextLayer.backgroundColor = textColor.CGColor;
//    xlTextLayer.string = text;
//    UIFont *fontP ;
//    IS_IOS9 ?( fontP = (__bridge CFTypeRef _Nullable)(@"PingFangSC-Regular")) : (fontP = (__bridge CFTypeRef _Nullable)(@"HiraKakuProN-W3"));
//    xlTextLayer.font = (__bridge CFTypeRef _Nullable) fontP;
//
//    xlTextLayer.fontSize = font*SCALE;
//
//    xlTextLayer.alignmentMode = kCAAlignmentCenter;
//
//      xlTextLayer.foregroundColor =
//    [UIColor redColor].CGColor;
//    // 最主要的特点是CATextLayer可以被NSMutableAttributedString直接附值。
//    //而NSMutableAttributedString有可以最自己内容作出颜色以及大小的调整。
//    return xlTextLayer;
//
//}
//


//@end

@implementation NSMutableDictionary(DYSetObjectForKey)


-(void)DWSetObject:(id)anObject forKey:(id<NSCopying>)aKey;
{
    if (anObject == nil) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}
@end



@implementation NSString (SKCategory)





- (BOOL)isPhone {
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,181
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,183,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[23478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,181,189
     22         */
    NSString * CT = @"^1((33|53|4[0-9]|7[0-9]|8[019])[0-9]|349)\\d{7}$";//@"^1((33|53|8[019])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES)
        || ([regextestphs evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
    
    //	return [self isMatchRegular:@"^((\(\\d{2,3}))|(\\d{3}\\-))?(13|15|18|14)\\d{9}$"];
}

@end



@implementation NSDictionary(DYObjectForKey)


-(NSString *)DWStringForKey:(id)key
{
    id object=[self objectForKey:key];
    
    if ([object isKindOfClass:[NSNull class]]||object == nil)
    {
        return @"";
    }
    return [NSString stringWithFormat:@"%@",object];
}

-(NSArray *)DWArrayForKey:(id)key
{
    id object=[self objectForKey:key];
    
    if (![object isKindOfClass:[NSArray class]])
    {
        return [NSArray array];
    }
    return object;
}

-(NSDictionary *)DWDictionaryForKey:(id)key
{
    id object=[self objectForKey:key];
    
    if (![object isKindOfClass:[NSDictionary class]])
    {
        return [NSDictionary dictionary];
    }
    return object;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
///Users/wang/Downloads/28×28.png
///Users/wang/Downloads/108×108.png

@end



