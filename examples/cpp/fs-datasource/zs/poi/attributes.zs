/*!

# POI Attributes

This package defines the attributes that are available in the POI attribute layer.

**Dependencies**

!*/

package poi.attributes;

import core.types.*;
import core.geometry.*;
import core.vehicle.*;
import poi.types.*;

/**
  * POI attribute types that describe POIs in more detail. For example, they
  * provide details about the services that are provided or contact details of
  * the POI.
*/
enum varuint16 PoiAttributeType
{
  /** Indicates that the POI is open 24 hours a day. */
  OPEN_24_HRS,

  /** List of accepted payment methods (credit cards, mobile payment) by a service. */
  ACCEPTED_PAYMENT_METHODS,

  /** Access point type. */
  ACCESS_POINT_TYPE,

  /** IATA airport code. */
  AIRPORT_CODE,

  /** Brand name of the service. */
  BRAND_NAME,

  /** Details of an EV charging station. */
  EV_CHARGING_DETAILS,

  /** Accepted payment methods at an EV charging station. */
  EV_CHARGING_PAYMENT_METHODS,

  /** Energy provider of an EV charging station. */
  EV_ENERGY_PROVIDER,

  /** Electric vehicle charging is free of charge. */
  EV_FREE_CHARGING,

  /** Parking is free during electric vehicle charging. */
  EV_FREE_PARKING,

  /** Availability of an EV charging station. */
  EV_CHARGING_AVAILABILITY,

  /**
    * Flag indicating that a service has opening hours.
    * Use conditions to model the actual opening times.
    */
  OPENING_HRS,

  /** E-mail address of the POI. */
  EMAIL,

  /** Phone number of the POI using the international ITU-T standard E.123. */
  PHONE_NUMBER,

  /**
    * Star rating of the service, for example, indicating the
    * quality of hotels or restaurants.
    */
  STAR_RATING,

  /** Fuel or energy types served at the POI. */
  FUEL_TYPE,

  /** Type of logical access point. */
  LOGICAL_ACCESS_POINT_TYPE,

  /** Website of the service. */
  WEBSITE,

  /**
    * Identifies whether a POI has been associated with a road that represents
    * the POI's true location or with a road nearby. The attribute suggests what
    * kind of guidance information should be provided to a user.
    * If `IN_VICINITY` does not apply to the POI, the application can state that
    * the user has arrived.
    * If `IN_VICINITY` applies to the POI, the application can tell the user that
    * the POI is nearby but that further routing advice is not available.
    */
  IN_VICINITY,

  /** Airport entrance type. Can be a main entrance, a terminal entrance, or both. */
  AIRPORT_ENTRANCE_TYPE,

  /** Type of food available at the POI. */
  FOOD_TYPE,

  /**
    * Reference to a data source containing multimedia, for example, a video in
    * the local file system or an image on the internet.
    */
  MULTIMEDIA,

  /** POI has private access. */
  PRIVATE_ACCESS,

  /**
    * Service associated with the POI is of national importance.
    * If not added, local importance is assumed.
    */
  NATIONAL_IMPORTANCE,

  /** Classification of the parking spots available at a parking facility. */
  PARKING_FACILITIES_SIZE_CLASS,

  /** Exact number of parking spots available at a parking facility. */
  PARKING_FACILITIES_SIZE,

  /**
    * Number of currently free parking spots. Indicates the occupancy of the
    * parking facility at a given moment in time.
    */
  NUM_FREE_PARKING_SPOTS,

  /**
    * DEPRECATED. Use `FACILITIES` instead.
    * Available services at a rest area POI.
    */
  REST_AREA_SERVICE_AVAILABILITY,

  /** Infrastructure accessibility aids. */
  ACCESSIBILITY_AIDS,

  /** Available restaurant facilities. */
  RESTAURANT_FACILITIES_AVAILABLE,

  /** Traffic service is available for departures, arrivals, or both. */
  DEPARTURE_ARRIVAL_SERVICE,

  /** Categorizes the cost of a service, for example, the price level of a restaurant. */
  PRICE_RANGE,

  /** Short description of the POI. */
  SHORT_DESCRIPTION,

  /** Long description of the POI. */
  LONG_DESCRIPTION,

  /** Floor number of the POI. */
  FLOOR_NUMBER,

  /** Number of rooms with en-suite facilities, for example, in hotels. */
  NUMBER_OF_ROOMS_EN_SUITE,

  /** Building that indicates a place of worship. */
  PLACE_OF_WORSHIP_TYPE,

  /** Sportive activities. */
  AVAILABLE_SPORTIVE_ACTIVITIES,

  /** Fee taken at the POI for getting the respective service. */
  SERVICE_FEE,

  /** Types of services the car dealer offers. */
  CAR_DEALER_TYPE,

  /**
    * Indicates that the POI is of major importance.
    * Can be used, for example, for post offices, airports, railway stations, or
    * access points.
    */
  MAJOR_IMPORTANCE,

  /** Airport service type. */
  AIRPORT_SERVICE_AVAILABILITY,

  /** Airport is structurally used for military activities. */
  AIRPORT_MILITARY,

  /** Transit type. */
  TRANSIT_TYPE,

  /** Details about the access point, for example, the used access method. */
  ACCESS_POINT_DETAILS,

  /** Specifies whether parking is provided with a park and ride facility. */
  PARK_AND_RIDE_FACILITY,

  /** Defines if and how AdBlue fuel is available. */
  ADBLUE_AVAILABILITY,

  /**
    * Fuel cell electric vehicles are designed to accept hydrogen at different
    * pressures.
    */
  HYDROGEN_PRESSURE_AVAILABILITY,

  /** URL for checking the availability of the service. */
  AVAILABILITY_URL,

