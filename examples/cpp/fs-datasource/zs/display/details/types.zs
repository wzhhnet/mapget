/*!

# Display Attribute Types

This package defines the types that are used by display attributes.

**Dependencies**

!*/

package display.details.types;

import core.color.*;
import core.types.*;
import core.geometry.*;

/*!

## Individual Drawing Order

Display features can be assigned an individual drawing order value if they need to
be rendered in a different order than determined by the default drawing order,
which is described in the NDS.Live Display module.

The drawing order attribute can be assigned to display areas, display lines, and
display features. The attribute consists of two values, a primary and a secondary
drawing order. With these two values, the corresponding display feature
can be inserted into the stack of other display features that are rendered based
on the default drawing order alone.
The primary drawing order equals a value from the default drawing order. The display
feature with the attribute is rendered between that drawing order value and the
next higher value.
The secondary drawing order is used to sort display features with the attribute
on the secondary level between the two default drawing order values.

**Example**

The following figure shows a lake with an island on which there is another
lake.

![Lake on island in Lake](assets/display_individual_drawing_order.png)

The default drawing order of lakes is lower than of land use.
To model the lake within the island, the smaller lake needs to be assigned a
higher drawing order value.

The default drawing order is:

1. WATER
2. LAND_USE
3. BUILDINGS

The smaller lake is assigned a `DRAWING_ORDER` attribute with the following values:

- `primaryDrawingOrder` = 2
- `secondaryDrawingOrder` = 1

The display features are now rendered in the following order:

1. Big lake
2. Island
    1. Smaller lake
3. Building

The next figure shows the same situation, but with another island inside the
smaller lake and a house on that island.

![Smaller lake with island on island in bigger Lake](assets/display_individual_drawing_order_v2.png)

The smaller island also needs to be assigned an individual drawing order value
so that it is rendered on top of the smaller lake.
The building on the island already has a higher default drawing order value and
therefore does not need to be assigned an additional attribute.

The display features are now rendered in the following order:

1. Big lake
2. Big island
    1. Smaller lake
    2. Small island
3. Building

!*/

/** Drawing order of a display feature. */
struct DrawingOrder
{
  /** Primary drawing order to sort into the default drawing order. */
  varuint16 primaryDrawingOrder;

  /**
    * Secondary drawing order to sort multiple features
    * between two default drawing orders.
    */
  varuint16 secondaryDrawingOrder;
};

/*!

## Elevation

The elevation of a display feature can be modeled using one of the following:

- Standalone attribute `ELEVATION_LEVEL`
- Combination of `baseElevation` and the `ELEVATION_DELTA` attribute

The `ELEVATION_LEVEL` attribute describes the level of a display feature.
The higher the elevation level, the higher the actual elevation. Elevation
levels can be used if exact elevation values are not available or not desirable,
for example, due to legal reasons.

If exact elevation levels are to be stored, a `baseElevation` value is stored in
the display attribute layer. The `ELEVATION_DELTA` attribute is assigned to a display
feature and describes the height difference to the corresponding base elevation.

!*/


/** Elevation level of a display feature, described in discrete level values. */
subtype int8 ElevationLevel;

/** Base elevation of the display attribute layer. */
subtype Elevation BaseElevation;


/*!

## z-Level Information

The `Z_LEVEL` attribute defines the relative height of display line features to
each other. The z-level concept provides more flexibility than the default
drawing order to render lines such as roads, ramps, tunnels, and bridges.

The `Z_LEVEL` attribute is assigned to a range of line positions. Display
features with higher values are rendered above features with lower values.
If the `Z_LEVEL` attribute is not assigned to a feature, then no part of
another feature runs above or below the current feature.

z-level changes only occur within display line features. z-level changes at the
end of a line are not allowed.

The following figure shows three display lines representing roads that have
assigned z-level information to ensure that:

- Road 1 is rendered above road 3, regardless of whether the roads cross at
  different levels.
- Road 3 is rendered above road 2 because road 2 is an underpass of road 3.

![Roads with different z-levels](assets/display_z_level_underpass.png)

!*/

