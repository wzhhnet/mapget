/*!
# Core Vehicles

This package defines vehicles, including their properties, pose, and
 type.

**Dependencies**

!*/

package core.vehicle;

import core.types.*;
import core.geometry.*;

/*!

## Vehicle Dimensions

The vehicle dimensions comprise the length, width, height, and weight of a
vehicle or its trailers. Length, width, and height are expressed in centimeters. The
weight is expressed in 10-kg steps.

If any of these values is unknown or not applicable, the corresponding
constant ist used.

!*/

/** Dimensions of a vehicle. */
struct VehicleDimensions
{
  /**
    * Length of the vehicle. If the length is unknown or not applicable, the
    * constant `UNKNOWN_VEHICLE_LENGTH` is used.
    */
  VehicleLength length;

  /** Width of the vehicle. If the width is unknown or not applicable, the
    * constant `UNKNOWN_VEHICLE_WIDTH` is used.
    */
  VehicleWidth width;

  /** Height of the vehicle. If the height is unknown or not applicable, the
    * constant `UNKNOWN_VEHICLE_HEIGHT` is used.
    */
  VehicleHeight height;

  /** Weight of the vehicle. If the weight is unknown or not applicable, the
    * constant `UNKNOWN_VEHICLE_WEIGHT` is used.
    */
  VehicleWeight weight;
};

/** Vehicle length in centimeters. */
subtype LengthCentimeters VehicleLength;

/** Vehicle width in centimeters. */
subtype WidthCentimeters VehicleWidth;

/** Vehicle height in centimeters. */
subtype HeightCentimeters VehicleHeight;

/** Vehicle weight in kilogram in 10 kg steps. */
subtype Weight10Kilogram VehicleWeight;

/** Use if vehicle length is unknown or not applicable. */
const VehicleLength UNKNOWN_VEHICLE_LENGTH = 0;

/** Use if vehicle width is unknown or not applicable. */
const VehicleWidth UNKNOWN_VEHICLE_WIDTH = 0;

/** Use if vehicle height is unknown or not applicable. */
const VehicleHeight UNKNOWN_VEHICLE_HEIGHT = 0;

/** Use if vehicle weight is unknown or not applicable. */
const VehicleWeight UNKNOWN_VEHICLE_WEIGHT = 0;

/** Number of trailers of a vehicle. */
subtype bit:7 NumTrailers;

/** Length of a trailer in centimeters. */
subtype LengthCentimeters TrailerLengthMetric;

/** Length of a trailer in inches. */
subtype LengthInch TrailerLengthImperial;

/*!

## Vehicle Pose

The vehicle pose refers to one of the following two things:

- The raw pose of the vehicle as determined by sensors of the vehicle. The
  position has not been matched with a map or other data.
- The pose of the vehicle matched to a geographic position on a map. Its
  reference system is the global geographic coordinate system. However, it is not
  defined whether the pose has been matched to a road or a lane.

!*/

rule_group VehiclePoseRules
{
  /*!
  Valid Pitch Values:

  `Pitch` shall be less than or equal to +90 degrees and greater than or
  equal to -90 degrees.
  !*/

  rule "core-09t2tk";
};

union VehiclePose
{
  /** Raw pose of the vehicle. */
  PoseRaw poseRaw;

  /** Pose of the vehicle matched to a geographic coordinate. */
  PoseGeoMatched poseGeoMatched;
};

/** Raw pose of the vehicle. */
struct PoseRaw
{
  /** Longitude of the vehicle. */
  Longitude longitude;

  /** Latitude of the vehicle. */
  Latitude latitude;

  /** Height above WGS 84 reference ellipsoid. */
  optional Elevation elevation;

  /** Absolute heading of the vehicle, derived from vehicle sensors. */
  optional Heading  heading;

  /** Pitch of the vehicle, derived from vehicle sensors. */
  optional Pitch pitch;

  /**
    * Speed of the vehicle.
    * The value is always stored in kilometers per hour and must be calculated to
    * miles per hour if required.
    */
  optional SpeedKmh  speed;
};

/** Timed raw pose of the vehicle. */
struct TimedRawPose
{
  /** Age of the pose in milliseconds since the raw pose has been measured. */
  Milliseconds age;

