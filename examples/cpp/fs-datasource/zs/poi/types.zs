/*!

# POI Types

This package defines the types that are used by POIs.

**Dependencies**

!*/

package poi.types;

import core.icons.*;
import core.types.*;
import core.vehicle.*;
import core.geometry.*;
import poi.reference.types.*;


/** Short description of a POI. */
subtype string PoiShortDescription;

/** Long description of a POI. */
subtype string PoiLongDescription;

/*!

## POI Relations

POI relations describe the relationship between two POIs.
A POI relation consists of a reference to a target POI and a relationship type.
If the target POI is in the same tile as the source POI, the reference is direct.
If the target POI is not in the same tile as the source POI, the reference is indirect.

A parent POI can have multiple child POIs and a child POI can have
multiple parent POIs.

!*/

rule_group PoiRelationRules
{
  /*!
  Symmetrical Relations:

  Relations between two POIs shall always be symmetrical. For example, if a
  parent POI has an `ACCESS` relation to a child POI, then this child POI
  shall also have an `ACCESS` relation to the parent POI.
  !*/

  rule "poi-rro3wv";

  /*!
  Access Relations and POI Categories:

  If two POIs have a relation of type `ACCESS`, the child POI shall belong to
  the POI category `POICAT_ACCESS_POINT`.
  !*/

  rule "poi-v7c33v";

  /*!
  Activation Relations and POI Categories:

  If two POIs have a relation of type `ACTIVATION`, the child POI shall belong to
  the POI category `POICAT_ACTIVATION_POINT`.
  !*/

  rule "poi-o75v4t";

  /*!
  Logical Access Relations and POI Categories:

  If two POIs have a relation of type `LOGICAL_ACCESS`, the child POI shall
  belong to the POI category `POICAT_LOGICAL_ACCESS_POINT`.
  !*/

  rule "poi-dsgzbx";

  /*!
  Guidance Point Relations and POI Categories:

  If two POIs have a relation of type `GUIDANCE_POINT`, the child POI shall
  belong to the POI category `POICAT_GUIDANCE_POINT`.
  !*/

  rule "poi-pyezu5";
};

/** Relation between two POIs. */
struct PoiRelation
{
  /** Indicates if the related POI is in the same tile as the source POI. */
  bool inSameTile;

  /** Direct reference to a POI in the same tile. */
  PoiReference relatedPoi if inSameTile;

  /** Indirect reference to a POI in a different tile than the source POI. */
  PoiReferenceIndirect extRelatedPoi if !inSameTile;

  /** Type of relation between two POIs. */
  PoiRelationType type;
};

/** Type of relation between POIs. */
enum uint8 PoiRelationType
{
  /**
    * The POI is part of another POI, for example, a terminal POI is part of an airport POI.
    * A child POI is part of its parent POIs.
    * A parent POI consists of its child POIs.
    */
  PART,

  /**
    * The POI is an access point to another POI.
    * A child POI is the access point to its parent POIs.
    * A parent POI is accessed by its child POIs.
    */
  ACCESS,

  /**
    * The POI is an activation point for another POI.
    * A child POI is the activation point for its parent POIs.
    * A parent POI is activated by its child POIs.
    */
  ACTIVATION,

  /**
    * The POI is a logical access point to another POI.
    * A child POI is the logical access point to its parent POIs.
    * A parent POI is logically accessed by its child POIs.
    */
  LOGICAL_ACCESS,

  /**
    * The POI is a guidance point for another POI.
    * A child POI is the guidance point for its parent POIs.
    * Guidance advice for the parent POI is given at the position of
    * its child POIs.
    */
  GUIDANCE_POINT,

  /**
    * The POI is connected to another POI, for example, two terminal POIs at an airport.
    * A child POI is connected to its parent POIs.
    * A parent POI is connected to its child POIs.
    */
  CONNECTED,

  /**
    * The POI is preferred over other related POIs.
    * A child POI is preferred by its parent POIs.
    * A parent POI has one or more preferred child POIs.
    */
  PREFERRED,
};

/*!
### Access Points

POIs that represent a real-world object with a geographic position often can only
be approached via a specific structure such as a gate or a path that has a different
physical location than the POI itself. These locations are called access points.
The application needs to guide a user first to the access point and then to the
POI itself.

Access points are modeled using the following:

- A POI of type `POICAT_ACCESS_POINT`
- Optionally, a POI attribute of type `ACCESS_POINT_TYPE` to
  indicate whether the access point POI is an entry, an exit, or both
- A relation of type `ACCESS` between the access point and its parent POI

POIs can have multiple access points.

!*/

/** Defines the type of an access point to a POI, for example, an entrance. */
enum bit:2 AccessPointType
{
  /** Access point is an entry. */
  ENTRY,

  /** Access point is an exit. */
  EXIT,

  /** Access point is both entry and exit. */
  BOTH,
};

/** Details about an access point. */
struct AccessPointDetails
{
  /** Access point method. */
  AccessPointMethod accessPointMethod;

  /** Access point level. */
  AccessPointLevel accessPointLevel;
};

/** Method that is used to reach an access point. */
enum bit:4 AccessPointMethod
{
  /** Via stairs. */
  STAIRS,

  /** Via escalator. */
  ESCALATOR,

  /** Via elevator. */
  ELEVATOR,
};

/** Level of an access point. */
enum bit:4 AccessPointLevel
{
  /** Above street level. */
  ABOVE_STREET_LEVEL,

  /** Below street level. */
  BELOW_STREET_LEVEL,