/** z-Level of a line display feature. */
subtype int8 ZLevel;

/*!

## Other Types

!*/

/**
  * Display feature is detached from terrain. For example, this is used to ensure
  * that the display line of a road stays at the same height when it crosses
  * a river.
*/
subtype Flag DetachedFromTerrain;

/** Number of floors of a building to enable rendering display areas in 2.5D. */
subtype uint8 BuildingFloorCount;

/** Height of a building in centimeters. */
subtype HeightCentimeters BuildingHeight;

/**
  * Ground height of a building or of part of a building. The value is always
  * positive. Buildings with a ground height larger than 0 are located above
  * ground, on top of another building.
 */
subtype HeightCentimeters GroundHeight;

/** Color of a building roof. */
subtype ColorRgba RoofColor;

/** Color of the walls of a building. */
subtype ColorRgba WallColor;

/** Approximate population of a location, for example, a city. */
enum bit:4 Population
{
  /** Less than 5000. */
  POPULATION_SMALL,

  /** 5000 <= population < 10000. */
  POPULATION_5K,

  /** 10000 <= population < 50000. */
  POPULATION_10K,

  /** 50000 <= population < 100000. */
  POPULATION_50K,

  /** 100000 <= population < 500000. */
  POPULATION_100K,

  /** 500000 <= population < 1 million. */
  POPULATION_500K,

  /** 1 million <= population < 5 million. */
  POPULATION_1M,

  /** 5 million <= population < 10 million. */
  POPULATION_5M,

  /** 10 million <= population < 15 million. */
  POPULATION_10M,

  /** 15 million <= population < 20 million. */
  POPULATION_15M,

  /** 20 million <= population < 25 million. */
  POPULATION_20M,

  /** 25 million <= population < 30 million. */
  POPULATION_25M,

  /** 30 million <= population < 35 million. */
  POPULATION_30M,

  /** 35 million <= population < 40 million. */
  POPULATION_35M,

  /** Population is 40 million or more. */
  POPULATION_40M,
};

  /**
    * Display area has a corresponding 3D representation in a 3D display
    * layer.
    */
subtype Flag Has3dRepresentation;

/** List of original point heights of a 3D polygon mesh. */
struct OriginalPointHeights
{
  /**
    * Relative heights according to the real position of the 3D polygon mesh
    * for each BDAM level of the tile level this attribute is stored in,
    * starting with the most-detailed BDAM level.
    */
  varint16 pointHeight[2];
};

/** Additional feature class for 3D polygon meshes. */
enum varuint16 Additional3dFeatureClass
{
  /** Generic 3D feature class. */
  FEATURE_3D,

  /** Generic type for buildings. */
  AREA_BUILDING,

  /** Private home or residential building. */
  AREA_PRIVATE_HOME_RESIDENTIAL,

  /** Commercial building, for example, a shop. */
  AREA_COMMERCIAL_BUILDING,

  /** Convention or exhibition center. */
  AREA_CONVENTION_EXHIBITION_CENTER,

  /** Retail building. */
  AREA_RETAIL_BUILDING,

  /** Shopping center. */
  AREA_SHOPPING_CENTER,

  /** Petrol or gas station. */
  AREA_PETROL_STATION,

  /** Restaurant. */
  AREA_RESTAURANT,

  /** Hotel or motel. */
  AREA_HOTEL_OR_MOTEL,

  /** Dam. */
  AREA_DAM,

  /** Lighthouse. */
  AREA_LIGHT_HOUSE,

  /** Building without walls. */
  AREA_NO_WALLS,

  /** Multi-storey building. */
  AREA_MULTI_STOREY,

  /** Other facility. */
  AREA_OTHER_FACILITY,

  /** Tower. */
  AREA_TOWER,

  /** Industrial building, for example, a factory. */
  AREA_INDUSTRIAL_BUILDING,

