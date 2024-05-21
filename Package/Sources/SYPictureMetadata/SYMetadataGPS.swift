//
//  SYMetadataGPS.swift
//  SYPictureMetadata
//
//  Created by Stanislas Chevallier on 08/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import Foundation
import ImageIO

@objcMembers public class SYMetadataGPS : SYMetadataBase {

    // MARK: Types
    public enum LatitudeRef: String, CaseIterable {
        case north = "N"
        case south = "S"
    }
    public enum LongitudeRef: String, CaseIterable {
        case east = "E"
        case west = "W"
    }
    public enum AltitudeRef: Int, CaseIterable {
        case aboveSeaLevel = 0
        case belowSeaLevel = 1
    }
    public enum DirectionRef: String, CaseIterable {
        case trueDirection = "T"
        case magneticDirection = "M"
    }
    public enum DistanceRef: String, CaseIterable {
        case kilometers = "K"
        case miles = "M"
        case knots = "N"
    }
    public enum SpeedRef: String, CaseIterable {
        case kilometersPerHour = "K"
        case milesPerHour = "M"
        case knots = "N"
    }
    public enum MeasureMode: String, CaseIterable {
        case twoDimensional = "2"
        case threeDimensional = "3"
    }
    public enum Status: String, CaseIterable {
        case active = "A"
        case void = "V"
    }

    // MARK: Values
    public var version: Array<NSNumber>? {
        get { getValue(key: kCGImagePropertyGPSVersion.string) }
        set { setValue(key: kCGImagePropertyGPSVersion.string, value: newValue) }
    }
    
    public var latitudeRef: LatitudeRef? {
        get { getValue(key: kCGImagePropertyGPSLatitudeRef.string) }
        set { setValue(key: kCGImagePropertyGPSLatitudeRef.string, value: newValue) }
    }
    
    public var latitude: Double? {
        get { getValue(key: kCGImagePropertyGPSLatitude.string) }
        set { setValue(key: kCGImagePropertyGPSLatitude.string, value: newValue) }
    }
    
    public var longitudeRef: LongitudeRef? {
        get { getValue(key: kCGImagePropertyGPSLongitudeRef.string) }
        set { setValue(key: kCGImagePropertyGPSLongitudeRef.string, value: newValue) }
    }
    
    public var longitude: Double? {
        get { getValue(key: kCGImagePropertyGPSLongitude.string) }
        set { setValue(key: kCGImagePropertyGPSLongitude.string, value: newValue) }
    }
    
    public var altitudeRef: AltitudeRef? {
        get { getValue(key: kCGImagePropertyGPSAltitudeRef.string) }
        set { setValue(key: kCGImagePropertyGPSAltitudeRef.string, value: newValue) }
    }
    
    public var altitude: Double? {
        get { getValue(key: kCGImagePropertyGPSAltitude.string) }
        set { setValue(key: kCGImagePropertyGPSAltitude.string, value: newValue) }
    }
    
    public var timeStamp: String? {
        get { getValue(key: kCGImagePropertyGPSTimeStamp.string) }
        set { setValue(key: kCGImagePropertyGPSTimeStamp.string, value: newValue) }
    }
    
    public var satellites: String? {
        get { getValue(key: kCGImagePropertyGPSSatellites.string) }
        set { setValue(key: kCGImagePropertyGPSSatellites.string, value: newValue) }
    }
    
    public var status: Status? {
        get { getValue(key: kCGImagePropertyGPSStatus.string) }
        set { setValue(key: kCGImagePropertyGPSStatus.string, value: newValue) }
    }
    
    public var measureMode: MeasureMode? {
        get { getValue(key: kCGImagePropertyGPSMeasureMode.string) }
        set { setValue(key: kCGImagePropertyGPSMeasureMode.string, value: newValue) }
    }
    
    public var dop: Double? {
        get { getValue(key: kCGImagePropertyGPSDOP.string) }
        set { setValue(key: kCGImagePropertyGPSDOP.string, value: newValue) }
    }
    
    public var speedRef: SpeedRef? {
        get { getValue(key: kCGImagePropertyGPSSpeedRef.string) }
        set { setValue(key: kCGImagePropertyGPSSpeedRef.string, value: newValue) }
    }
    