  /** Raw pose of the vehicle. */
  PoseRaw pose;
};

/** Pose of the vehicle matched to a geographic coordinate. */
struct PoseGeoMatched
{
  /** Absolute geographic position using NDS coordinates in full resolution. */
  Position2D(0) coordinate;

  /** Optional height above WGS 84 reference ellipsoid in cm. */
  optional Elevation elevation;

  /** z-level of the road or lane that the position has been matched to. */
  optional int8 zLevel;

  /** Functional road class. */
  optional FunctionalRoadClass frc;

  /** Optional absolute heading of the vehicle. */
  optional Heading          heading;

  /**
    * Optional speed of the vehicle.
    * The value is always stored in kilometers per hour and must be calculated to
    * miles per hour if required.
    */
  optional SpeedKmh  speed;

  /** Optional matching probability. */
  optional MatchProbability probability;
};

/**
 * Vehicle heading in steps of ~1.4 degree. Value 0 means pointing north.
 * Values are increasing clockwise.
 */
subtype uint8 Heading;

/**
  * Vehicle pitch in steps of ~0.7 degrees. Positive values mean that the vehicle
  * pitch is going up, negative values means that the pitch is going down.
*/
subtype int8 Pitch;

/** Probability details of a position or path which was matched onto underlying map data. */
struct MatchProbability
{
  /** Percent in 0.5 percent steps. */
  uint8     percent : percent <= 200;

  /** Expected deviation in cm. */
  varuint32 deviation;
};

/*!

## Vehicle Type

Vehicle type information can be used to describe vehicle types, which can
be combined with prohibitions.

!*/

/** Container to hold all vehicle types handled in NDS. */
struct VehicleTypeInformation
{
  /** Frequently used vehicles. */
  FrequentlyUsedVehicleTypes   frequentlyUsedVehicles;

  /** Big vehicles. */
  BigVehicleTypes              bigVehicles;

  /** Public service vehicles. */
  PublicServiceVehicleTypes    publicServiceVehicles;

  /** Slow road users. */
  SlowRoadUserTypes            slowRoadUsers;

  /** Additional details on emergency or military vehicles. */
  EmergencyMilitaryDetailTypes     emergencyMilitaryDetails;
};

/** Presumed to be the most frequently used vehicle types. */
bitmask varuint32 FrequentlyUsedVehicleTypes
{
  /** All motorized vehicles, independent of their type. */
  MOTORIZED_VEHICLE,

  /** All cars, according to local legislation. */
  PERSONAL_CAR,

  /** All trucks, according to local legislation. */
  TRUCK,

  /** All motorcycles, according to local legislation. */
  MOTORCYCLE,

  /** All buses, according to local legislation. */
  BUS,

  /** Vehicles fast enough to be allowed to use motorways. */
  NOT_LIGHT_MOTORIZED_VEHICLE,

  /** Any type of commercial vehicle, according to local legislation. */
  COMMERCIAL_VEHICLE,
};

/** Trucks, buses, and other big vehicles. */
bitmask varuint32 BigVehicleTypes
{
  /** Minivan. */
  MINIVAN,

  /** Delivery vehicles available in Japan and USA. */
  ONE_BOX_TYPE_VEHICLE,

  /**
   * Truck-like vehicles below a threshold in weight or size so that
   * rules for normal trucks do not apply.
   */
  LIGHT_TRUCK,

  /** Normal trucks. */
  NORMAL_TRUCK,

  /** Trucks for fluid loads. */
  TANK_TRUCK,

  /** Recreational vehicles. */
  RECREATION_VEHICLE,
};

/** Public service vehicles. */
bitmask varuint32 PublicServiceVehicleTypes
{
  /** Buses for public usage. */
  PUBLIC_BUS,

  /** Vehicles used to transport children to school and back. */
  SCHOOL_BUS,

  /**
    * Streetcars propelled by electric current.
    * Trolleys do not use tracks but drive directly on the road.
    * Trolleys receive electrical power via overhead wires. Some trolleys can
    * cover short distances using battery power.
    */
  TROLLEY,

  /**
    * Streetcars propelled by electric current. Trams drive on tracks.
    */
  TRAM,

  /** Taxis or similar services. */
  TAXI,

  /** Ambulances, police vehicles, or firefighter vehicles. */
  EMERGENCY,

  /** Mail delivery vehicles. */
  MAIL,
};