  /** Transportation building. */
  AREA_TRANSPORTATION_BUILDING,

  /** Generic type for public buildings. */
  AREA_PUBLIC_BUILDING,

  /** Police office. */
  AREA_POLICE_OFFICE,

  /** Fire department. */
  AREA_FIRE_DEPARTMENT,

  /** Post office. */
  AREA_POST_OFFICE,

  /** Theater. */
  AREA_THEATER,

  /** Museum. */
  AREA_MUSEUM,

  /** Library. */
  AREA_LIBRARY,

  /** Building of an institution. */
  AREA_INSTITUTION,

  /** Generic type for religious buildings. */
  AREA_RELIGIOUS_BUILDING,

  /** Church. */
  AREA_CHURCH,

  /** Synagogue. */
  AREA_SYNAGOGUE,

  /** Mosque. */
  AREA_MOSQUE,

  /** Temple. */
  AREA_TEMPLE,

  /** Shrine. */
  AREA_SHRINE,

  /** Abbey. */
  AREA_ABBEY,

  /** Monastery. */
  AREA_MONASTERY,

  /** Generic type for building grounds. */
  AREA_BUILDING_GROUND,

  /** Paved. */
  AREA_PAVED,

  /** Sand. */
  AREA_SAND,

  /** Memorial ground. */
  AREA_MEMORIAL_GROUND,

  /** Museum ground. */
  AREA_MUSEUM_GROUND,

  /** Hospital ground. */
  AREA_HOSPITAL_GROUND,

  /** Library ground. */
  AREA_LIBRARY_GROUND,

  /** School ground. */
  AREA_SCHOOL_GROUND,

  /** Stadium ground. */
  AREA_STADIUM_GROUND,

  /** Generic type for governmental administration offices. */
  AREA_GOVERNMENT_OFFICE,

  /** Government building. */
  AREA_GOVERNMENT_BUILDING,

  /** City hall. */
  AREA_CITY_HALL,

  /** Courthouse. */
  AREA_COURTHOUSE,

  /** Prison. */
  AREA_PRISON,

  /** Platform for underground or subway trains. */
  AREA_SUBWAY_PLATFORM,

  /** Underground or subway station. */
  AREA_SUBWAY_STATION,

  /** Simplified shape of an underground building. */
  AREA_SCHEMATIC_BUILDING,

  /** Bridge in urban area. */
  AREA_URBAN_BRIDGE,

  /** Carriageway divider in urban area. */
  AREA_URBAN_CARRIAGEWAY_DIVIDER,

  /** Railway bridge in urban area. */
  AREA_URBAN_RAILWAY_BRIDGE,

  /** Railway crossing in urban area. */
  AREA_URBAN_RAILWAY_CROSSING,

  /** Tunnel in urban area. */
  AREA_URBAN_TUNNEL,

  /**
    * Walkway in urban area.
    *
    * A walkway is not passable for vehicles. It is a part
    * of the road network and access is restricted to
    * pedestrians. A walkway has physical characteristics that
    * prevent vehicles from entering.
    */
  AREA_URBAN_WALKWAY,

  /**
    * Generic type for area features with artificial land use.
    *
    * An artificial land use area has a surface that is modified by humans,
    * usually resulting from construction activities. The area serves a specific
    * purpose.
    */
  AREA_ARTIFICIAL,

  /**
    * Generic type for area features where most of the land is covered by
    * buildings, roads, and artificial surfaces.
    */
  AREA_URBAN,

  /**
    * Area where most of the land is covered by structures. Buildings,
    * roads, and artificial surfaces cover most of the ground.
    * Patches of vegetation and bare soil are the exception.
    */
  AREA_CONTINUOUS_URBAN,

  /**
    * Area where most of the land is covered by structures. Buildings,
    * roads, and artificial surfaces alternate with unconnected patches of
    * vegetation and bare soil that occupy a significant portion of the area.
    */
  AREA_DISCONTINUOUS_URBAN,