  /** At street level. */
  AT_STREET_LEVEL,
};


/*!
### Logical Access Points

POIs that are relevant for a route can be located at a certain distance from
that route, for example, the nearest filling station is a few kilometers away
and can be accessed using a certain motorway exit. For such POIs, logical
access points can be added to the map.

Logical access points support searching for POIs within a corridor stretching
along a route, for example, within a certain distance from a motorway.
Logical access points are usually not displayed in the map.

Logical access points reduce the application's calculation effort for
showing POIs along the route. Without logical access points, the
application has to estimate which POIs are along the route based on
the air distance. This would either be inaccurate, or route calculation
to all potential POIs would be necessary and reduce performance.

Logical access points are modeled using the following:

- A POI of type `POICAT_LOGICAL_ACCESS`
- Optionally, a POI attribute of type `LOGICAL_ACCESS_POINT_TYPE` to indicate
  whether the logical access point provides access to a service or a
  controlled-access exit
- A relation of type `LOGICAL_ACCESS` between the logical access point and its
  parent POI

POIs can have multiple logical access points.

The following figure shows logical access points on a motorway. Logical access
point 1 refers to a filling station and a parking POI on a separate road
while logical access point 2 refers to a restaurant POI in a service area.

![Logical access points on a motorway](assets/poi_logical_access_points.png)

!*/

/** Type of logical access point. */
enum uint8 LogicalAccessPointType
{
  /** Logical access to any non-special service. */
  SERVICE,

  /** Logical access to a controlled-access exit. */
  CONTROLLED_ACCESS_EXIT,

  /** Logical access to a rest area. */
  SERVICE_AREA,

  /** Logical access to a parking facility. */
  PARKING_AREA,

  /** Logical access to a smart interchange. */
  SMART_IC,
};

/**
  * Used to distinguish between normal logical access points and logical access points
  * on motorways, for example, and to avoid problems caused by multiple usage of the IDs.
  */
subtype uint8 RelevanceRadius;

/*!
### Activation Points

The POI activation function enables applications to provide information
about POIs before reaching the actual POI, for example, to play an announcement
before reaching a famous building.

An activation point can contain attributes like a video clip or other media. These
attributes provide information about the activated POI.

Activation points are modeled using the following:

- A POI of type `POICAT_ACTIVATION_POINT`
- A relation of type `ACTIVATION` between the activation point and its
  parent POI

//TODO: Attribute to attach media to activation points not yet available.

### Guidance Points

Guidance points enable applications to give intuitive route guidance such as
"Turn left after the yellow filling station".

Sometimes, the position where this guidance information is triggered differs
from the position of the corresponding POI. For example, the filling station
can be at one side of the road, but the guidance is to be triggered on the
opposite side of the corresponding intersection.
A guidance point is then placed at the position where the guidance
information is to be given to the user.

Guidance points are modeled using the following:

- A POI of type `GUIDANCE_POINT`
- A relation of type `GUIDANCE` between the guidance point and its parent POI

## POI Categories

NDS.Live provides a list of predefined POI categories.

Non-standard POI categories can be defined, but they always have a predefined
POI category as a parent. If none of the predefined POI categories apply, the
category `POICAT_NDSGENERAL` is used.

!*/

rule_group PoiCategoryRules
{
  /*!
  Access Points and POI Relations:

  Each POI of the category `POICAT_ACCESS_POINT` shall also have a relation of
  type `ACCESS` to its parent POI.
  !*/

  rule "poi-uw6yi7";

  /*!
  Activation Points and POI Relations:

  Each POI of the category `POICAT_ACTIVATION_POINT` shall also have a relation of
  type `ACTIVATION` to its parent POI.
  !*/

  rule "poi-h3gme2";

  /*!
  Logical Access Points and POI Relations:

  Each POI of the category `POICAT_LOGICAL_ACCESS_POINT` shall also have a relation of
  type `LOGICAL_ACCESS` to its parent POI.
  !*/

  rule "poi-8e48wi";

  /*!
  Guidance Points and POI Relations:

  Each POI of the category `POICAT_GUIDANCE_POINT` shall also have a relation of
  type `GUIDANCE_POINT` to its parent POI.
  !*/

  rule "poi-kmig6m";
};

/*!

### POI Category Names

POI categories can have multiple names, which are stored in a name string
collection. Each name string in the collection is associated with a specific
language and has a name string relation type and a name string usage type.

__Note:__
Only POI category names are provided by the POI module. POI names are
defined in the Name module. The reason is that POI categories are stored in the
global metadata of a POI service, which does not follow a layered approach. That
way, the POI category names do not have to be delivered separately with each
container, for example, a tile.

!*/

/** Collection of name strings. */
struct NameStringCollection
{
    /** List of name strings. */
    NameString           nameStrings[];
};

/** Definition of a name string. */
struct NameString
{
    /** The actual name. */
    string nameString;

    /** The language of the name string. */
    LanguageCode languageCode;

    /**
      * The type of relation that this name has to another string for this name,
      * which is referenced in `refNameStringIndex`.
      */
    NameStringRelationType nameStringRelationType;

    /** The usage type for this name string. */
    NameStringUsageType nameStringUsageType;

    /** Reference to the name string via the index. */
    varuint32 refNameStringIndex if nameStringRelationType != NameStringRelationType.NO_RELATION;
};

/**
  * A POI category can have different name strings that apply in different
  * contexts. The name string usage type is a hint for the application to select
  * the most appropriate name, for example, for map display or route guidance.
  */
