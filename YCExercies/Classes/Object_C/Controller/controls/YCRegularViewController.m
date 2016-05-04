//
//  YCRegularViewController.m
//  YCExercies
//
//  Created by 高艳彬 on 16/4/13.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCRegularViewController.h"

@interface YCRegularViewController ()

@end

@implementation YCRegularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.title = @"YCRegularViewCon";
    [self checkReglar];
    
    
}

- (void)checkReglar{

    // 单独的
    NSLog(@"🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀\n%d",[self checkOnlyOneElement:@"1"]);

}


- (BOOL )checkOnlyOneElement:(NSString *)words{

    // 0-9 数字 3-18位
    NSString *relgx = @"^[0-9]{3,18}$";
    
    // 00-9 a-z A-Z 有一个就好
    relgx = @"^[0-9a-zA-Z]{3,18}$";
    
    relgx = @"^[0-9]*[a-z]$";
    
    relgx = @"^(\\d{3,4}-)\\d{7,8}$";
    relgx = @"[a-zA-Z][A-Z0-9a-z_]{5,19}$";
    relgx = @"^\\d$";
    
    NSPredicate *relgxPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@ ",relgx];

    return [relgxPredicate evaluateWithObject:words];

}







#pragma mark --- 常用的正则
//用户名(包含手机号)校验
+ (BOOL)validateUserName:(NSString *)userName
{
    if ([self validateMobile:userName]) {
        return YES;
    }
    else
    {
        NSString *userNameRegex = @"[a-zA-Z][A-Z0-9a-z_]{5,19}$";
        NSPredicate *userNameRegexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", userNameRegex];
        return [userNameRegexTest evaluateWithObject:userName];
    }
}

//校验提现金额
+ (BOOL)validateWithDrawalMoney:(NSString *)money{
    NSString *userNameRegex = @"[0-9.]{1,20}$";
    NSPredicate *userNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNameTest evaluateWithObject:money];
}

//真实姓名校验
+ (BOOL)validateRealNameAuthentication:(NSString *)realNameAuthentication
{
    NSString *userNameRegex = @"^\[\u4e00-\u9fa5]{1,}[\u4e00-\u9fa5.·]{0,15}[\u4e00-\u9fa5]{1,}$";
    NSPredicate *userNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    
    return [userNameTest evaluateWithObject:realNameAuthentication];
}

//手机号码校验
+ (BOOL)validateMobile:(NSString *)mobile
{
    //手机号以13,14,15,17,18开头,八个 \d 数字字符
    NSString *phoneRegex = @"^(13[0-9]|14[0-9]|15[0-9]|17[0-9]|18[0-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//交易密码校验
+ (BOOL)validateTradeCode:(NSString *)tradeCode{
    NSString *tradeCodeRegex = @"^[\\w!@#$%^*_]{6,18}$";
    NSPredicate *traceCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",tradeCodeRegex];
    
    return [traceCodeTest evaluateWithObject:tradeCode];
}

//短信验证码校验
+ (BOOL)validateMessageAuthenticationCode:(NSString *)messageAuthenticationCode
{
    //^[\\w]{4,6}$
    NSString *messageAuthenticationCodeRegex = @"^[\\d]{4,6}$";
    NSPredicate *messageAuthenticationCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",messageAuthenticationCodeRegex];
    
    return [messageAuthenticationCodeTest evaluateWithObject:messageAuthenticationCode];
}


//图形验证码校验
+ (BOOL)validateGraphAuthenticationCode:(NSString *)graphAuthenticationCode
{
    NSString *messageAuthenticationCodeRegex = @"^[\\w]{4,6}$";
    NSPredicate *messageAuthenticationCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",messageAuthenticationCodeRegex];
    return [messageAuthenticationCodeTest evaluateWithObject:graphAuthenticationCode];
}



//邮箱校验
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//密码校验
+ (BOOL)validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[\\w!@#$%^*_]{6,18}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


//+ (BOOL)validatePasswordStrength:(NSString *)passWord{
//
////    NSString *passWordRegex = @"^(?:d+|[a-zA-Z]+|[!@#$%^&*]+)$";
//      NSString *passWordRegex = @"^[a-zA-Z0-9]\{6,18}$";
//
////    NSString *passWordRegexWeak = @"^(?!\d+$)(?![a-zA-Z]+$)[a-zA-Z\d]+$";
//
//
//    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
//
//    return [passWordPredicate evaluateWithObject:passWord];
////    return Regex.Replace(passWord, "^(?:([a-z])|([A-Z])|([0-9])|(.)){6,}|(.)+$", "$1$2$3$4$5").Length;
//}

//密码强度判断

+ (NSInteger )validatePasswordStrength:(NSString*) _password{
    
    if ([self validatePassword:_password]) {
        
        return [self validatePasswordStrengthCheck:_password];
    }
    
    return 0;
    
}

+ (NSInteger )validatePasswordStrengthCheck:(NSString*) _password
{
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    
    NSArray* termArray1 = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
    NSArray* termArray2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", nil];
    NSArray* termArray3 = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    NSArray* termArray4 = [[NSArray alloc] initWithObjects:@"~",@"`",@"@",@"#",@"$",@"%",@"^",@"&",@"*",@"(",@")",@"-",@"_",@"+",@"=",@"{",@"}",@"[",@"]",@"|",@":",@";",@"“",@"'",@"‘",@"<",@",",@".",@">",@"?",@"/",@"、", nil];
    
    NSString* result1 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray1 Password:_password]];
    NSString* result2 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray2 Password:_password]];
    NSString* result3 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray3 Password:_password]];
    NSString* result4 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray4 Password:_password]];
    
    [resultArray addObject:[NSString stringWithFormat:@"%@",result1]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result2]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result3]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result4]];
    
    int intResult=0;
    for (int j=0; j<[resultArray count]; j++)
    {
        if ([[resultArray objectAtIndex:j] isEqualToString:@"1"])
        {
            intResult++;
        }
    }
    if (intResult <2)
    {
        //        NSLog(@"🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀\n密码强度低，建议修改");
        return 0;
    }
    else if (intResult == 2&&[_password length]>=6)
    {
        //        NSLog(@"🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀\n密码强度一般");
        return 1;
    }
    if (intResult > 2&&[_password length]>=6)
    {
        //        NSLog(@"🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀\n密码强度高");
        return 2;
    }
    return 0;
}
//条件
+ (BOOL) judgeRange:(NSArray*) _termArray Password:(NSString*) _password
{
    NSRange range;
    BOOL result = NO;
    for(int i=0; i<[_termArray count]; i++)
    {
        range = [_password rangeOfString:[_termArray objectAtIndex:i]];
        if(range.location != NSNotFound)
        {
            result =YES;
        }
    }
    return result;
}








