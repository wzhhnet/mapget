/*!

# Characteristics Attribute Properties

This package defines attribute properties of characteristics attributes.

**Dependencies**

!*/

package characteristics.properties;

import core.properties.*;
import core.types.*;
import characteristics.types.*;

/*!

Depending on the attribute property type, the Characteristics module uses either
attribute property types that are defined in the Core module or attribute
property types that are locally defined in the Characteristics module.

!*/

/** Defines which attribute property type is used. */
struct CharacsPropertyType
{
  /**
    * Type of attribute property. If set to `CORE`, then an attribute
    * property from the Core module is used.
    */
  PropertyType type;

  /** Attribute property type imported from the Core module. */
  CorePropertyType coreType if type == PropertyType.CORE;
};

/**
  * Value of the attribute property. The values are either locally defined
  * or the attribute property uses a globally defined value from the Core module.
  */
struct CharacsPropertyValue(CharacsPropertyType type)
{
  /** Value of the attribute property if locally defined. */
  PropertyValue(type.type) value if type.type != PropertyType.CORE;

  /**
    * Value of the attribute property if globally defined in the Core module.
    */
  CorePropertyValue(type.coreType) coreValue if type.type == PropertyType.CORE;
};

rule_group CharacteristicsPropertyTypeRules
{
  /*!
  Usage of `STATION_STOP_TYPE`:

  The property `STATION_STOP_TYPE` shall only be used with the attribute `STATION`.
  !*/

  rule "characteristics-8wfh8p";

  /*!
  Usage of `STATION_TEMPORARY`:

  The property `STATION_TEMPORARY` shall only be used with the attribute `STATION`.
  !*/

  rule "characteristics-mcfd5f";

  /*!
  Usage of `STATION_TOLL_BOOTHS`:

  The property `STATION_TOLL_BOOTHS` shall only be used with the attribute `STATION`.
  !*/

  rule "characteristics-mf8d5f";

  /*!
  Usage of `STATION_TOLL_TICKET_HANDLING`:

  The property `STATION_TOLL_TICKET_HANDLING` shall only be used with the attribute `STATION`.
  !*/

  rule "characteristics-iofqs5";

  /*!
  Usage of `MOBILE_CARRIER`:

  The property `MOBILE_CARRIER` shall only be used with the attribute
  `MOBILE_NETWORK_COVERAGE`.
  !*/

  rule "characteristics-is3t65";

  /*! Usage of `MOBILE_COMMUNICATION_STANDARDS`:

  The property `MOBILE_COMMUNICATION_STANDARDS` shall only be used with
  the attribute `MOBILE_NETWORK_COVERAGE`.
  !*/

  rule "characteristics-76s5f5";
};

/** Type of attribute property. */
enum varuint16 PropertyType
{
  /** Attribute property types from Core module are used. */
  CORE = 0,

  /**
    * REMOVED. Use attribute property `TOLL_PAYMENT` from the Core module instead.
    */
  @removed TOLL_PAYMENT,

  /**
    * Stop type at a station, for example, whether a vehicle has to slow down or
    * stop.
    */
  STATION_STOP_TYPE,

  /**
    * Station is temporary, for example, movable toll booths or movable checkpoints.
    * Construction characteristics are different from those of fixed stations.
    */
  STATION_TEMPORARY,

  /** Number of toll booths at a toll station. */
  STATION_TOLL_BOOTHS,

  /** Unique identifier of a toll station.*/
  STATION_TOLL_ID,

  /** Detailed information about the toll station. */
  STATION_TOLL_DETAILS,

  /** Detailed information about the lane group confidence. */
  LANE_GROUP_CONFIDENCE_DETAILS,

  /** Detailed information about the ticket handling at a toll station. */
  STATION_TOLL_TICKET_HANDLING,

  /** Information about a mobile network carrier. */
  MOBILE_CARRIER,

  /** Supported mobile communication standards. */
  MOBILE_COMMUNICATION_STANDARDS,
};

choice PropertyValue(PropertyType type) on type
{
  case CORE:
    ;
  case TOLL_PAYMENT:
    TollPayment tollPayment[];
  case STATION_STOP_TYPE:
    StationStopType stationStopType;
  case STATION_TEMPORARY:
    StationTemporary stationTemporary;
  case STATION_TOLL_BOOTHS:
    StationTollBooths stationTollBooths;
  case STATION_TOLL_ID:
    TollStationId stationId;
  case STATION_TOLL_DETAILS:
    TollStationDetails stationDetails;
  case LANE_GROUP_CONFIDENCE_DETAILS:
    LaneGroupConfidenceDetails laneGroupConfidenceDetails;
  case STATION_TOLL_TICKET_HANDLING:
    TollTicketHandling ticketHandling;
  case MOBILE_CARRIER:
    MobileCarrier mobileCarrier;
  case MOBILE_COMMUNICATION_STANDARDS:
    MobileCommunicationStandards mobileCommunicationStandards;
};