/** Public bus types. */
bitmask varuint32 PublicBusType
{
  /** Bus with two sections, also known as bendy bus, stretch bus, or tandem bus. */
  ARTICULATED_BUS,

  /** Bus with standing passengers. */
  BUS_WITH_STANDING_PASSENGERS,

  /** Bus that is allowed to travel at higher speeds. */
  HIGHSPEED_BUS,
};

/** Non-motorized, low-power, or low-speed road users. */
bitmask varuint32 SlowRoadUserTypes
{
  /** Pedestrians. */
  PEDESTRIAN,

  /** People pulling non-motorized carts. */
  PEDESTRIAN_WITH_HANDCART,

  /** Carriages moved by horses, mules, donkeys, etc. */
  HORSE_DRIVEN_CARRIAGE,

  /**
    * Bicycles. Includes electric bicycles.
    */
  BICYCLE,

  /**
    * Motor scooters. Includes electric motor scooters.
    */
  SCOOTER,

  /** Motorized rickshaws, for example, a Tuk-Tuk. */
  MOTORIZED_RICKSHAW,

  /** Low-powered motorcycles. */
  MOPED,

  /** People on horses, mules, donkeys, etc. */
  RIDER,

  /** Vehicles mainly used for agricultural or forestry purposes. */
  TRACTOR,
};

/** Special vehicles of emergency services or military. */
bitmask varuint32 EmergencyMilitaryDetailTypes
{
  /** Police vehicles. */
  POLICE,

  /** Firefighter vehicles. */
  FIRE_DEPARTMENT,

  /** Motorized vehicles with medical facilities. */
  AMBULANCE,

  /**
    * Any kind of military car. If more details are needed,
    * `EmergencyMilitaryDetails` can be used in addition.
    */
  MILITARY_PERSONAL_CAR,

  /** Military trucks. */
  MILITARY_TRUCK,

  /** Armored combat vehicles. */
  MILITARY_TANK,
};

/** Authorization for vehicles, useful for prohibitions. */
bitmask varuint32 Authorization
{
  /** Vehicles of residents living along streets. */
  RESIDENTIAL,

  /** Vehicles that are used for agricultural purposes. */
  AGRICULTURAL,

  /** Vehicles that are used for forestry. */
  FORESTRY,

  /** Military vehicles. */
  MILITARY,

  /** Vehicles that belong to a given facility. */
  FACILITY,

  /**  Vehicles that are used by the employees of a given facility. */
  EMPLOYEES,

  /** Vehicles delivering or picking up goods. */
  DELIVERY,

  /** Vehicles used by disabled persons only. */
  DISABLED_PERSONS,

  /** Special authorization is required, for example, on private roads. */
  SPECIAL_AUTHORIZATION,

  /** Vehicles registered in foreign countries. */
  FOREIGN_VEHICLE,

  /**
   * Indicates that a vehicle is local. Can be used, for example, to
   * define prohibition to use elevated roads if not local resident.
   */
  LOCAL_VEHICLE,

  /** Vehicles that have paid a fee for authorization, for example, a toll or parking fee. */
  FEE_PAID,

  /** Vehicles that have their license plate registered for special authorization. */
  REGISTERED_LICENSE_PLATE,
};

/*!

## Vehicle Classes

Vehicle classes are described by multiple items representing different
properties of the vehicles inside this class, such as engine type, emission
class, or special equipment.

If any of the values in the axle details is unknown or not applicable, the
corresponding constant ist used.

!*/

/** Specification of a class of vehicles. */
struct VehicleClassSpecification
{
  /** Engine types applicable for this class. */
  Engine engine;

  /** Equipment types applicable for this class. */
  Equipment equipment;

  /** Maximum vehicle dimensions for this class. */
  VehicleDimensions maxDimensions;

  /** Minimum vehicle dimensions for this class. */
  VehicleDimensions minDimensions;

  /** Load types applicable for this class of vehicles. */
  LoadType load;

  /** Maximum axle weights for this class of vehicles. */
  AxleDetails axles;