enum uint8 NameStringUsageType
{
  /**
    * If a POI category has multiple official names, this name is defined as the
    * default name.
    */
  DEFAULT_OFFICIAL_NAME,

  /** The name is one of the official names of the POI category. */
  OFFICIAL_NAME,

  /**
    * If a POI category has multiple alternate names, this name is defined as the
    * preferred alternate name.
    *
    * For example, exonyms are preferred over transliterations, that is,
    * "Moscow" (ENG) is preferred over "Moskva" (ENG).
    */
  PREFERRED_ALTERNATE_NAME,

  /**
    * A name that has no official status but is used or known by the
    * general public. A POI category can have multiple alternate names.
    */
  ALTERNATE_NAME,
};

/**
  * Different name strings of a POI category can have a relation to each other. The
  * name string relation type classifies these relations.
 */
enum uint8 NameStringRelationType
{
  /** An alternate name in the official language of the region. */
  SYNONYM,

  /**
    * An alternate name that uses the same language
    * as its original name but is stored in a different script, for example,
    * a Latin transliteration of a Chinese name.
    * This type includes transliterations as well as transcriptions.
    */
  TRANSLITERATION,

  /**
    * A meaningful part of a complete name, for example,
    * the base name string is "Central" and the complete name strings would be
    * "Central station", "Central stadium", etc.
    * Such base name strings support a convenient input path while avoiding
    * unspecific name string parts like "north" or "main".
    */
  BASE_NAME,

  /**
    * The first letters of the complete name string only.
    * Such shortened names are needed for markets like China where long name
    * strings are common, but first letters already give a high probability of
    * matching the correct name string.
    */
  FIRST_LETTER_INPUT,

  /**
    * An official or alternate name that does not belong
    * to any official language of the region.
    *
    * Exonyms are stored with a language code that is not an official language
    * of the region and they have one of the following name string usage types:
    * `OFFICIAL_NAME`, `ALTERNATE_NAME`, or `PREFERRED_ALTERNATE_NAME`.
    */
  EXONYM,

  /**
    * An alternate spelling of an official or alternate name.
    *
    * In some languages, one or more characters can be replaced by other
    * characters, for example, German umlauts or diacritics that are replaced by
    * their base characters.
    * Examples: "Muenchen" instead of "München" or "Sacre-Coeur" instead of "Sacré-Cœur".
    */
  ALTERNATE_SPELLING,

  /** The name string has no relation to another name string. */
  NO_RELATION,

  /**
    * The short form of a name. This can be an abbreviation or an acronym, for example.
    * Example: "JFK" for "John F. Kennedy Airport".
    */
  ABBREVIATION,
};



/*!

## POI Icons

POIs can be represented as an icon on the map. Similar icons are grouped into
icon sets that are stored in the icon layer. The POI layers refer to these icon
sets rather than specific icon images.

!*/

/** Reference to an icon set for POIs. */
subtype IconSetReference PoiIconSetReference;

/**
  * Reference to a globally stored icon set for POI categories. The icon is
  * provided by a global smart layer object service.
  */
subtype IconSetReference CategoryIconSetReference;

/** Reference to an icon set for POI brands. */
subtype IconSetReference BrandIconSetReference;

/** Reference to an icon set for POI attributes. */
subtype IconSetReference PoiAttributeIconSetReference;

/*!

## Price and Payment Details

Details about prices and payment methods can be provided for POIs.

!*/

/**
  * Accepted payment methods, for example, credit cards, debit cards, or
  * mobile payment providers.
  */
struct AcceptedPaymentMethods
{
  /** Number of payment methods. */
  uint8 numMethods;

  /** List of payment methods. */
  PaymentMethod methods[numMethods];
};

/** Details of an accepted payment method. */
struct PaymentMethod
{
  /** Name of the payment method. */
  string name;

  /** Reference to an icon set for the payment method. */
  optional IconSetReference iconSetReference;
};

/** Monetary amount that is charged for a service. */
subtype MonetaryAmount ServiceFee;

/** Price range of the services and goods offered at a POI. */
enum bit:4 PriceRange
{
  /** Moderate. */
  MODERATE,
  /** Regular. */
  REGULAR,
  /** Expensive. */
  EXPENSIVE,
};


/*!

## Transport

POIs for facilities such as airports or train stations can provide additional details,
for example, about the type of services they offer.

!*/

/** Airport entrance type. */
enum bit:4 AirportEntranceType
{
  /** Main entrance of the airport. */
  MAIN,

  /** Entrance to a terminal of the airport. */
  TERMINAL,

  /** Both the main entrance and the entrance to a terminal of the airport. */
  BOTH
};


/** Aviation and flight services available at the airport. */
bitmask varuint32 AirportServiceAvailability
{
  /** Commercial aviation. */
  COMMERCIAL,

  /** General aviation. */
  GENERAL_AVIATION,

  /** Domestic flights. */
  DOMESTIC_FLIGHTS,

  /** International flights. */
  INTERNATIONAL_FLIGHTS
};

/** Traffic services for departures and arrivals. */
enum bit:4 DepartureArrivalService
{
  /** Traffic service for departures. */
  DEPARTURE,

  /** Traffic service for arrivals. */
  ARRIVAL
};

/** Public transit type. */
enum bit:4 TransitType
{
  /** Public transit via bus. */
  BUS,

  /** Public transit via rail. */
  RAIL,

  /** Both rail and bus transit are available. */
  BOTH,
};

/*!

## Vehicle Services

POIs that provide services for vehicles, such as gas stations, charging
stations, or garages can provide additional details about the services they
offer.

!*/