  /**
    * Artificial surface and infrastructure that is associated with
    * transportation or an industrial activity.
    */
  AREA_INDUSTRIAL_COMMERCIAL_TRANSPORT,

  /**
    * Area where artificial surfaces, for example, with concrete, asphalt, tarmacadam,
    * or a stabilized surface, such as beaten earth, devoid of vegetation occupy
    * most of the ground. The area also contains buildings or patches of vegetation.
    */
  AREA_INDUSTRIAL_COMMERCIAL_UNITS,

  /** Military base. */
  AREA_MILITARY_BASE,

  /**
    * Generic type for area features with traffic, such as roads, parking
    * facilities, or railways.
    *
    * Includes associated installations, such as stations, platforms, or
    * embankments.
    */
  AREA_TRAFFIC,

  /** Pedestrian area. */
  AREA_TRAFFIC_PEDESTRIAN,

  /** Detailed road area, for example, to be used for detailed city models. */
  AREA_TRAFFIC_ROAD,

  /** Railway line. */
  AREA_TRAFFIC_RAILWAY,

  /** Generic type for parking facilities. */
  AREA_TRAFFIC_PARKING,

  /** Parking garage. */
  AREA_TRAFFIC_PARKING_GARAGE,

  /** Parking lot, for example, open-space parking. */
  AREA_TRAFFIC_PARKING_LOT,

  /** Parking row. */
  AREA_TRAFFIC_PARKING_ROW,

  /** Parking spot. */
  AREA_TRAFFIC_PARKING_SPOT,

  /** Car racetrack. */
  AREA_CAR_RACETRACK,

  /** Underpass. */
  AREA_UNDERPASS,

  /** Center. */
  AREA_CENTER,

  /** City map coverage. */
  AREA_CITY_MAP_COVERAGE,

  /** Periphery. */
  AREA_PERIPHERY,

  /** Postal district. */
  AREA_POSTAL_DISTRICT,

  /** Tunnel icon. */
  AREA_TUNNEL_ICON,

  /** Garden path. */
  AREA_GARDEN_PATH,

  /** Port and port-specific infrastructure, such as quays, dockyards, and marinas. */
  AREA_PORT_FACILITIES,

  /**
    * Airport and airport-specific installations, such as runways, buildings, and
    * associated grounds.
    */
  AREA_AIRPORT,

  /** Runway of an airport. */
  AREA_AIRPORT_RUNWAY,

  /** Surface resulting from excavation, mine dump, or landfill. */
  AREA_MINE_DUMP,

  /**
    * Mineral extraction site.
    *
    * Area with open-pit extraction of industrial minerals, such as sandpits or
    * quarries, or other minerals (open cast mines).
    *
    * Includes flooded gravel pits, except for river-bed extraction.
    */
  AREA_MINERAL_EXTRACTION_SITE,

  /** Landfill or mine dump site, industrial or public. */
  AREA_DUMP,

  /**
    * Space under construction or development, including soil or bedrock
    * excavations or earthworks.
    */
  AREA_CONSTRUCTION,

  /** Cultivated area with vegetation dedicated to any purpose. */
  AREA_VEGETATED,

  /**
    * Cultivated area with vegetation in an urban environment dedicated to
    * any purpose.
    */
  AREA_GREEN_URBAN,

  /** Park within a city. */
  AREA_PARK,

  /** Cemetery or graveyard. */
  AREA_CEMETERY,

  /** Generic type for sport and leisure areas. */
  AREA_SPORT_LEISURE,

  /** Sports complex. */
  AREA_SPORTS_COMPLEX,

  /** Amusement park. */
  AREA_AMUSEMENT_PARK,

  /** Arts center. */
  AREA_ARTS_CENTER,

  /** Camping site. */
  AREA_CAMPING_SITE,

  /** Golf course. */
  AREA_GOLF_COURSE,

  /** Hippodrome. */
  AREA_HIPPODROME,

  /** Holiday area. */
  AREA_HOLIDAY,

  /** Recreational area. */
  AREA_RECREATIONAL,