  /** Autonomous driving automation levels for this class of vehicles. */
  DriverAssistFunctions assistFunctions;
};

/** Engine of a vehicle. */
struct Engine
{
  /** Energy type consumed by the engine. */
  EnergyType energyType;

  /** Euro emission class of the engine. */
  VehicleEuroEmissionClass euroEmissionClass;
};

/** Energy type to power a vehicle. */
bitmask varuint32 EnergyType
{
  /** Bio diesel B100 to B20 (inclusive). */
  BIO_DIESEL,

  /** Compressed natural gas (CNG). */
  CNG,

  /** Diesel including all biodiesel blends up to B20 (exclusive). */
  DIESEL,

  /** Diesel for commercial vehicles, also known as truck diesel. */
  DIESEL_COMMERCIAL,

  /** Ethanol fuel blend with 85 % ethanol fuel and 15 % gasoline. */
  E85,

  /** Ethanol fuel E100, including ED95. */
  ETHANOL,

  /** Gasoline including ethanol blends up to E20. */
  GASOLINE,

  /** Hydrogen. */
  HYDROGEN,

  /** Liquefied petroleum gas (LPG), also known as autogas. */
  LPG,

  /** Electricity. */
  ELECTRICITY,
};


/** Classes of the emission standards for vehicles in the European Union. */
bitmask varuint32 VehicleEuroEmissionClass
{
  /** Euro 1 stage for passenger cars and light commercial vehicles. */
  EURO_1,

  /** Euro 2 stage for passenger cars and light commercial vehicles. */
  EURO_2,

  /** Euro 3 stage for passenger cars and light commercial vehicles. */
  EURO_3,

  /** Euro 4 stage for passenger cars and light commercial vehicles. */
  EURO_4,

  /** Euro 5 stage for passenger cars and light commercial vehicles. */
  EURO_5,

  /** Euro 5a stage for passenger cars and light commercial vehicles. */
  EURO_5A,

  /** Euro 5b stage for passenger cars and light commercial vehicles. */
  EURO_5B,

  /** Euro 6b stage for passenger cars and light commercial vehicles. */
  EURO_6B,

  /** Euro 6c stage for passenger cars and light commercial vehicles. */
  EURO_6C,

  /** Euro 6d-Temp stage  for passenger cars and light commercial vehicles. */
  EURO_6D_TEMP,

  /** Euro 6d stage for passenger cars and light commercial vehicles. */
  EURO_6D,

  /** Euro 7 stage for passenger cars and light commercial vehicles. */
  EURO_7,

  /** Euro 0 stage for trucks and buses. */
  EURO_0,

  /** Euro I stage for trucks and buses. */
  EURO_I,

  /** Euro II stage for trucks and buses. */
  EURO_II,

  /** Euro III stage for trucks and buses. */
  EURO_III,

  /** Euro IV stage for trucks and buses. */
  EURO_IV,

  /** Euro V stage for trucks and buses. */
  EURO_V,

  /** Euro VI stage for trucks and buses. */
  EURO_VI,
};

/** Additional equipment of a vehicle. */
bitmask varuint32 Equipment
{
  /** Vehicle is towing a trailer. */
  TRAILER,

  /** Vehicle is towing a caravan. */
  CARAVAN,

  /** Vehicle is towing a semi-trailer. */
  SEMI_TRAILER,

  /** Vehicle has snow chains. */
  SNOW_CHAINS,

  /** Vehicle has 4-wheel drive. */
  FOUR_WHEEL_DRIVE,

  /** Vehicle has a particulate filter. */
  PARTICULATE_FILTER,
};

/** Type of load that is carried by a vehicle. */
bitmask varuint32 LoadType
{
  /** Water-polluting load. */
  WATER_POLLUTING,

  /** Explosive load. */
  EXPLOSIVE,

  /** Unspecified dangerous goods. */
  OTHER_DANGEROUS_GOODS,

  /** No load. */
  NO_LOAD,

  /** Special load. */
  SPECIAL_LOAD,

  /** Gas load. */
  GAS,

  /** Flammable liquids load. */
  FLAMMABLE_LIQUIDS,

  /** Flammable solids load. */
  FLAMMABLE_SOLIDS,

  /**Oxidizers and organic peroxides load. */
  OXIDIZERS_AND_ORGANIC_PEROXIDES,

  /** Toxic and infectious substances load. */
  TOXIC_AND_INFECTIOUS_SUBSTANCES,

  /** Radioactive load. */
  RADIOACTIVE_SUBSTANCES,

  /** Corrosive substances load. */
  CORROSIVE_SUBSTANCES,
};

