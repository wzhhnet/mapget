/*!

# POI Reference Types

This package defines identifiers and references for the POI module.

**Dependencies**

!*/

package poi.reference.types;

import core.geometry.*;
import core.location.*;

rule_group PoiIdentifierRules
{
  /*!
  Unique POI IDs:

  POI IDs shall be unique per tile or object defined by the smart layer service.
  !*/

  rule "poi.reference-z0bsw4";
};

/**
 * A tile unique identifier of a POI.
 */
subtype varuint32 PoiId;

/**
 * Id of a Poi category.
 */
subtype varuint32 PoiCategoryId;

/** Direct reference to a POI within the same tile. */
subtype PoiId PoiReference;

/**
  * Standard POI categories. POIs are (indirectly) associated with at least
  * one standard category.
  */
enum varuint16 PoiStandardCategory
{
  /** Access point to another POI. */
  POICAT_ACCESS_POINT,

  /** Activation point, located near an activated POI. */
  POICAT_ACTIVATION_POINT,

  /** Logical access point to another POI. */
  POICAT_LOGICAL_ACCESS_POINT,

  /** Guidance point, which can be used to give intuitive route guidance. */
  POICAT_GUIDANCE_POINT,

  /**
    * Default standard category for custom POI categories if no other standard
    * POI category applies.
    */
  POICAT_NDSGENERAL,

  /** Vehicle repair facility. */
  POICAT_VEHICLE_REPAIR,

  /** Filling station, also known as gas station or petrol station. */
  POICAT_FILLING_STATION,

  /** Car rental. */
  POICAT_RENT_A_CAR,

  /** Car wash. */
  POICAT_CAR_WASH,

  /** Car dealership. */
  POICAT_CAR_DEALERSHIP,

  /** Motorcycle dealership. */
  POICAT_MOTORCYCLE_DEALERSHIP,

  /** Truck dealership. */
  POICAT_TRUCK_DEALERSHIP,

  /** Parking garage. */
  POICAT_PARKING_GARAGE,

  /** Parking row. */
  POICAT_PARKING_ROW,

  /** Parking spot. */
  POICAT_PARKING_SPOT,

  /** Open parking. */
  POICAT_OPEN_PARKING,

  /**
    * Rest area located along motorways offering one or more recreational
    * facilities or service functions to drivers.
    */
  POICAT_REST_AREA,

  /** Road assistance. */
  POICAT_ROAD_ASSISTANCE,

  /** Camping. */
  POICAT_CAMPING,

  /** Caravan site. */
  POICAT_CARAVAN_SITE,

  /** Parking for buses and trucks. */
  POICAT_BUS_AND_TRUCK_PARKING,

  /**
    * Motoring organization office. A national club or subscription-based
    * organization offering services and facilities for motorists.
    */
  POICAT_MOTORING_ORG_OFFICE,

  /** Car shipping terminal where cars are loaded onto ferries. */
  POICAT_CAR_SHIPPING_TERMINAL,

  /** Hotel or motel. */
  POICAT_HOTEL_MOTEL,

  /**
    * Restaurant offering meals for payment, including seating facilities and
    * take-away meals. Hotels or pubs can be included in this POI category.
    */
  POICAT_RESTAURANT,

  /** Fast-food establishment offering take-away meals for payment. */
  POICAT_FAST_FOOD,

  /** Coffee shop, which mainly serves coffee or tea. */
  POICAT_COFFEE_SHOP,

  /**
    * Bar or pub that serves alcoholic beverages, provides seating, and can be
    * serving food.
    */
  POICAT_BAR_OR_PUB,

  /** Cinema or movie theater. */
  POICAT_CINEMA,

  /** Museum. */
  POICAT_MUSEUM,

  /** Theater. */
  POICAT_THEATER,

  /** Library. */
  POICAT_LIBRARY,

  /** Hospital or polyclinic. */
  POICAT_HOSPITAL,

  /**
    * Physician. A licensed medical practitioner who provides services
    * related to restoring human health.
    */
  POICAT_PHYSICIAN,

  /** Dentist. A licensed medical practitioner who provides dental treatment. */
  POICAT_DENTIST,

  /** Pharmacy. */
  POICAT_PHARMACY,

  /**
    * Veterinarian. A licensed medical practitioner who provides services
    * related to the medical treatment of animals.
    */
  POICAT_VETERINARIAN_SERVICE,

  /** Police station. */
  POICAT_POLICE_STATION,

  /** Post office. */
  POICAT_POST_OFFICE,

  /** City hall. */
  POICAT_CITY_HALL,

  /** Embassy. */
  POICAT_EMBASSY,

  /** Court house. */
  POICAT_COURT_HOUSE,

  /** Government office for local, regional, or national government activities. */
  POICAT_GOVERNMENT_OFFICE,

  /**
    * Community center. Facilities and activities for the benefit of the local
    * community only. Community centers typically cater to special interest
    * groups, for example, children and teenagers, elderly persons, or people
    * with disabilities.
    */
  POICAT_COMMUNITY_CENTER,

  /** Shopping center. */
  POICAT_SHOPPING_CENTER,

  /**
    * Retail store selling goods, for example, book stores,
    * grocery stores, convenience stores, or clothing stores.
    */
  POICAT_STORE,

  /** Bank. */
  POICAT_BANK,

  /** Automated teller machine (ATM), also called cash dispenser.*/
  POICAT_ATM,

  /** Currency exchange. */
  POICAT_CURRENCY_EXCHANGE,

  /** Tourist office. */
  POICAT_TOURIST_OFFICE,

  /** Travel agency. */
  POICAT_TRAVEL_AGENCY,