  /** Rest area. */
  AREA_REST_AREA,

  /** Sports hall. */
  AREA_SPORTS_HALL,

  /** Stadium. */
  AREA_STADIUM,

  /** Walking terrain. */
  AREA_WALKING_TERRAIN,

  /** Zoo. */
  AREA_ZOO,

  /** Ski area. */
  AREA_SKI,

  /** Swimming pool. */
  AREA_SWIMMING_POOL,

  /** Train or railway station. */
  AREA_RAILWAY_STATION,

  /** Ferry terminal, for example, for passengers and cars. */
  AREA_FERRY_TERMINAL,

  /** Bus station. */
  AREA_BUS_STATION,

  /** Harbor for yachts or small port. */
  AREA_MARINA,

  /**
    * Area with vegetation that is cultivated to grow crops or fruits, or used for
    * grazing.
    */
  AREA_AGRICULTURAL,

  /**
    * Cultivated area regularly ploughed and generally under a rotation
    * system.
    */
  AREA_ARABLE,

  /**
    * Area planted with cereals, legumes, fodder crops, root crops, or fallow.
    *
    * Includes flower and tree (nurseries) cultivation and vegetables,
    * whether open field, under plastic, or glass (includes market
    * gardening). Includes aromatic, medicinal, and culinary plants.
    *
    * Excludes permanent pastures.
    */
  AREA_NON_IRRIGATED,

  /**
    * Area planted with crops irrigated permanently and periodically, using a permanent
    * infrastructure like irrigation channels and a drainage network. Most of
    * these crops could not be cultivated without an artificial water
    * supply.
    *
    * Excludes sporadically irrigated land.
    */
  AREA_PERMANENTLY_IRRIGATED,

  /**
    * Area with rice cultivation that has flat surfaces with
    * irrigation channels. Surfaces are flooded regularly.
    */
  AREA_RICE_FIELD,

  /**
    * Area with crops that are not cultivated under a rotation system, which provides
    * repeated harvests. The crops occupy the land for a long period before it
    * is ploughed and replanted. Mainly plantations of woody crops.
    *
    * Excludes pastures, grazing lands, and forests.
    */
  AREA_PERMANENT_CROP,

  /**
    * Area planted with fruit trees or scrubs.
    *
    * Includes single or mixed fruit species, fruit trees associated with
    * permanently grassed surfaces. Includes chestnut and walnut groves.
    */
  AREA_TREE_BERRY_PLANTATION,

  /** Area planted with vines. */
  AREA_VINEYARD,

  /**
    * Areas planted with olive trees, including mixed occurrence of
    * olive trees and vines on the same parcel.
    */
  AREA_OLIVE_GROVES,

  /**
    * Partly or fully cultivated area with crops or pastures next to other
    * vegetation, such as trees.
    */
  AREA_HETEROGENEOUS,

  /**
    * Area with non-permanent crop, such as arable land or pasture, associated with
    * permanent crop on the same ground.
    */
  AREA_COMPLEX_CULTIVATION,

  /**
    * Area with non-permanent crop, such as arable land or pasture, associated with
    * permanent crop on the same ground.
    */
  AREA_ANNUAL_PERMANENT,

  /**
    * Area with annual crops of grazing land under the wooded cover of forestry
    * species.
    */
  AREA_AGRO_FORESTRY,

  /**
    * Area primarily occupied by agriculture, interspersed with
    * significant natural areas.
    */
  AREA_AGRICULTURAL_AND_NATURAL,

  /** Grassland area usually used for grazing. */
  AREA_PASTURE_RANGELAND,

  /**
    * Area with dense, predominantly graminoid grass cover of floral
    * composition, which is not under a rotation system.
    *
    * Mainly used for grazing, but the fodder may be harvested mechanically.
    * Includes areas with hedges (bocage).
    */
  AREA_PASTURE,

  /**
    * Spatially extensive area of natural grass cover, usually short
    * grass in semi-arid climates, on which ruminants are allowed to
    * graze freely.
    */
  AREA_RANGELAND,