/** Detailed information on the axles of a vehicle. */
struct AxleDetails
{
  /**
    * Number of axles on the vehicle. If the number of axles is unknown or not
    * applicable, the constant `UNKNOWN_NUM_AXLES` is used.
    */
  NumAxles numAxles;

  /**
    * Maximum weight on tandem axle in steps of 10 kg. If the weight is unknown
    * or not applicable, the constant `UNKNOWN_AXLE_WEIGHT` is used.
    */
  AxleWeight maxTandemAxleWeight;

  /**
    * Maximum weight on tridem axle in steps of 10 kg. If the weight is unknown
    * or not applicable, the constant `UNKNOWN_AXLE_WEIGHT` is used.
    */
  AxleWeight maxTridemAxleWeight;

  /**
    * Maximum weight on steering axle in steps of 10 kg. If the weight is unknown
    * or not applicable, the constant `UNKNOWN_AXLE_WEIGHT` is used.
    */
  AxleWeight maxSteeringAxleWeight;
};

/** Subtype to define number of axles of a vehicle. */
subtype uint8 NumAxles;

/** Use if number of axles is unknown or not applicable. */
const NumAxles UNKNOWN_NUM_AXLES = 0;

/** Subtype to define weight of an axle in steps of 10 kg. */
subtype Weight10Kilogram AxleWeight;

/** Use if axle weight is unknown or not applicable. */
const AxleWeight UNKNOWN_AXLE_WEIGHT = 0;

/** Autonomous driving automation level as defined by SAE. */
bitmask varuint32 DriverAssistFunctions
{
  /** Autonomous driving automation level 0. */
  AUTONOMOUS_DRIVING_LEVEL_0,

  /** Autonomous driving automation level 1. */
  AUTONOMOUS_DRIVING_LEVEL_1,

  /** Autonomous driving automation level 2. */
  AUTONOMOUS_DRIVING_LEVEL_2,

  /** Autonomous driving automation level 3. */
  AUTONOMOUS_DRIVING_LEVEL_3,

  /** Autonomous driving automation level 4. */
  AUTONOMOUS_DRIVING_LEVEL_4,

  /** Autonomous driving automation level 5. */
  AUTONOMOUS_DRIVING_LEVEL_5,
};

/*!

## Vehicle Specification

A vehicle specification describes a vehicle using the basic properties vehicle
type and vehicle class, as well as and any special authorizations.

!*/

/** Detailed vehicle specification. */
struct VehicleSpecification
{
  /** Type of vehicle. */
  VehicleTypeInformation  vehicleType;

  /** Vehicle class specification. */
  VehicleClassSpecification vehicleClassSpecification;

  /** Special authorization for the vehicle. */
  Authorization authorization;
};

/*!

## Vehicle Details

Vehicle details describe a dedicated vehicle using types, class specification
and other details such as consumption models, license plate, or current
occupancy.

!*/

rule_group VehicleDetailsRules
{
  /*!
  Only One Value in Bitmask:

  `vehicleClassSpecification.engine.euroEmissionClass` shall only have one bit
  set in the bitmask.
  !*/

  rule "core-2cc5t4";

  /*!
  Only One Combustion Energy Type:

  `vehicleClassSpecification.engine.energyType` shall only have one combustion
  type set. Hybrid vehicles shall have `EnergyType.ELECTRICITY` or
  `EnergyType.HYDROGEN` set in addition.
  !*/

  rule "core-2e5jcx";

  /*!
  Only Set Maximum Dimensions:

  All values of `vehicleClassSpecification.minDimensions` shall be set to 0.
  The actual vehicle dimensions shall be set using
  `vehicleClassSpecification.maxDimensions`.
  !*/

  rule "core-2e94cb";
};

/** Detailed description of a vehicle. */
struct VehicleDetails
{
  /** Type of vehicle. */
  VehicleTypeInformation  vehicleType;

