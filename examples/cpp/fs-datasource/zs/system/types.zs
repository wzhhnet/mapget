/*!

# System Types

This package defines generic data structures that are used to define and identify
NDS.Live systems and the components of such a system.

!*/

package system.types;

/*!

## NDS.Live System Information

The system information provides identifiers for an NDS.Live system and the nodes
that belong to the system.

Every NDS.Live system has a unique identifier that represents the whole system
as well as unique identifiers of each node in that system. In addition, legal
metadata is provided for each node, for example, to include the name of a
service provider and describe the type of content that is provided by a service.

!*/

rule_group ServiceNodeMetadataRules
{
  /*!
  String Representation of Content Timestamp:

  The string representation of `NdsNodeLegalInfo.contentTimestamp`
  shall follow the standards RFC 3339 and ISO 8601.
  !*/

  rule "system-484htg";
};


/** NDS.Live system token. */
struct NdsSystemToken
{
      /**
        * Unique identifier of an NDS.Live system. This includes all nodes that
        * work together as one system.
        */
      UUID mapId;
};

/** NDS.Live node token. */
struct NdsNodeToken
{
  /** Unique identifier of a network node. */
  UUID nodeId;
};

/** Universally unique identifier. 16 Byte, RFC 4122. **/
struct UUID
{
  uint8 uuid[16];
};

/** Legal metadata of a service node in an NDS.Live system. */
struct NdsNodeLegalInfo
{
  /** Identifier of the node for further reference. */
  NdsNodeToken nodeId;

  /** Name of the service provider. */
  string providerName;

  /** Name of the content provided by the service, for example, the map release name. */
  string contentName;

  /**
    * Optional identifier of a content version if content is versioned.
    * Can be empty, for example, for live content.
    */
  string contentVersion;

  /**
    * Optional timestamp for dynamic service content.
    * Can be empty, for example, for static and live data.
    */
  string contentTimestamp;

  /** Copyright statement. */
  string copyright;

  /** License information. */
  string licenses;
};

/*!

## Module Definition

The module definition provides basic information about a module in an NDS.Live
system and about the structures that are provided by that module. Each module
has a name and a version.

An application can use the module definition to identify the relevant modules
for specific use cases. Using the combination of module name, module version,
and external data wrapper, it can also choose the parser for deserialization and
identify the required target structure within a module.

The following conventions apply:

- `ModuleVersion` = \<Release year\>.\<Release month with leading
  zero\>
- `ModuleName`: Module names only use capital letters. Suffixes are added for
  some module types, for example:
    - Reference modules have the suffix `.REFERENCE`.
    - Attribute modules with a corresponding feature module may have the suffix
      `.DETAILS`.
    - Examples: `CORE`, `ROAD`, `ROAD.REFERENCE`, `VENUE`, `VENUE.DETAILS`,
      `VENUE.REFERENCE`
- `ModuleExtern`: \<module\>.\<package\>.\<structure\>
    - The packages are defined in the corresponding module using consts.
    - Applications can only use strings that are provided in the *_module.zs*
      file of each module.
    - Example: `lane.metadata.FeatureLayerMetadata`

The extern descriptor contains the name and version of the module that is
required to parse the data. The `minVersion` field can be used to specify the
minimum version of the module parser that is required to read the data. The writer of
the data has to ensure that the data can be parsed by any parser that supports
a version between `minVersion` (included) and `version` (included).
Setting `minVersion` is optional. If not used, the field is set to the same
value as `version`, resulting in the requirement that the data can only be
parsed by a parser that supports the exact version of the module.

!*/

/** Definition of a module. Each module has a name and a version. */
struct ModuleDefinition
{
  /** Name of the module. */
  ModuleName name;

  /** Version of the module. */
  ModuleVersion version;
};

/** Module version string. */
subtype string  ModuleVersion;

/** Module name string. */
subtype string  ModuleName;

/** External data wrapper. */
struct ExternData
{
  align(8):

  /**
    * The `extern` descriptor uniquely identifies the target structure into which
    * to cast the external data buffer.
    */
  ExternDescriptor externDescriptor;

  /** External data buffer. */
  extern data;
};

/** Descriptor of external data. */
struct ExternDescriptor
{
  /** Name of the module. */
  ModuleName name;

  /** Version of the module with which the data was written. */
  ModuleVersion version;

  /** Minimum version of the module that is required to parse the data. */
  ModuleVersion minVersion;

  /** Target structure into which to cast the external data buffer. */
  ModuleExtern target;
};

/** Module structures that can be used in `extern` fields. */
subtype string ModuleExtern;

/**
  * Module services descriptor to be used in other modules.
  * Notation follows the package notation, for example,
  * "smart.services.SmartLayerTileService". These strings are defined in the
  * respective module using consts. Applications shall not use any other
  * strings than provided in the _module.zs of each module.
  */
subtype string ModuleService;

/*!

## Layer Type

The layer type classifies the layers that are provided by NDS.Live modules.

!*/

/** Type of layer that is provided by an NDS.Live module. */
enum uint8 LayerType
{
  /** A feature layer contains map features. */
  FEATURE,

  /** A geometry layer contains geometries. */
  GEOMETRY,

  /** An attribute layer contains attributes for map features. */
  ATTRIBUTE,

  /**
    * A relation layer contains relations between features
    * or between features and geometries with identifiers.
    */
  RELATION,
};