    public var speed: Double? {
        get { getValue(key: kCGImagePropertyGPSSpeed.string) }
        set { setValue(key: kCGImagePropertyGPSSpeed.string, value: newValue) }
    }
    
    public var trackRef: DirectionRef? {
        get { getValue(key: kCGImagePropertyGPSTrackRef.string) }
        set { setValue(key: kCGImagePropertyGPSTrackRef.string, value: newValue) }
    }
    
    public var track: Double? {
        get { getValue(key: kCGImagePropertyGPSTrack.string) }
        set { setValue(key: kCGImagePropertyGPSTrack.string, value: newValue) }
    }
    
    public var imgDirectionRef: DirectionRef? {
        get { getValue(key: kCGImagePropertyGPSImgDirectionRef.string) }
        set { setValue(key: kCGImagePropertyGPSImgDirectionRef.string, value: newValue) }
    }
    
    public var imgDirection: Double? {
        get { getValue(key: kCGImagePropertyGPSImgDirection.string) }
        set { setValue(key: kCGImagePropertyGPSImgDirection.string, value: newValue) }
    }
    
    public var mapDatum: String? {
        get { getValue(key: kCGImagePropertyGPSMapDatum.string) }
        set { setValue(key: kCGImagePropertyGPSMapDatum.string, value: newValue) }
    }
    
    public var destLatitudeRef: LatitudeRef? {
        get { getValue(key: kCGImagePropertyGPSDestLatitudeRef.string) }
        set { setValue(key: kCGImagePropertyGPSDestLatitudeRef.string, value: newValue) }
    }
    
    public var destLatitude: Double? {
        get { getValue(key: kCGImagePropertyGPSDestLatitude.string) }
        set { setValue(key: kCGImagePropertyGPSDestLatitude.string, value: newValue) }
    }
    
    public var destLongitudeRef: LongitudeRef? {
        get { getValue(key: kCGImagePropertyGPSDestLongitudeRef.string) }
        set { setValue(key: kCGImagePropertyGPSDestLongitudeRef.string, value: newValue) }
    }
    
    public var destLongitude: Double? {
        get { getValue(key: kCGImagePropertyGPSDestLongitude.string) }
        set { setValue(key: kCGImagePropertyGPSDestLongitude.string, value: newValue) }
    }
    
    public var destBearingRef: DirectionRef? {
        get { getValue(key: kCGImagePropertyGPSDestBearingRef.string) }
        set { setValue(key: kCGImagePropertyGPSDestBearingRef.string, value: newValue) }
    }
    
    public var destBearing: Double? {
        get { getValue(key: kCGImagePropertyGPSDestBearing.string) }
        set { setValue(key: kCGImagePropertyGPSDestBearing.string, value: newValue) }
    }
    
    public var destDistanceRef: DistanceRef? {
        get { getValue(key: kCGImagePropertyGPSDestDistanceRef.string) }
        set { setValue(key: kCGImagePropertyGPSDestDistanceRef.string, value: newValue) }
    }
    
    public var destDistance: Double? {
        get { getValue(key: kCGImagePropertyGPSDestDistance.string) }
        set { setValue(key: kCGImagePropertyGPSDestDistance.string, value: newValue) }
    }
    
    public var processingMethod: NSObject? {
        get { getValue(key: kCGImagePropertyGPSProcessingMethod.string) }
        set { setValue(key: kCGImagePropertyGPSProcessingMethod.string, value: newValue) }
    }
    
    public var areaInformation: NSObject? {
        get { getValue(key: kCGImagePropertyGPSAreaInformation.string) }
        set { setValue(key: kCGImagePropertyGPSAreaInformation.string, value: newValue) }
    }
    
    public var dateStamp: String? {
        get { getValue(key: kCGImagePropertyGPSDateStamp.string) }
        set { setValue(key: kCGImagePropertyGPSDateStamp.string, value: newValue) }
    }
    
    public var differental: Double? {
        get { getValue(key: kCGImagePropertyGPSDifferental.string) }
        set { setValue(key: kCGImagePropertyGPSDifferental.string, value: newValue) }
    }
    
    public var hPositioningError: Double? {
        get { getValue(key: kCGImagePropertyGPSHPositioningError.string) }
        set { setValue(key: kCGImagePropertyGPSHPositioningError.string, value: newValue) }
    }
}