  /** Vehicle class specification. */
  VehicleClassSpecification vehicleClassSpecification;

  /** ADR tunnel restriction code for the vehicle. */
  AdrTunnelRestriction  tunnelRestriction;

  /** Maximum speed the vehicle is able or allowed to drive.
    * The value is always stored in kilometers per hour and must be calculated to
    * miles per hour if required.
    */
  SpeedKmh maxSpeed;

  /** Consumption model for combustion engines. */
  optional CombustionConsumption combustionConsumption;

  /** Consumption model for electric engines. */
  optional ElectricConsumption electricConsumption;

  /** Engine manufacturing year. */
  optional Year engineManufacturingYear;

  /** License plate of the vehicle. */
  optional string licensePlate;

  /** ISO country code of the country where the vehicle is registered. */
  optional IsoCountryCode registrationCountry;

  /** Current occupancy of the vehicle. */
  optional varuint16 currentOccupancy;
};

/**
  * Vehicle is subject to ADR tunnel category restrictions.
  * ADR tunnel categories are defined according to the European Agreement
  * concerning the International Carriage of Dangerous Goods by Road.
  */
enum uint8 AdrTunnelRestriction
{
  /** Not applicable. */
  NONE,

  /**
    * Vehicles with code B are restricted from roads with ADR tunnel categories
    * B, C, D and E.
    */
  B,

  /**
    * Vehicles with code C are restricted from roads with ADR tunnel categories
    * C, D, and E.
    */
  C,

  /**
    * Vehicles with code D are restricted from roads with ADR tunnel categories
    * D, and E.
    */
  D,

  /**
    * Vehicles with code E are restricted from roads with ADR tunnel category E.
    */
  E,
};

/*!

## Vehicle Energy Consumption

There are two consumption models depending on the type of engine:
combustion and electric.
They are used to calculate remaining ranges and how much energy a vehicle
needs, for example, for a calculated route.

The consumption curve defines the speed-dependent component of consumption.
It is a list of speed and consumption rate pairs which defines points on a
consumption curve. Consumption rates that are not in the list can be
determined using interpolation or extrapolation.

!*/

rule_group VehicleEnergyConsumptionRules
{
  /*!
  No Duplicate Speeds in Combustion Consumption Curve:

  There shall be no duplicate speed values in the
  `CombustionConsumptionCurve.speed` list.
  !*/

  rule "core-2f6hen";

  /*!
  No Duplicate Speeds in Electric Consumption Curve:

  There shall be no duplicate speed values in the
  `ElectricConsumptionCurve.speed` list.
  !*/

  rule "core-2ha9so";

  /*!
  Last Value in Combustion Consumption Curve:

  The last `consumption` value in the `CombustionConsumptionCurve` shall be
  greater than or equal to the penultimate value to allow extrapolation
  without negative values.
  !*/

  rule "core-2fhjkv";

  /*!
  Last Value in Electric Consumption Curve:

  The last `consumption` value in the `ElectricConsumptionCurve` shall be
  greater than or equal to the penultimate value to allow extrapolation
  without negative values.
  !*/

  rule "core-2iga9k";

  /*!
  Acceleration Efficiency and Deceleration Efficiency:

  `accelerationEfficiency` shall be in the range between 0 and
  (1/`decelerationEfficiency`).
  `decelerationEfficiency` shall be in the range between 0 and
  (1/`accelerationEfficiency`).
  !*/

  rule "core-2fnhma";

  /*!
  Uphill Efficiency and Downhill Efficiency:

  `uphillEfficiency` shall be in the range between 0 and (1/`downhillEfficiency`).
  `downhillEfficiency` shall be in the range between 0 and (1/`uphillEfficiency`).
  !*/

  rule "core-2gtiyb";
};


/** Consumption details for combustion engines. */
struct CombustionConsumption
{
  /** Current fuel supply in liters. */
  FuelLiters currentFuelSupply;

  /**
    * Optional consumption by all auxiliary systems of the vehicle, for example,
    * air conditioning.
    */
  optional LitersPerHour auxConsumption;

  /** Consumption curve of the vehicle under normal conditions. */
  CombustionConsumptionCurve normalConsumption;

