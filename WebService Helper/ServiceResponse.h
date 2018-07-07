//
//  ServiceResponse.h
//  AxisWalletxisWallet
//
//  Created by Bonnie Jaiswal on 18/06/13.
//  Copyright (c) 2015 Bonnie Jaiswal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceResponse <NSObject>

@required
- (void)didReceiveResponse: (id) response forMethod:(NSString *) methodName;

@optional
- (void) didFailWithErrorMessage:(NSError *)error  forMethod:(NSString *)methodName;

@end