//银行名校验
+ (BOOL)validateBankName:(NSString *)bankName
{
    NSString *bankNameRegex = @"^\\s*[\u4e00-\u9fa5]{4,30}\\s*$";
    NSPredicate *bankNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNameRegex];
    return [bankNamePredicate evaluateWithObject:bankName];
}


//银行卡号校验
+ (BOOL)validateBankCardNumber:(NSString *)bankCardNumber
{
    NSString *bankCardNumberRegex = @"^\\s*\\d{16,19}\\s*$";
    NSPredicate *bankCardNumberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankCardNumberRegex];
    return [bankCardNumberPredicate evaluateWithObject:bankCardNumber];
}

//身份证号
+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
    identityCard = [identityCard stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger length =0;
    if (!identityCard) {
        return NO;
    }
    else {
        length = identityCard.length;
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    NSString *valueStart2 = [identityCard substringToIndex:2];
    BOOL areaFlag = NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    int year = 0;
    switch (length){
        case 15:
            year = [[identityCard substringWithRange:NSMakeRange(6,4)] intValue];
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            
            numberofMatch = [regularExpression numberOfMatchesInString:identityCard options:NSMatchingReportProgress range:NSMakeRange(0, identityCard.length)];
            
            if(numberofMatch >0) {
                return YES;
            }
            else {
                return NO;
            }
        case 18:
            year = [identityCard substringWithRange:NSMakeRange(6,4)].intValue;
            if (year % 4 ==0 || (year % 100 ==0 && year % 4 ==0)){
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            
            numberofMatch = [regularExpression numberOfMatchesInString:identityCard options:NSMatchingReportProgress range:NSMakeRange(0,identityCard.length)];
            if(numberofMatch >0) {
                int S = ([identityCard substringWithRange:NSMakeRange(0,1)].intValue + [identityCard substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([identityCard substringWithRange:NSMakeRange(1,1)].intValue + [identityCard substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([identityCard substringWithRange:NSMakeRange(2,1)].intValue + [identityCard substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([identityCard substringWithRange:NSMakeRange(3,1)].intValue + [identityCard substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([identityCard substringWithRange:NSMakeRange(4,1)].intValue + [identityCard substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([identityCard substringWithRange:NSMakeRange(5,1)].intValue + [identityCard substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([identityCard substringWithRange:NSMakeRange(6,1)].intValue + [identityCard substringWithRange:NSMakeRange(16,1)].intValue) *2 + [identityCard substringWithRange:NSMakeRange(7,1)].intValue *1 + [identityCard substringWithRange:NSMakeRange(8,1)].intValue *6 + [identityCard substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M = @"F";
                NSString *JYM = @"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[identityCard substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }
                else {
                    return NO;
                }
            }else {
                return NO;
            }
        default:
            return NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