  /** Annual crops of grazing land under the wooded cover of forestry species. */
  AREA_FOREST_SEMI_NATURAL,

  /**
    * Vegetation formation composed primarily of trees, including shrub
    * and bush undergrowth.
    */
  AREA_FOREST,

  /**
    * Vegetation formation composed primarily of trees, including
    * shrub and bush undergrowth, where broad-leaved species
    * predominate.
    */
  AREA_LEAVED_FOREST,

  /**
    * Vegetation formation composed primarily of trees, including
    * shrub and bush undergrowth, where coniferous species
    * predominate.
    */
  AREA_CONIFEROUS,

  /**
    * Vegetation formation composed primarily of trees, including
    * shrub and bush undergrowth, where broad-leaved and coniferous
    * species co-dominate.
    */
  AREA_MIXED_FOREST,

  /**
    * Bushy vegetation, generally with low cover and with no or scattered
    * trees.
    */
  AREA_SCRUB,

  /**
    * Low productivity grassland. Often situated in areas of rough
    * uneven ground. Frequently includes rocky areas, briars, and heath.
    */
  AREA_GRASSLAND,

  /**
    * Vegetation with low and closed cover, dominated by bushes,
    * shrubs and herbaceous plants, for example, heath, briars, broom, gorse,
    * or laburnum.
    */
  AREA_MOOR_HEATH,

  /**
    * Vegetation formation composed of plants with hard leaves and short internodes.
    *
    * Bushy, sclerophyllous vegetation. Includes maquis and garrigue.
    *
    * Maquis: A dense vegetation associated composed of numerous
    * shrubs associated with siliceous soils in the Mediterranean
    * environment.
    *
    * Garrigue: Discontinuous bushy associations of Mediterranean
    * calcareous plateaus. Generally composed of kermes oaks,
    * arbutus, lavender, thyme, cistus, etc. May include a few
    * isolated trees.
    */
  AREA_SCLEROPHYLLOUS,

  /**
    * Bushy or herbaceous vegetation with scattered trees. Can
    * represent either woodland degradation or forest
    * regeneration/colonization.
    */
  AREA_WOODLAND,

  /**
    * Area with little or no vegetation, such as sandy or rocky areas,
    * permanent ice or snow, or sparsely vegetated high altitude areas.
    */
  AREA_OPEN_SPACE,

  /** Scree, cliff, rock, and outcrop. */
  AREA_ROCK,

  /** Area covered by glaciers or permanent snowfields. */
  AREA_GLACIER,

  /** Areas affected by recent fires, still mainly black. */
  AREA_BURNT,

  /**
    * Area with sparse vegetation.
    *
    * Includes steppes, tundras, and badlands. Scattered high-altitude vegetation.
    */
  AREA_SPARSELY_VEGETATED,

  /**
    * Beach, dunes, and expanses of sand or pebbles in coastal or
    * continental locations.
    *
    * Includes beds of stream channels with torrential regime.
    */
  AREA_BEACH_DUNE,

  /** Inland or coastal area seasonally, tidally, or permanently waterlogged. */
  AREA_WETLAND,

  /**
    * Forested or non-forested area either partially, seasonally, or
    * permanently waterlogged. The water may be stagnant or circulating.
    */
  AREA_INLAND_WETLAND,

  /**
    * Low-lying land usually flooded in winter and more or less
    * saturated by water all year round.
    */
  AREA_INLAND_MARSH,

  /**
    * Peatland consisting mainly of decomposed moss and vegetable
    * matter. May or may not be exploited.
    */
  AREA_PEATBOG,

  /**
    * Wetland, including wooded seeps, shrub swamps, and floodplain forests,
    * dominated by shrubs or trees. May or may not be exploited.
    */
  AREA_FORESTED_WETLAND,

  /**
    * Non-wooded costal area either tidally, seasonally, or permanently
    * waterlogged with brackish or saline water.
    */
  AREA_COASTAL_WETLAND,

