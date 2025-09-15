/*!

# Core Attribute Properties

Attribute properties annotate attributes with supplementary information,
for example, metadata like the attribute's age or language code. Properties
are represented as a type and a value.

An attribute module uses properties that are imported from the Core module or
properties that are locally defined within the module, or both.

This package defines the attribute properties that are provided by the Core
module.

Some attribute properties are restricted to specific types of attributes.
This is defined in the corresponding attribute module.

For more information on using attributes with properties including examples, see
[Using NDS.Live > Concepts and Use Cases > Attributes and
Conditions](https://developer.nds.live/using-nds.live/concepts-and-use-cases/attributes-and-conditions).

!*/

package core.properties;

import core.types.*;
import core.geometry.*;
import core.icons.*;

rule_group CorePropertyTypeRules
{
  /*!
  Value Range of Icon Set IDs in Local Icon Set References:

  The value of `IconSetReference` in the attribute properties
  `ICON_SET_REFERENCE` and `ICON_SET_REFERENCE_WITH_HEADING` shall be in the
  range from 0 to 65535 (included).
  !*/

  rule "core-0ee8ja";

  /*!
  Value Range of Icon Set IDs in Global Icon Set References:

  The value of `IconSetReference` in the attribute properties
  `GLOBAL_ICON_SET_REFERENCE and `GLOBAL_ICON_SET_REFERENCE_WITH_HEADING` shall
  be greater than 65535.
  !*/

  rule "core-0ee9ja";

};

/** Core property type, defines attribute properties. */
enum varuint16 CorePropertyType
{
  /** Reason why an attribute is there. */
  ATTRIBUTE_REASON,

  /**
    * REMOVED.
    */
  @removed METRIC_UNIT,

  /**
    * REMOVED.
    */
  @removed IMPERIAL_UNIT,

  /**
    * The confidence in the trustworthiness of an attribute expressed in
    * percent (0-100 %).
    */
  ATTRIBUTE_CONFIDENCE,

  /**
    * Indicates at what point in time the attribute value has been collected
    * or processed.
    */
  ATTRIBUTE_AGE,

  /** Information about the source of an attribute. */
  ATTRIBUTE_SOURCE,

  /**
    * Reference to an icon set for attributes. For example, an icon can be
    * displayed on the position of an attribute.
    */
  ICON_SET_REFERENCE,

  /**
    * Reference to an icon set with a heading that needs to be applied.
    * For example, an icon set reference with heading can be used for one-way
    * signs in micro city maps. Can also be used to show special icons depicting
    * certain destination input named objects like countries, regions, or cities.
    */
  ICON_SET_REFERENCE_WITH_HEADING,

  /**
    * Global reference to an icon set for attributes. For example, an icon can
    * be displayed on the position of an attribute.
    *
    * When using the global icon set reference instead of `ICON_SET_REFERENCE`,
    * the icon set is stored in a different smart layer container than the
    * attribute itself.
    */
  GLOBAL_ICON_SET_REFERENCE,

  /**
    * Global reference to an icon set with a heading that needs to be applied.
    * For example, an icon set reference with heading can be used for one-way
    * signs in micro city maps. Can also be used to show special icons depicting
    * certain destination input named objects like countries, regions, or cities.
    *
    * When using the global icon set reference instead of
    * `ICON_SET_REFERENCE_WITH_HEADING`, the icon set is stored in a
    * different smart layer container than the attribute itself.
    */
  GLOBAL_ICON_SET_REFERENCE_WITH_HEADING,

  /**
    * List of payment types and payment providers accepted at toll stations or
    * on toll roads.
    */
  TOLL_PAYMENT,

  /**
    * Indicates that the attribute of a feature is disputed by an entity with
    * a certain political view. Can be used in the rare case of disputed names
    * or other disputed attributes when the overall approach to use a different
    * geopolitical view service is not feasible.
    */
  DISPUTED_ENTITY,
};

choice CorePropertyValue(CorePropertyType type) on type
{
  case ATTRIBUTE_REASON:
          AttributeReason reason;
  case METRIC_UNIT:
          ;
  case IMPERIAL_UNIT:
          ;
  case ATTRIBUTE_CONFIDENCE:
          AttributeConfidence confidence : confidence <= 100;
  case ATTRIBUTE_AGE:
          AttributeAge age;
  case ATTRIBUTE_SOURCE:
          AttributeSourceType source;
  case ICON_SET_REFERENCE:
          IconSetReference iconSetReference;
  case ICON_SET_REFERENCE_WITH_HEADING:
          IconSetReferenceWithHeading iconSetReferenceWithHeading;
  case GLOBAL_ICON_SET_REFERENCE:
          IconSetReference globalIconSetReference;
  case GLOBAL_ICON_SET_REFERENCE_WITH_HEADING:
          IconSetReferenceWithHeading globalIconSetReferenceWithHeading;
  case TOLL_PAYMENT:
          TollPaymentMethod tollPaymentMethod[];
  case DISPUTED_ENTITY:
          DisputedEntity disputedEntity;
};

