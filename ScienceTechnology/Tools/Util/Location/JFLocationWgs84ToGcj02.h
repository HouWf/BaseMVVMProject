//
//  JFLocationWgs84ToGcj02.h
//  BFCompetition
//
//  Created by hzhy002 on 2020/8/12.
//  Copyright © 2020 hzhy001. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JFLocationWgs84ToGcj02 : NSObject

//判断是否已经超出中国范围
+(BOOL)isLocationOutOfChina:(CLLocationCoordinate2D)location;
//转GCJ-02
+(CLLocationCoordinate2D)transformFromWGSToGCJ:(CLLocationCoordinate2D)wgsLoc;


@end

NS_ASSUME_NONNULL_END