  /**
    * Non-wooded area either tidally, seasonally, or permanently
    * waterlogged with brackish or saline water.
    */
  AREA_SALT_MARSH,

  /**
    * Salt plants, active or in process of abandonment. Sections of
    * salt marsh exploited for the production of salt by evaporation.
    * Saline areas are clearly distinguishable from the rest of the marsh by
    * their segmentation and embankment system.
    */
  AREA_SALINE,

  /**
    * Generally unvegetated expanses of mud, sand, or rock between high-water
    * and low-water marks. On contour on maps.
    */
  AREA_INTERTIDAL_FLAT,

  /**
    * Island.
    *
    * Islands can be connected to other land by means of a bridge or tunnel or
    * be accessible by ferry.
    */
  AREA_ISLAND,

  /** Generic type for water area features. */
  AREA_WATER,

  /** Water bodies with no or only limited connection to the sea or ocean. */
  AREA_INLAND_WATER,

  /** Linear body of inland water of natural or semi-natural origin. */
  AREA_RIVER,

  /** Artificially constructed linear water body. */
  AREA_CANAL,

  /** Natural or artificial stretches of water, excluding reservoirs. */
  AREA_LAKE,

  /**
    * Constructed stretches of water or artificially contained
    * natural stretches of water, used primarily as water sources
    * for human populations or for agricultural purposes.
    */
  AREA_RESERVOIR,

  /** Low-lying area of land that a river runs through. */
  AREA_BASIN,

  /** Sea, ocean, or other saline water bodies connected to them. */
  AREA_MARINE_WATER,

  /** Zone seaward of the lowest tide limit. */
  AREA_SEA_OCEAN,

  /**
    * Unvegetated stretches of salt or brackish waters separated from
    * the sea by a tongue of land or other similar topography. These
    * water bodies can be connected with the sea at limited points,
    * either permanently or for parts of the year only.
    */
  AREA_COASTAL_LAGOON,

  /** Mouth of a river within which the tide ebbs and flows. */
  AREA_ESTUARY,

  /** Generic type for administrative area features. */
  AREA_ADMIN,

  /** Country. */
  AREA_COUNTRY,

  /** Set of sub-countries. */
  AREA_SUB_COUNTRY_SET,

  /** Sub-country. */
  AREA_SUB_COUNTRY,

  /** County. */
  AREA_COUNTY,

  /** Municipality. */
  AREA_MUNICIPALITY,

  /** Municipality subdivision. */
  AREA_MUNICIPALITY_SUBDIVISION,

  /** Neighborhood. */
  AREA_NEIGHBORHOOD,

  /** City block. */
  AREA_CITY_BLOCK,

  /** Autonomous administrative area. */
  AREA_ADMIN_AUTONOMOUS,

  /** Native tribe reservation. */
  AREA_NATIVE_TRIBE_RESERVATION,

  /** Contour area. */
  AREA_CONTOUR,

  /** National park. */
  AREA_NATIONAL_PARK,

  /** Environmental zone. */
  AREA_ENVIRONMENTAL_ZONE,

  /** Toll zone. */
  AREA_TOLL_ZONE,

  /** Generic type for education buildings. */
  AREA_EDUCATION_BUILDING,

  /** School. */
  AREA_SCHOOL,

  /** University or college. */
  AREA_UNIVERSITY_OR_COLLEGE,

  /** Generic type for medical buildings. */
  AREA_MEDICAL_BUILDING,

  /** Hospital. */
  AREA_HOSPITAL,

  /** Emergency service. */
  AREA_EMERGENCY_SERVICE,

  /** Generic type for cultural buildings. */
  AREA_CULTURE_BUILDING,

  /** Historical building. */
  AREA_HISTORICAL_BUILDING,

  /** Tourist building. */
  AREA_TOURIST_BUILDING,

  /** Castle. */
  AREA_CASTLE,

  /** Fortress. */
  AREA_FORTRESS,

