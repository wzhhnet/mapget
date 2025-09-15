/*!

# Vehicle Metadata

This package defines the metadata for the Vehicle module.

**Dependencies**

!*/

package vehicle.metadata;


/*!

## Vehicle Registry Metadata

Vehicle registry metadata stores information about the type and capabilities of
a vehicle service.

Vehicle registry metadata structures are stored in the registry service metadata.
This allows clients to identify capabilities and content definitions of vehicle
services before querying the services.

!*/

rule_group VehicleRegistryMetadataRules
{
  /*!
  Vehicle Registry Metadata Storage:

  Vehicle registry metadata structures shall be stored in the registry service metadata.
  !*/

  rule "vehicle-hc7ccv";
};

struct VehicleRegistryMetadata
{
  /** Type of the vehicle service. */
  VehicleServiceType vehicleServiceType;

  /** Description of the implemented service methods of the vehicle service. */
  VehicleServiceCapabilities(vehicleServiceType) capabilities;

};

/** Type of the vehicle service. **/
enum uint8 VehicleServiceType
{
  /** Service calculates horizon information based on a vehicle's pose. */
  HORIZON_SERVICE,
};

/*!

## Vehicle Service Capabilities

`VehicleServiceCapabilities` describes the implemented capabilities of a vehicle service.
The capabilities depend on the routing service type.


!*/

choice VehicleServiceCapabilities(VehicleServiceType type) on type
{
  case HORIZON_SERVICE:
        HorizonServiceCapabilities horizonServiceCapabilities;
};

/** Optional methods that a vehicle horizon service may implement. */
bitmask uint32 HorizonServiceCapabilities
{
  /** Set bit if the `calculateHorizon` method is implemented. */
  CALCULATE_HORIZON,
};

/** Wrapper around horizon service capabilities for direct use in service interface. */
struct HorizonServiceCapabilitiesResponse
{
  HorizonServiceCapabilities capabilities;
};