/** Defines if and how AdBlue fuel is available. */
bitmask uint8 AdBlueAvailability
{
  /** AdBlue is available via cans.*/
  VIA_CAN,

  /** AdBlue is available via pumps.*/
  VIA_PUMP,
};

/**
  * Fuel cell electric vehicles are designed to accept hydrogen at different
  * pressures.
  */
enum bit:4 HydrogenPressureAvailability
{
  /** Hydrogen is provided with a pressure of 35 MPa, that is, 350 bar or 5000 psi. */
  H35,

  /** Hydrogen is provided with a pressure of 700 MPa, that is, 700 bar or 10000 psi. */
  H70,

  /** Hydrogen is provided with both pressures. */
  BOTH
};

/** Service offered by a car dealer. */
enum bit:4 CarDealerType
{
  /** Car dealer sells cars. */
  SALES_FACILITY,

  /** Car dealer repairs cars. */
  REPAIR_FACILITY,

  /** Car dealer sells and repairs cars. */
  BOTH,
};


/*!
### Electric Vehicle Charging Stations

An electric vehicle charging station (EV charging station or ECS), also called
electric recharging point or charging point, is a facility for charging electric
vehicles that consists of a number of terminals.

A terminal is a physical unit that delivers power to electric vehicles using
chargers. Each terminal can have multiple chargers that have the same type or
different types.

A charger, also called Electric Vehicle Supply Equipment (EVSE), is an
independently operated and managed part of an EV charging station that can
deliver energy to one electric vehicle at a time. A charger can have
multiple connectors of the same or different connector types, but only one
vehicle can be charged at any given time, that is, only one connector in a
charger can be active at the same time. Depending on the connector type,
different levels of power can be provided.

The following image shows the different components of an EV charging station.
The terminals have different configurations: Terminals 1 and 4 have one charger
with one connector each, but with different connector types. Terminal 2 has one
charger with two different connectors that cannot be operated at the same time.
Terminal 3 has two chargers with different connector types, which can be
operated at the same time.

![Components of an EV charging station](assets/ev_charging_station_components.png)

The EV charging station details model the available chargers based on the
connector types because this is the most important information for a vehicle. In
the details for a terminal, the connectors are mapped to the corresponding
chargers.

The availability information for an EV charging station provides details about
the number of chargers of each connector type that are available, occupied,
reserved, or out of service.

!*/

/** EV charging station details. */
struct EvChargingStationDetails
{
  /** Identifier of the EV charging station. */
  EvChargingStationId id;

  /**
    * Total power provided through all connectors.
    * The total power can be less than the sum of the maximum power values of
    * all connectors.
    */
  Watt totalPower;

  /**
    * Number of different connector configurations at the EV charging station,
    * each identified by an index value.
    */
  EvConnectorIdx numConnectorConfigurations;

  /** List of connectors at the EV charging station. */
  EvConnectorConfiguration evConnectorConfigurations[numConnectorConfigurations];

  /** Number of terminals at the EV charging station. */
  varsize numTerminals;

  /** List of terminals at the EV charging station. */
  EvTerminal evTerminals[numTerminals];
};

/** Index of an EV connector configuration. */
subtype varsize EvConnectorIdx;

/** Configuration of a connector at an EV charging station. */
struct EvConnectorConfiguration
{
  /** Connector standard type. */
  EvConnectorType type;

  /** Electric current provided through the connector. */
  ElectricCurrent current;

  /**
    * Set to `true` if the connector provides three-phase AC or set to `false`
    * if it provides single-phase AC.
    */
  bool threePhase if current == ElectricCurrent.AC;

  /**
    * Set to `true` if the connector has a cable, set to to `false` if only a
    * socket is available.
    */
  bool hasCable;

  /** Maximum power in Watt that is delivered through the connector. */
  Watt maxPower;

  /** Maximum voltage of the connector. */
  optional Voltage voltage;

  /** Maximum amperage of the connector. */
  optional Ampere amperage;

  /** EV communication standard used by the connector. */
  optional EvCommunicationStandard commStandard;
};

/** A terminal at an EV charging station with one or more chargers (EVSEs). */
struct EvTerminal
{
  /** Numbers of chargers at the terminal. */
  varsize numChargers;

  /** List of chargers at the terminal. */
  EvCharger chargers[numChargers];

  /** Exact geographic position of the terminal without coordinate shift. */
  optional Position2D(0) position;

  /** Floor number of the terminal in case it is located in a building. */
  optional FloorNumber floorNumber;

  /** Additional capabilities of the terminal. */
  optional EvTerminalCapabilities capabilities;
};

/** Additional capabilities of a terminal at an EV charging station. */
bitmask varuint64 EvTerminalCapabilities
{
  /** Supports chip card payments. */
  CHIP_CARD_SUPPORT,

  /** Supports contactless card payments. */
  CONTACTLESS_CARD_SUPPORT,

  /** Supports credit card payments. */
  CREDIT_CARD_PAYABLE,

  /** Supports debit card payments. */
  DEBIT_CARD_PAYABLE,

  /** Can be started and stopped remotely. */
  REMOTE_START_STOP,

  /** Supports RFID reader. */
  RFID_READER_SUPPORT,

  /** Can be reserved. */
  RESERVABLE,

  /** Mechanical locks of connectors can be unlocked remotely. */
  UNLOCK_CAPABILITY,
};

/** Charger at an EV charging station. */
struct EvCharger
{
  /**
    * Set to `true` if only the charger has an EVSE ID,
    * set to `false` if each connector has a separate EVSE ID.
    */
  bool evseIdPerCharger;