  /** Relevance of a POI in relation to the distance to another point. */
  RELEVANCE_RADIUS,

  /** Global source ID of the POI. */
  GLOBAL_SOURCE_ID,

  /** ISO country code and subdivision code of the region in which the POI is located. */
  ISO_DETAILS,

  /** Facilities available at a POI. */
  FACILITIES,

  /** Charge point operator of an EV charging station. */
  EV_CHARGE_POINT_OPERATOR,

  /** List of supported Electric Mobility Service Providers (EMSP) at a charging station. */
  EV_SUPPORTED_EMSP,

  /**
    * EV charging available when closed.
    * Vehicles can continue charging even when the POI is closed.
    */
  EV_CHARGING_WHEN_CLOSED,
};

choice PoiAttributeValue(PoiAttributeType type) on type
{
  case OPEN_24_HRS:
    Open24Hrs open24Hrs;
  case ACCEPTED_PAYMENT_METHODS:
    AcceptedPaymentMethods acceptedPaymentMethods;
  case ACCESS_POINT_TYPE:
    AccessPointType accessPointType;
  case AIRPORT_CODE:
    string airportCode;
  case BRAND_NAME:
    string brandName;
  case EV_CHARGING_DETAILS:
    EvChargingStationDetails evChargingStationDetails;
  case EV_CHARGING_PAYMENT_METHODS:
    AcceptedPaymentMethods acceptedChargingPayment;
  case EV_ENERGY_PROVIDER:
    string evEnergyProvider;
  case EV_FREE_CHARGING:
    EvFreeCharging evFreeCharging;
  case EV_FREE_PARKING:
    EvFreeParking evFreeParking;
  case EV_CHARGING_AVAILABILITY:
    EvChargingAvailability evChargingAvailability;
  case OPENING_HRS:
    OpeningHrs openingHrs;
  case EMAIL:
    string email;
  case PHONE_NUMBER:
    string phoneNumber;
  case STAR_RATING:
    StarRating stars;
  case FUEL_TYPE:
    EnergyType fuelType;
  case LOGICAL_ACCESS_POINT_TYPE:
    LogicalAccessPointType logicalAccessPointType;
  case WEBSITE:
    string website;
  case IN_VICINITY:
    InVicinity InVicinity;
  case AIRPORT_ENTRANCE_TYPE:
    AirportEntranceType airportEntranceType;
  case FOOD_TYPE:
    FoodType foodType;
  case MULTIMEDIA:
    MultimediaResourceReference multimediaResourceReference;
  case PRIVATE_ACCESS:
    PrivateAccess privateAccess;
  case NATIONAL_IMPORTANCE:
    NationalImportance nationalImportance;
  case PARKING_FACILITIES_SIZE_CLASS:
    ParkingFacilitiesSizeClass parkingFacilitiesSizeClass;
  case PARKING_FACILITIES_SIZE:
    ParkingFacilitiesSize parkingFacilitiesSize;
  case NUM_FREE_PARKING_SPOTS:
    NumFreeParkingSpots numFreeParkingSpots;
  case REST_AREA_SERVICE_AVAILABILITY:
    RestAreaServiceAvailability restAreaServiceAvailability;
  case ACCESSIBILITY_AIDS:
    AccessibilityAids accessibilityAids;
  case RESTAURANT_FACILITIES_AVAILABLE:
    RestaurantFacilitiesAvailable restaurantFacilitiesAvailable;
  case DEPARTURE_ARRIVAL_SERVICE:
    DepartureArrivalService departureArrivalService;
  case PRICE_RANGE:
    PriceRange priceRange;
  case SHORT_DESCRIPTION:
    PoiShortDescription shortDescription;
  case LONG_DESCRIPTION:
    PoiLongDescription poiLongDescription;
  case AVAILABLE_SPORTIVE_ACTIVITIES:
    AvailableSportiveActivities availableSportiveActivities;
  case FLOOR_NUMBER:
    FloorNumber floorNumber;
  case NUMBER_OF_ROOMS_EN_SUITE:
    NumberOfRoomsEnSuite numberOfRoomsEnSuite;
  case PLACE_OF_WORSHIP_TYPE:
    PlaceOfWorshipType placeOfWorshipType;
  case SERVICE_FEE:
    ServiceFee serviceFee;
  case CAR_DEALER_TYPE:
    CarDealerType carDealerType;
  case MAJOR_IMPORTANCE:
    MajorImportance majorImportance;
  case AIRPORT_SERVICE_AVAILABILITY:
    AirportServiceAvailability airportServiceAvailability;
  case AIRPORT_MILITARY:
    AirportMilitary airportMilitary;
  case TRANSIT_TYPE:
    TransitType transitType;
  case ACCESS_POINT_DETAILS:
    AccessPointDetails accessPointDetails;
  case PARK_AND_RIDE_FACILITY:
    ParkAndRideFacility parkAndRideFacility;
  case ADBLUE_AVAILABILITY:
    AdBlueAvailability adBlueAvailability;
  case HYDROGEN_PRESSURE_AVAILABILITY:
    HydrogenPressureAvailability hydrogenPressureAvailability;
  case AVAILABILITY_URL:
    AvailabilityUrl url;
  case RELEVANCE_RADIUS:
    RelevanceRadius radius;
  case GLOBAL_SOURCE_ID:
    GlobalSourceId globalSourceId;
  case ISO_DETAILS:
    Iso3166Codes isoCountryCode;
  case FACILITIES:
    Facilities facilities;
  case EV_CHARGE_POINT_OPERATOR:
    EvChargePointOperator evChargePointOperator;
  case EV_SUPPORTED_EMSP:
    EvSupportedEmSp evSupportedEmSp;
  case EV_CHARGING_WHEN_CLOSED:
    EvChargingWhenClosed evChargingWhenClosed;
};