  /** Tourist attraction. */
  POICAT_TOURIST_ATTRACTION,

  /** Historical monument. */
  POICAT_HISTORICAL_MONUMENT,

  /**
    * National park. Usually related to an access point and an activation
    * point.
    */
  POICAT_NATIONAL_PARK,

  /**
    * City center. Usually describes a central activity point of a
    * settlement or administrative area. Typically corresponds to the town
    * hall, the central train station, or other central activity center, for
    * example, a church or pedestrian district.
    */
  POICAT_CITY_CENTER,

  /**
    * Hamlet, a very small village, typically without a church. In some
    * countries, hamlets are well-known locations and are used by
    * inhabitants to refer to their home address.
    */
  POICAT_HAMLET,

  /** Zoological garden. */
  POICAT_ZOO,

  /** Amusement park. */
  POICAT_AMUSEMENT_PARK,

  /**
    * Places that people visit for evening entertainment: clubs, shows, casinos,
    * parties, etc.
    */
  POICAT_GOINGOUT,

  /** Stadium or sports arena. */
  POICAT_STADIUM,

  /**
    * Sports center. An indoor sports facility or an outdoor location used for
    * any sport, for example, golf, riding, or sailing.
    */
  POICAT_SPORTS_CENTER,

  /** Recreation facility. */
  POICAT_RECREATION,

  /** Ski resort. */
  POICAT_SKI_RESORT,

  /** Swimming pool. */
  POICAT_SWIMMING_POOL,

  /** Golf course. */
  POICAT_GOLF_COURSE,

  /** Ferry terminal. */
  POICAT_FERRY_TERMINAL,

  /** Marina. An area with docking and service facilities for yachts and small boats. */
  POICAT_MARINA,

  /**
    * Harbor. A portion of a sea, a lake, or other large body of water, either
    * land-locked or artificially protected that is a place of safety for
    * vessels in stormy weather.
    */
  POICAT_HARBOR,

  /**
    * Business facility where the main activities of a particular business
    * activity are concentrated.
    */
  POICAT_BUSINESS_FACILITY,

  /** Exhibition or conference center. */
  POICAT_EXHIBITION_CONFERENCE_CENTER,

  /** Railway station. */
  POICAT_RAILWAY_STATION,

  /**
    * Public transit stop where passengers can board or exit a public
    * transport vehicle.
    */
  POICAT_PUBLIC_TRANSIT_STOP,

  /**
    * Park and ride facility where people switch between their vehicles and
    * public transport.
    */
  POICAT_PARK_AND_RIDE,

  /** Airport. */
  POICAT_AIRPORT,

  /**
    * Airline access. An airline's check-in area at the airport, if there is
    * more than one terminal.
    */
  POICAT_AIRLINE_ACCESS,

  /**
    * Taxi stand. A designated queuing, loading, and unloading area for taxis,
    * usually in city centers and buildings with a high volume of pedestrians.
    */
  POICAT_TAXI_STAND,

  /** Emergency call station. */
  POICAT_EMERGENCY_CALL_STATION,

  /** Emergency medical service. */
  POICAT_EMERGENCY_MEDICAL_SERVICE,

  /** First aid station. */
  POICAT_FIRST_AID_POST,

  /** Fire department, also called fire brigade. */
  POICAT_FIRE_DEPARTMENT,

  /** Place of worship. */
  POICAT_PLACE_OF_WORSHIP,

  /** Place of education. */
  POICAT_EDUCATION,

  /** Customs. */
  POICAT_CUSTOMS,

  /** Frontier crossing. */
  POICAT_FRONTIER_CROSSING,

  /** Toll location. */
  POICAT_TOLL_LOCATION,

  /** Public restroom equipped with toilets and lavatories for public use. */
  POICAT_PUBLIC_RESTROOM,

  /**
    * Public phone, which may be within a building or on the street.
    * A public phone can be coin-operated or card-operated.
    */
  POICAT_PUBLIC_PHONE,

  /** Kindergarten. */
  POICAT_KINDERGARTEN,

  /** Mountain pass summit. */
  POICAT_MOUNTAIN_PASS_SUMMIT,

  /** Electric vehicle charging station. */
  POICAT_EV_CHARGING_STATION,

  /** Intersection on a controlled-access road. */
  POICAT_CONTROLLED_ACCESS_INTERSECTION,

  /**
    * Smart IC. Controlled-access roads where no cash payments are available.
    * Only electronic (ETC) payments are available.
    * Such roads are typically found in Japan or Korea.
    */
  POICAT_CONTROLLED_ACCESS_SMART_IC,

  /** Entry to a controlled-access road that is not a motorway. */
  POICAT_CONTROLLED_ACCESS_ENTRY,

  /** Exit of a controlled-access road that is not a motorway. */
  POICAT_CONTROLLED_ACCESS_EXIT,

  /** Motorway entry. */
  POICAT_MOTORWAY_ENTRY,

  /** Motorway exit. */
  POICAT_MOTORWAY_EXIT,

  /** Parking section. */
  POICAT_PARKING_SECTION,

  /** Parking venue section. */
  POICAT_PARKING_VENUE_SECTION,

  /** Electric vehicle charging park, consisting of multiple EV charging stations. */
  POICAT_EV_CHARGING_PARK,
};

/** Indirect reference to a POI. */
struct PoiReferenceIndirect
{
  /** Standard category of the referenced POI. */
  PoiStandardCategory standardCategory;

  /** Position of the referenced POI. */
  Position2D(0) position;

  /** Optional road location path that is used for map matching. */
  optional RoadLocationPath roadLocationPath;

  /** Optional name of a POI, usable for similarity checks. */
  optional string name;
};