  /** EVSE ID of the charger. */
  EvseId chargerId if evseIdPerCharger;

  /** Number of connectors at the charger. */
  uint8 numConnectors;

  /**
    * List of connectors in the charger referenced by the index of connectors.
    * The index refers to entries in
    * `EvChargingStationDetails.evConnectorConfigurations`.
    */
  EvConnectorIdx connectors[numConnectors];

  /** IDs of the connectors at the charger. */
  EvseId connectorId[numConnectors] if !evseIdPerCharger;
};

/** Availability information for chargers or connectors at an EV charging station. */
struct EvChargingAvailability
{
  /** Number of different chargers or connectors identified via their EVSE IDs. */
  varsize numChargers;

  /** EVSE IDs of the chargers or connectors for which availability information is provided. */
  EvseId chargerId[numChargers];

  /** Status of the chargers or connectors. */
  EvChargingStatus status[numChargers];
};

/**
  * Status of a charger at an EV charging station.
  * Includes live status as well as long-term status.
  */
enum uint8 EvChargingStatus
{
  /** Charger is available. */
  AVAILABLE,

  /** Charger is occupied. */
  OCCUPIED,

  /** Charger is reserved. */
  RESERVED,

  /** Charger is out of service. */
  OUT_OF_SERVICE,

  /** Charger is plugged in but not charging (yet) or paused. */
  PLUGGED_IN,

  /** Charger is actively charging. */
  CHARGING,

  /** Charging has been suspended by the vehicle. */
  SUSPENDED_EV,

  /** Charging has been suspended by the charger. */
  SUSPENDED_EVSE,

  /** Charger is finishing the charging process. */
  FINISHING,

  /** Charger has been removed. */
  REMOVED,

  /** Charger is to be installed but not yet operational. */
  PLANNED,

  /** Charger is physically blocked, for example, by a barrier or similar. */
  BLOCKED,
};

/** Communication standard of a connector at an EV charging station. */
enum uint8 EvCommunicationStandard
{
  /** GB/T27930-2011. */
  GB_27930_11,

  /** GB/T27930-2015. */
  GB_27930_15,

  /** GB/T18487.1. */
  GB_18487_1,

  /** GB/T18487.1-2011. */
  GB_18487_1_11,

  /** GB/T18487.1-2015. */
  GB_18487_1_15,
};

/** Type of connector at an EV charging station. */
enum varuint16 EvConnectorType
{
  /** VDE-AR-E 2623-2-2. */
  VDE_AR_E_2623_2_2,

  /** SAE J1772. */
  SAE_J1772,

  /** Small Paddle Inductive. */
  SMALL_PADDLE_INDUCTIVE,

  /** Large Paddle Inductive. */
  LARGE_PADDLE_INDUCTIVE,

  /** AVCON. */
  AVCON,

  /** Tesla. */
  TESLA,

  /** NEMA 5-20. */
  NEMA_5_20,

  /** TEPCO. */
  TEPCO,

  /** Standard household plug (country-specific). */
  HOUSEHOLD,

  /** 60309 – 1-phase Industrial. */
  SINGLE_PHASE_60309,

  /** IEC 62196-2 Type 2 outlet, also called Mennekes. */
  IEC62196_2_T2O,

  /** IEC 62196-2 Type 3 outlet 16 A, 1-phase (Scame Libera). */
  IEC62196_2_T3O_16A,

  /** IEC 62196-2 Type 3 outlet 32 A, 1-phase. */
  IEC62196_2_T3O_32A,

  /** IEC 62196-2 Type 3 outlet 32 A, 3-phase (Scame). */
  IEC62196_2_T3O_32A_3PHASE,

  /** IEC 62196-2 Type 1 connector. */
  IEC62196_2_T1C,

  /** IEC 62196-2 Type 2 connector mode 1-3. */
  IEC62196_2_T2C_M13,

  /** IEC 62196-2 Type 2 connector mode 2-3. */
  IEC62196_2_T2C_M23,

  /** IEC 62196-2 Type 3 connector - 16 A, 1-phase (Scame Libera). */
  IEC62196_2_T3C_16A,

  /** IEC 62196-2 Type 3 connector - 32 A, 1-phase. */
  IEC62196_2_T3C_32A,

  /** IEC 62196-2 Type 3 connector - 32 A, 3-phase (Scame). */
  IEC62196_2_T3C_32A_3PHASE,

  /** CCS Combo 1 base. */
  COMBO_T1,

  /** CCS Combo 2 base. */
  COMBO_T2,

  /** China GB part 2. */
  GB_P2,

  /** China GB part 3. */
  GB_P3,

  /** Better Place socket. */
  BETTER_PLACE,

  /** Marechal socket. */
  MARECHAL,

  /** IEC 309-2 DC plug. */
  IEC309_2,

  /** GBT 20234 charging mode 1-3, 1-phase. */
  GBT20234_M13_1P,

  /** GBT 20234 charging mode 1-3, 3-phase. */
  GBT20234_M13_3P,

  /** GBT 20234.2 (charging mode 3, 7-pin). */
  GBT20234_M3_7P,

  /** GBT 20234.3 (charging mode 4, 9-pin). */
  GBT20234_M4_9P,

  /** DC CHAdeMO. */
  DC_CHADEMO,

  /** DC Combo. */
  DC_COMBO,

  /** AC 3-phase. */
  AC_3PHASE,

  /** AC slow. */
  AC_SLOW,

  /** Domestic plug/socket type B (NEMA 5-15). */
  DOMESTIC_B_5_15,