  /** Monument. */
  AREA_MONUMENT,

  /** Viewpoint. */
  AREA_VIEW,

  /** Watermill. */
  AREA_WATERMILL,

  /** Windmill. */
  AREA_WINDMILL,

  /** Building that is used for recreation and leisure activities. */
  AREA_LEISURE_BUILDING,

  /** Sport building, for example, gym or indoor swimming pool. */
  AREA_SPORT_BUILDING,

  /** 3D road surface. */
  ROAD_SURFACE_3D,

  /** 3D building. */
  BUILDING_3D,

  /** 3D landmark. */
  OBJECT_LANDMARK_3D,

  /** 3D road furniture. */
  FURNITURE_3D,

  /** Street light as 3D road furniture. */
  FURNITURE_3D_STREET_LIGHT,

  /** Traffic lights as 3D road furniture. */
  FURNITURE_3D_TRAFFIC_LIGHTS,

  /** Tree as 3D road furniture. */
  FURNITURE_3D_TREE,

  /** Road sign as 3D road furniture. */
  FURNITURE_3D_ROAD_SIGN,

  /** Bridge as 3D road furniture. */
  FURNITURE_3D_BRIDGE,

  /** Bus stop as 3D road furniture. */
  FURNITURE_3D_BUS_STOP,

  /** Tram stop as 3D road furniture. */
  FURNITURE_3D_TRAM_STOP,

  /** Tunnel as 3D road furniture. */
  FURNITURE_3D_TUNNEL,

  /** Tunnel on the left side as 3D road furniture. */
  FURNITURE_3D_TUNNEL_LEFT,

  /** Tunnel on the right side as 3D road furniture. */
  FURNITURE_3D_TUNNEL_RIGHT,

  /** Tunnel roof as 3D road furniture. */
  FURNITURE_3D_TUNNEL_ROOF,

  /** Tunnel roof on the left side as 3D road furniture. */
  FURNITURE_3D_TUNNEL_ROOF_LEFT,

  /** Tunnel roof on the right side as 3D road furniture. */
  FURNITURE_3D_TUNNEL_ROOF_RIGHT,

  /**
    * Tunnel portal, that is, the entrance or exit of a tunnel as 3D road
    * furniture.
    */
  FURNITURE_3D_TUNNEL_PORTAL,

  /** Lane marking as 3D road surface. */
  ROAD_SURFACE_3D_LANE_MARKING,

  /** Lane separator marking as 3D road surface. */
  ROAD_SURFACE_3D_LANE_SEPARATOR_MARKING,

  /** Stop line as 3D road surface. */
  ROAD_SURFACE_3D_STOP_LINE,

  /** Stop zone as 3D road surface. */
  ROAD_SURFACE_3D_STOP_ZONE,

  /** Lane as 3D road surface. */
  ROAD_SURFACE_3D_LANE,

  /** Bicycle lane as 3D road surface. */
  ROAD_SURFACE_3D_LANE_BICYCLE,

  /** Bus lane as 3D road surface. */
  ROAD_SURFACE_3D_LANE_BUS,

  /** Taxi lane as 3D road surface. */
  ROAD_SURFACE_3D_LANE_TAXI,

  /** HOV lane as 3D road surface. */
  ROAD_SURFACE_3D_LANE_HOV,

  /** Toll lane as 3D road surface. */
  ROAD_SURFACE_3D_LANE_TOLL,

  /** Electronic toll collect lane as 3D road surface. */
  ROAD_SURFACE_3D_LANE_TOLL_ETC,

  /** Decoration as 3D road surface. */
  ROAD_SURFACE_3D_DECORATION,

  /** Restriction as 3D road surface. */
  ROAD_SURFACE_3D_RESTRICTION,

  /** Pedestrian crossing as 3D road surface. */
  ROAD_SURFACE_3D_PEDESTRIAN_CROSSING,

  /** Enhanced city model. */
  ENHANCED_CITY_MODEL,

  /** 3D city model. */
  CITY_MODEL,
};