/**
  * Attribute reason.
  * Describes the reason why a certain attribute exists.
  * For example, a reason can be given for the existence of a speed limit and hold
  * the information that the speed limit is derived from a posted sign.
  * In addition, an optional position of the sign can be provided.
  */
struct AttributeReason
{
  /** Type of reason why the attribute exists. */
  AttributeReasonType type;

  /**
    * Indicates if the attribute reason includes the position of an object from
    * which the attribute was derived.
    */
  AttributeReasonPositionAvailability hasPosition;

  /** Optional 2D position of the object that is given as reason. Example: sign. */
  Position2D(0) position2D if hasPosition == AttributeReasonPositionAvailability.POSITION_2D;

  /** Optional 3D position of the object that is given as reason. Example: sign. */
  Position3D(0,0) position3D if hasPosition == AttributeReasonPositionAvailability.POSITION_3D;
};

/**
  * Describes whether a 2D or 3D position is available or if there is no
  * position available at all for the attribute reason.
  */
enum bit:2 AttributeReasonPositionAvailability
{
  NONE,
  POSITION_2D,
  POSITION_3D,
};

/** Type of attribute source. */
enum bit:4 AttributeSourceType
{
  /** Attribute is based on data captured by the data supplier. */
  CAPTURED,

  /** Attribute is based on data captured by the fleet. */
  FLEET_DATA,

  /**
    * Attribute is derived from some source and artificially created or
    * calculated during map creation.
    */
  ARTIFICIAL,
};

/** Type of reason for the existence of an attribute. */
enum uint8 AttributeReasonType
{
  /** Dynamically controlled system, no static signage may be visible. */
  DYNAMICALLY_CONTROLLED,

  /** Attribute is derived from a posted sign, marking, etc. */
  POSTED,

  /** Attribute is derived from country driving rules. */
  COUNTRY_DRIVING_RULES,

  /** Attribute is learned from the driving behavior of other road users. */
  LEARNED_FROM_BEHAVIOR,
};

/** Attribute confidence.
  * Describes the confidence in the trustworthiness of an attribute. Confidence
  * may include, but is not restricted to confidence in the existence of the
  * attribute, confidence in the accuracy of the attribute, or confidence in
  * the correct value. These types of confidence are all included in one value.
  */
subtype uint8 AttributeConfidence;


/** To better measure the confidence in an attribute, it is also possible to
  * assign an age by adding a timestamp using the `ATTRIBUTE_AGE` attribute
  * property, which defines when the attribute value was collected or processed.
  */
subtype TimeStamp AttributeAge;

/**
  * Payment that can be made at a toll station or which is needed to use a
  * toll road. Applies to a single toll booth if assigned to a lane.
  */
struct TollPaymentMethod
{
  /** Type of payment that is accepted at the toll road, toll station, or toll booth. */
  TollPaymentMethodType type;

  /**
    * Accepted payment providers for the type of payment, for example, a list of
    * accepted credit cards or subscriptions.
    */
  optional TollCollectionProvider provider[];
};

/** Available types of payment for toll stations and toll roads. */
enum varuint16 TollPaymentMethodType
{
  /**
    * Payment types can change based on dynamic information, for example, to
    * avoid long waiting times in front of particular toll lanes. The actual
    * payment type is shown on a variable sign similar to dynamic speed limits.
    */
  VARIABLE,

  /** Cash can be used including coins and bills. */
  CASH_COINS_AND_BILLS,

  /** Cash can be used, but bills only, for example, a 10 Euro bill. */
  CASH_BILLS_ONLY,

  /** Cash can be used, but coins only, for example, 20 Cents. */
  CASH_COINS_ONLY,

  /** Cash can be used, but the exact amount has to be provided. */
  CASH_EXACT_CHANGE,

  /** Credit cards are accepted. */
  CREDIT_CARD,

  /** Debit cards are accepted. */
  DEBIT_CARD,

  /** Travel cards are accepted. */
  TRAVEL_CARD,

  /** Electronic toll collect either via camera or via transponder. */
  ETC,

  /** Electronic toll collect via transponder. */
  ETC_TRANSPONDER,

  /** Electronic toll collect via camera. */
  ETC_VIDEO_CAMERA,

  /** Toll is collected based on subscription, for example, with an electronic purse. */
  SUBSCRIPTION,

  /** Vignette is required. */
  VIGNETTE,

  /** Digital wallets are accepted. */
  DIGITAL_WALLET,
};

/** Name or description of the toll collection provider. */
subtype string TollCollectionProvider;

/**
  * Disputed entity.
  * Indicates that the attribute of a feature is disputed by a country with a
  * certain geopolitical view. Can be used in the rare case of disputed names or
  * other disputed attributes when the overall approach to use a different
  * geopolitical view service is not feasible.
  */
struct DisputedEntity
{
  /** The attribute value reflects the political view of the listed countries. */
  Iso3166Codes requiredByCountries[];

  /** The attribute value is disputed by the listed countries. */
  Iso3166Codes disputedByCountries[];
};