  /** Domestic plug/socket type B (NEMA 5-20). */
  DOMESTIC_B_5_20,

  /** Domestic plug/socket type D (BS 546, 3-pin). */
  DOMESTIC_D,

  /** Domestic plug/socket type E (CEE 7/5). */
  DOMESTIC_E,

  /** Domestic plug/socket type F (CEE 7/4 (Schuko)). */
  DOMESTIC_F,

  /** Domestic plug/socket type E+F (CEE 7/7). */
  DOMESTIC_EF,

  /** Domestic plug/socket type G (BS 1363, IS 401 & 411, MS 58). */
  DOMESTIC_G,

  /** Domestic plug/socket type H (SI 32). */
  DOMESTIC_H,

  /** Domestic plug/socket type I (AS/NZS 3112). */
  DOMESTIC_I_ASNZ,

  /** Domestic plug/socket type I (CPCS-CCC). */
  DOMESTIC_I_CPCS,

  /** Domestic plug/socket type I (IRAM 2073). */
  DOMESTIC_I_IRAM,

  /** Domestic plug/socket type J (SEV 1011) (T13, T23). */
  DOMESTIC_J_TX3,

  /** Domestic plug/socket type J (SEV 1011) (T15). */
  DOMESTIC_J_T15,

  /** Domestic plug/socket type K (Section 107-2-D1). */
  DOMESTIC_K,

  /** Domestic plug/socket type K (Thailand TIS 166 - 2549). */
  DOMESTIC_K_TH,

  /** Domestic plug/socket type L (CEI 23-16/VII). */
  DOMESTIC_L,

  /** Domestic plug/socket type M (South African 15 A/250 V). */
  DOMESTIC_M,

  /** Domestic plug/socket type IEC 60906-1 (3 pin). */
  DOMESTIC_IEC,

  /** Tesla High Power Wall Connector (HPWC). */
  TESLA_HIGH,

  /** Tesla Universal Mobile Connector. */
  TESLA_UNI,

  /** Tesla Spare Mobile Connector. */
  TESLA_SPARE,

  /** IEC 61851-1. */
  IEC61851_1,

  /** IEC 60309: industrial P + N + E (AC). */
  IEC60309_PNE,

  /** IEC 60309: industrial P + N + E (AC) (CEEPlus). */
  IEC60309_PNE_CEEPLUS,

  /** IEC 60309: industrial 2P + E (DC). */
  IEC60309_2PE,

  /** IEC 60309: industrial 3P + E + N (AC). */
  IEC60309_3PEN,

  /** IEC 60309: industrial 3P + N + E (AC) (CEEPlus). */
  IEC60309_3PNE,

  /** I-type AS/NZ 3112 (Australian 15 A/240 V), deprecated. */
  IEC60309_ASNZ,

  /** Unspecified connector type. */
  UNSPECIFIED,
};

/**
  * Identifier of an EV charging station.
  * Provided by the CPO (Charge Point Operator).
  */
subtype string EvChargingStationId;

/**
  * Identifier of a charger or connector at an EV charging station.
  * Provided by the CPO (Charge Point Operator).
  */
struct EvseId
{
  /** Format of the EVSE ID. */
  EvseIdFormat format;

  /** EVSE ID according to the format defined above. */
  string evseId;
};

/** Format of the EVSE ID. */
enum uint8 EvseIdFormat
{
  /** ISO 15118 format. Example: "FR*EDF*123456*1" */
  ISO_15118,

  /** GB/T 27930 format. Example: "1101000001230001" */
  GB_T_27930,

  /** CHAdeMO format. Example: "CHAD1234567890ABCD" */
  CHADEMO,

  /** Custom format. */
  CUSTOM,
};

/** Charge point operator (CPO) of the EV charging station. */
subtype string EvChargePointOperator;

/** List of supported Electric Mobility Service Providers (EMSPs). */
struct EvSupportedEmSp
{
  /** List of supported EMSPs. */
  string emsp[];
};


/** Vehicles can be charged when the POI is closed. */
subtype Flag EvChargingWhenClosed;

/*!

## Gastronomy and Accommodation

POIs for facilities such as rest areas, hotels, or restaurants can provide
information on the services they offer, for example, the type of available
rooms or diets.

!*/

/** Services available at a rest area. */
bitmask varuint32 RestAreaServiceAvailability
{
  /** DEPRECATED. Use `Facilities.PUBLIC_RESTROOM` instead. */
  REST_ROOM,

  /** DEPRECTAED. Use `Facilities.PARKING` instead. */
  PARKING,

  /** DEPRECATED. Use `Facilities.REPAIR_FACILITY` instead. */
  MOTORWAY_SERVICE,

  /** Other services available. */
  OTHER_SERVICE,
};