  /**
    * Optional consumption curve of the vehicle under higher traffic conditions.
    */
  optional CombustionConsumptionCurve trafficConsumption;

  /** Optional vehicle parameters needed for efficiency calculations. */
  optional ConsumptionEfficiency efficiency;
};

/** Consumption details for electric engines. */
struct ElectricConsumption
{
  /** Maximum energy supply that can be stored in the battery of the vehicle. */
  WattHrs maxCharge;

  /** Current charge in Watt-hours. */
  WattHrs currentCharge : currentCharge <= maxCharge;

  /**
    * Optional consumption by all auxiliary systems of the vehicle, for example,
    * air conditioning)
    */
  optional Watt auxConsumption;

  /** Consumption curve of the vehicle under normal conditions. */
  ElectricConsumptionCurve normalConsumption;

  /**
    * Optional consumption curve of the vehicle under higher traffic conditions.
    */
  optional ElectricConsumptionCurve trafficConsumption;

  /** Optional vehicle parameters needed for efficiency calculations. */
  optional ConsumptionEfficiency efficiency;

  /** Energy consumption by the vehicle when gaining 1000 meter in elevation. */
  optional WattHrsPerKm consumptionElevationGain;

  /** Energy recuperation by the vehicle when loosing 1000 meters of elevation. */
  optional WattHrsPerKm recuperationElevationLoss;
};

/** Consumption curve for combustion engine. */
struct CombustionConsumptionCurve
{
  /** Number of entries in the consumption curve. */
  uint8 numEntries;

  /** List of speed values.
    * The values are always stored in kilometers per hour and must be calculated to
    * miles per hour if required.
    */
  SpeedKmh speed[numEntries];

  /**
    * List of consumption values. The consumption at `consumption[numEntries]`
    * is valid for the speed at `speed[numEntries]`.
    */
  LitersPer100km consumption[numEntries];
};

/** Consumption curve for electric engine. */
struct ElectricConsumptionCurve
{
  /** Number of entries in the consumption curve. */
  uint8 numEntries;

  /** List of speed values.
    * The values are always stored in kilometers per hour and must be calculated to
    * miles per hour if required.
    */
  SpeedKmh speed[numEntries];

  /**
    * List of consumption values. The consumption at `consumption[numEntries]`
    * is valid for the speed at `speed[numEntries]`.
    */
  WattHrsPer100km consumption[numEntries];
};

/** Vehicle parameters for efficiency calculations. */
struct ConsumptionEfficiency
{
  /** Gross weight of the vehicle including trailers and shipped goods. */
  Weight10Kilogram grossWeight;

  /**
    * Specifies the efficiency of converting chemical or electric energy to
    * kinetic energy when accelerating.
    */
  float16 accelerationEfficiency;

  /**
    * Specifies the efficiency of converting kinetic energy to saved energy
    * when decelerating. Saved energy can refer to either non-consumed fuel or
    * saved electric energy.
    */
  float16 decelerationEfficiency;

  /**
    * Specifies the efficiency of converting chemical or electric energy to
    * potential energy when the vehicle gains elevation.
    */
  float16 uphillEfficiency;

  /**
    * Specifies the efficiency of converting potential energy to saved energy
    * when the vehicle loses elevation. Saved energy can refer to either
    * non-consumed fuel or saved electric energy.
    */
  float16 downhillEfficiency;
};

/** Fuel consumption in liters per 100 km. */
subtype float16 LitersPer100km;

/** Fuel consumption in liters per hour. */
subtype float16 LitersPerHour;

/** Fuel in liters. */
subtype float16 FuelLiters;

/** Engine displacement in cubic centimeters. */
subtype varuint16 EngineDisplacement;

/** Energy in Watt-hours (Wh) per 100 km. */
subtype varuint32 WattHrsPer100km;

/** Energy in Watt-hours (Wh) per kilometer. */
subtype varuint32 WattHrsPerKm;

/** Energy in Watt-hours (Wh). */
subtype varuint32 WattHrs;

/** Power in Watt. */
subtype varuint32 Watt;

/** Voltage. */
subtype varuint16 Voltage;

/** Ampere. */
subtype varuint16 Ampere;