/** Facilities available at a POI.*/
bitmask varuint64 Facilities
{
  /** ATM. */
  ATM,

  /** Camping area. */
  CAMPING_AREA,

  /* Caravan park. */
  CARAVAN_PARK,

  /** Car wash. */
  CAR_WASH,

  /** Chemical toilet disposal. */
  CHEMICAL_TOILET_DISPOSAL,

  /** Drinking water. */
  DRINKING_WATER,

  /** Dump station. */
  DUMP_STATION,

  /** Emergency phone. */
  EMERGENCY_PHONE,

  /** EV charging station. */
  EV_CHARGING_STATION,

  /** Outdoor fire pit. */
  FIRE_PIT,

  /** First aid. */
  FIRST_AID,

  /** Hazardous materials allowed. */
  HAZMAT_ALLOWED,

  /** Hotel or motel. */
  HOTEL_OR_MOTEL,

  /** Kiosk. */
  KIOSK,

  /** Laundry. */
  LAUNDRY,

  /** Parking. */
  PARKING,

  /** Petrol station. */
  PETROL_STATION,

  /** Picnic area. */
  PICNIC_AREA,

  /** Place of worship. */
  PLACE_OF_WORSHIP,

  /** Playground. */
  PLAYGROUND,

  /** Public phone. */
  PUBLIC_PHONE,

  /** Refreshments. */
  REFRESHMENTS,

  /** Power supply for refrigerated vehicles. */
  REFRIGERATED_VEHICLE_POWER_SUPPLY,

  /** Repair facility. */
  REPAIR_FACILITY,

  /** Reservable truck stop. */
  RESERVABLE_TRUCK_STOP,

  /** Restaurant. */
  RESTAURANT,

  /** Secured truck stop. */
  SECURED_TRUCK_STOP,

  /** Showers. */
  SHOWERS,

  /** Truck wash. */
  TRUCK_WASH,

  /** Public restroom/toilet. */
  PUBLIC_RESTROOM,

  /** Wheelchair access. */
  WHEELCHAIR_ACCESS,

  /** Accessible restroom/toilet. */
  ACCESSIBLE_PUBLIC_RESTROOM,

  /** Waste disposal. */
  WASTE_DISPOSAL,

  /** WiFi. */
  WIFI,
};

/** Sportive activities available at a POI. */
struct AvailableSportiveActivities
{
  /** Number of sportive activities. */
  uint8 numSports;

  // TODO: Define an enum covering the most prominent activities!?

  /** List of sportive activities. */
  string sports[numSports];
};

/**
  * Floor number of the POI in a building.
  * The definition of the ground floor is country-specific.
  * For example, in the US, the ground floor is floor 1, while in Europe, the
  * ground floor is floor 0.
  * Negative values are used for floors below the ground level.
  */
subtype varint16 FloorNumber;

/** Number of rooms with en-suite facilities, for example, in hotels. */
subtype varuint16 NumberOfRoomsEnSuite;

/** Type of food that is mainly offered at a POI. */
struct FoodType
{
  /** Cuisine that is mainly served. */
  Cuisine cuisine;

  /** Custom cuisine. */
  string customCuisine if cuisine == Cuisine.CUSTOM;

  /** Set to `true` if dietary information is available. */
  bool hasDietAvailability;

  /** Type of dietary food that is available at a POI. */
  DietAvailability dietAvailability;
};

/** Dietary food that is available at a POI. */
bitmask varuint32 DietAvailability
{
  /** Pescetarian diet. Allows fish, but no other meat. */
  PESCETARIAN,

  /** Ovo-lacto vegetarian diet. No fish or meat. */
  VEGETARIAN,

  /** Lacto vegetarian diet. No fish, meat, or eggs. */
  LACTO_VEGETARIAN,

  /** Ovo vegetarian diet. No fish, meat, or dairy. */
  OVO_VEGETARIAN,

  /** Vegan diet. No fish, meat, dairy, eggs, or any other animal products. */
  VEGAN,

  /** Fruitarian diet. Only fruit, nuts, and seeds. */
  FRUITARIAN,

  /** Raw diet. Uncooked and unprocessed food only. */
  RAW,

  /** Gluten-free diet. */
  GLUTEN_FREE,

  /** Dairy-free diet. No milk or other dairy products. */
  DAIRY_FREE,

  /** Lactose-free diet. */
  LACTOSE_FREE,

  /** Diabetes diet. */
  DIABETES,

  /** Halal diet. Suitable for consumption by Muslims. */
  HALAL,

  /** Kosher diet. Suitable for the strict dietary standards of traditional Jewish law. */
  KOSHER
};

/** Type of cuisine. */
enum uint8 Cuisine
{
  /** Other type of cuisine that is not further specified. */
  OTHER,

  /** Custom type of cuisine that is not covered by this enum.*/
  CUSTOM,

  /** Afghan food. */
  AFGHAN,

  /** African food. */
  AFRICAN,

  /** American food. */
  AMERICAN,

  /** Arabic food. */
  ARAB,

  /** Argentinian food. */
  ARGENTINIAN,

  /** Asian food. */
  ASIAN,

  /** Australian food. */
  AUSTRALIAN,

  /** Baiana food. */
  BAIANA,

  /** Balkan food. */
  BALKAN,

  /** Basque food. */
  BASQUE,

  /** Belarusian food. */
  BELARUSIAN,

  /** Balkan food. */
  BOLIVIAN,

  /** Brazilian food. */
  BRAZILIAN,

  /** Cantonese food. */
  CANTONESE,

  /** Caribbean food. */
  CARIBBEAN,

  /** Chinese food. */
  CHINESE,

  /** Croatian food. */
  CROATIAN,

  /** Czech food. */
  CZECH,

  /** Danish food. */
  DANISH,

  /** Filipino food. */
  FILIPINO,

  /** Balkan food. */
  FRENCH,

  /** French food. */
  GAUCHO,

  /** Georgian food. */
  GEORGIAN,

  /** German food. */
  GERMAN,

  /** Greek food. */
  GREEK,

  /** Hawaiian food. */
  HAWAIIAN,

  /** Hungarian food. */
  HUNGARIAN,

  /** Indian food. */
  INDIAN,

  /** Indonesian food. */
  INDONESIAN,

  /** International food. */
  INTERNATIONAL,

  /** Iranian food. */
  IRANIAN,

  /** Italian food. */
  ITALIAN,

  /** Japanese food. */
  JAPANESE,

  /** Jewish food. */
  JEWISH,

  /** Korean food. */
  KOREAN,

  /** Latin-American food. */
  LATIN_AMERICAN,

  /** Lebanese food. */
  LEBANESE,

  /** Malaysian food. */
  MALAYSIAN,

  /** Malagasy food. */
  MALAGASY,

  /** Mediterranean food. */
  MEDITERRANEAN,

  /** Mexican food. */
  MEXICAN,

  /** Pakistani food. */
  PAKISTANI,

  /** Peruvian food. */
  PERUVIAN,

  /** Polish food. */
  POLISH,

  /** Portuguese food. */
  PORTUGUESE,

  /** Balkan food. */
  REGIONAL,

  /** Russian food. */
  RUSSIAN,

  /** Scottish food. */
  SCOTTISH,

  /** Spanish food. */
  SPANISH,

  /** Thai food. */
  THAI,

  /** Turkish food. */
  TURKISH,

  /** Vietnamese food. */
  VIETNAMESE,

  /** Western food. */
  WESTERN,
};


/*!

## Other Types

!*/


/**
  * Quality rating of a service or facility based on a star scale.
  * Often used for hotels or restaurants.
  */
enum bit:3 StarRating
{
  /** 1-star rating. */
  RATING_1_STAR,

  /** 2-star rating. */
  RATING_2_STAR,

  /** 3-star rating. */
  RATING_3_STAR,

  /** 4-star rating. */
  RATING_4_STAR,

  /** 5-star rating. */
  RATING_5_STAR,

  /** 6-star rating. */
  RATING_6_STAR,

  /** 7-star rating. */
  RATING_7_STAR,
};



/** Classifies the size of a parking facility. */
enum bit:4 ParkingFacilitiesSizeClass
{
  /** Parking facility has no parking spots. */
  NONE,

  /** Parking facility has parking spots, but the number is unknown. */
  UNKNOWN,

  /** Parking facility has between 1 and 50 parking spots. */
  FROM_1_TO_50,

  /** Parking facility has between 50 and 100 parking spots. */
  FROM_51_TO_100,

  /** Parking facility has between 100 and 200 parking spots. */
  FROM_101_TO_250,

  /** Parking facility has between 250 and 500 parking spots. */
  FROM_251_TO_500,

  /** Parking facility has more than 500 parking spots. */
  MORE_THAN_500
};

/** Number of parking spots in a parking facility. */
subtype varuint16 ParkingFacilitiesSize;

/** Number of free parking spots in a parking facility. */
subtype varuint16 NumFreeParkingSpots;



/** Available accessibility aids. */
bitmask varuint32 AccessibilityAids
{
  /** Aids for disabled persons. */
  AIDS_FOR_DISABLED,

 /** Aids for wheelchair users. */
 AIDS_FOR_WHEELCHAIR,

 /** Aids for the hearing impaired. */
 AIDS_FOR_HEARING,

 /** Aids for the visually impaired. */
 AIDS_FOR_VISION,

 /** Aids for persons with mobility impairments. */
 AIDS_FOR_WALK,

 /** Aids for non-swimmers. */
 AIDS_FOR_NON_SWIMMER,
};

/** Type of place of worship. */
enum uint8 PlaceOfWorshipType
{
  /** Other place of worship or type is unknown. */
  OTHER,

  /** Synagogue. */
  SYNAGOGUE,

  /** Church. */
  CHURCH,

  /** Mosque. */
  MOSQUE,

  /** Temple. */
  TEMPLE,

  /** Monastery. */
  MONASTERY,
};

/**
  * URL for checking the availability of a service.
  * Reference to a web service that provides availability information,
  * for example, "http://www.isavailable.info".
  */
subtype string AvailabilityUrl;

/**
  * Reference to a multimedia resource, for example,
  * `mimeType = video/mpeg`, `URI=https://www.nds-videoserver.tv/intro.mp4`.
  */
struct MultimediaResourceReference
{
  /** MIME type of the resource. */
  string mimeType;

  /** URI of the resource. */
  string uri;
};

/** POI is open 24 hours a day. */
subtype Flag Open24Hrs;

/** Electric vehicle charging is free of charge. */
subtype Flag EvFreeCharging;

/** Parking is free during electric vehicle charging. */
subtype Flag EvFreeParking;

/**
* Service associated with the POI has opening hours.
* Use conditions to model the actual opening times.
*/
subtype Flag OpeningHrs;

/**
* POI has been associated either with a road that represents the POI's true
* location or with a road nearby. The attribute suggests what kind of guidance
* information to provide for a user.
* If `IN_VICINITY` does not apply to the POI, the application can
* state that the user has arrived.
* If `IN_VICINITY` applies to the POI, the application can state that the POI is
* nearby but that further routing advice is not available.
*/
subtype Flag InVicinity;

/** POI has private access. */
subtype Flag PrivateAccess;

/**
* Service associated with the POI is of national importance.
* Without this flag, local importance is assumed.
*/
subtype Flag NationalImportance;

/** Available restaurant facilities. */
subtype Flag RestaurantFacilitiesAvailable;

/**
* POI is of major importance.
* Can be used, for example, for post offices, airports, railway stations,
* or access points.
*/
subtype Flag MajorImportance;

/** Airport is structurally used for military activities. */
subtype Flag AirportMilitary;

/** Parking is provided with a park and ride facility. */
subtype Flag ParkAndRideFacility;
