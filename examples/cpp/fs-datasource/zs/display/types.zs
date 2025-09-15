/*!

# Display Feature Types

This package defines types that are used in other packages of the Display module.

**Dependencies**

!*/

package display.types;

import system.types.*;
import core.color.*;
import core.geometry.*;
import core.grid.*;
import core.types.*;
import core.icons.*;
import display.reference.types.*;

/*!

## Types for 2D Display Features

<!--Todo: provide short description of what makes up a 2D display feature, i.e. type, geometry...-->

There are three types of 2D display features:

- Display points
- Display lines
- Display areas

!*/

/** Types for display point features. */
enum varuint16 DisplayPointType
{
  /** Generic display point. */
  DISPLAY_POINT,

  /**
    * Central activity point of a municipality.
    *
    * Typically the town hall, central train station, or another central
    * activity point, such as a church or pedestrian area.
    */
  POINT_MUNICIPALITY_CENTER,

  /**
    * Central activity point of a municipality subdivision, for example, the
    * center of a city district.
    */
  POINT_MUNICIPALITY_SUBDIVISION_CENTER,

  /**
    * Hamlet.
    *
    * In Europe, a hamlet is a very small village, typically without a church.
    * In some countries, hamlets are well-known locations and are used
    * by inhabitants to refer to their home address.
    * In the U.S., a hamlet is a community without an official, independent
    * political structure, which is also known as an unincorporated community.
    */
  POINT_HAMLET,

  /** Mountain peak. */
  POINT_MOUNTAIN_PEAK,

  /**
    * Neighborhood.
    *
    * Neighborhoods have a semiofficial status but are not part of an
    * administrative structure. A neighborhood does not fit specifically in an
    * administrative structure. Neighborhoods are areas formed on a cultural,
    * social or economical basis. They may have touristic appeal as a nice area
    * with a specific atmosphere like a restaurant area.
    *
    * Neighborhoods typically do not have official borders and they typically
    * do not have an equivalent in administrative or postal sources.
    * Names of neighborhoods are commonly known and often used as place names.
    *
    * Examples:
    * Karolinenviertel in Hamburg, Little Italy in New York, Quartier Pigalle
    * in Paris, Soho in London, Museum Island in Berlin.
    */
  POINT_NEIGHBORHOOD,

  /**
    * Exit of a controlled-access road.
    *
    * Can be used to display icons and names at the correct position on the map.
    */
  POINT_CONTROLLED_ACCESS_EXIT,

  /**
    * Entry of a controlled-access road.
    *
    * Can be used to display icons and names at the correct position on the map.
    */
  POINT_CONTROLLED_ACCESS_ENTRY,

  /**
    * Intersection of a controlled-access road.
    *
    * Can be used to display icons and names at the correct position on the map.
    */
  POINT_CONTROLLED_ACCESS_INTERSECTION,

  /**
    * Country.
    *
    * Can be used to display country names on the map.
    */
  POINT_COUNTRY,

  /**
    * Sub-country area.
    *
    * Can be used to display state and province names on the map.
    */
  POINT_SUB_COUNTRY,

  /** Traffic light. */
  POINT_TRAFFIC_LIGHT,

  /**
    * Sea or ocean.
    *
    * Can be used to display a label for seas and oceans that have no
    * area of their own but use the background color.
    */
  POINT_SEA_OCEAN,

  /**
    * Set of sub-countries.
    *
    * Can be used to display region names that are on a higher administrative
    * level than provinces and states on the map.
    */
  POINT_SUB_COUNTRY_SET,

  /**
    * County.
    *
    * Can be used to display county names on the map.
    */
  POINT_COUNTY,

  /**
    * City block.
    *
    * Can be used to display city block names on the map, for example, Japanese
    * Gaiku.
    */
  POINT_CITY_BLOCK,

  /**
    * Island.
    *
    * Can be used to display island names on the map.
    */
  POINT_ISLAND,

  /**
    * Autonomous region.
    *
    * Can be used to fulfill censoring requirements in some countries.
    */
  POINT_AUTONOMOUS_REGION,

  /**
    * Central activity point of a municipality that represents a capital
    * city. Generic type that does not indicate whether this is the capital
    * of a country, sub-country, or zone.
    */
  POINT_MUNICIPALITY_CENTER_CAPITAL,

  /**
    * Central activity point of a municipality that represents the capital
    * city of a country.
    */
  POINT_MUNICIPALITY_CENTER_CAPITAL_COUNTRY,

  /**
    * Central activity point of a municipality that represents the capital
    * city of a sub-country.
    */
  POINT_MUNICIPALITY_CENTER_CAPITAL_SUB_COUNTRY,

  /**
    * Central activity point of a municipality that represents the capital
    * city of a county.
    */
  POINT_MUNICIPALITY_CENTER_CAPITAL_COUNTY,

  /**
    * Central activity point of a municipality that represents the capital
    * city of a set of countries.
    */
  POINT_MUNICIPALITY_CENTER_CAPITAL_COUNTRY_SET,

  /**
    * Central activity point of a municipality that represents the capital
    * city of a set of sub-countries.
    */
  POINT_MUNICIPALITY_CENTER_CAPITAL_SUB_COUNTRY_SET,

  /**
    * Central activity point of a municipality that represents the capital
    * city of a zone.
    */
  POINT_MUNICIPALITY_CENTER_CAPITAL_ZONE,

  /** Name of a continent. */
  POINT_CONTINENT,

  /** 
    * Name of a river. 
    * Can be used to fulfill censoring requirements in some countries. 
    */
  POINT_RIVER_NAME,
};

/** Types for display line features. */
enum varuint16 DisplayLineType
{
  /** Generic display line. */
  DISPLAY_LINE,

  /** Generic type for road lines, including ferries. */
  LINE_ROAD,

  /**
    * Supporting details of town blocks.
    *
    * Line block details help to recognize visually relevant line patterns,
    * for example, the accentuation of elevation differences or structural
    * subdivisions.
    */
  LINE_BLOCK_DETAIL,

  /**
    * Decorative characteristic of a building, for example, painted or
    * imprinted line patterns, representative edges of the building,
    * or shapes of building parts with different elevation.
    */
  LINE_BUILDING_DETAIL,

  /** Generic type for public transport line features. */
  LINE_PUBLIC_TRANSPORT,

  /** Generic type for railway line features. */
  LINE_RAILWAY,

  /** Long-distance railway track. */
  LINE_RAILWAY_LONG_DISTANCE,

  /** Regional railway track. */
  LINE_RAILWAY_REGIONAL,

  /** Local railway track. */
  LINE_RAILWAY_LOCAL,

  /** Tracks of underground trains. */
  LINE_SUBWAY,

  /** Tram track. */
  LINE_TRAM,

  /** Monorail track. */
  LINE_MONORAIL,

  /** Bus line. */
  LINE_BUS,

  /** Generic type for water line features. */
  LINE_WATER,

  /** Creek. */
  LINE_CREEK,

  /** Drain. */
  LINE_DRAIN,

  /** River. */
  LINE_RIVER,

  /** Wadi. */
  LINE_WADI,

  /** Canal. */
  LINE_CANAL,

  /** Generic type for border line features. */
  LINE_BORDER,

  /**
    * Border of a country.
    *
    * Example: `LINE_BORDER_COUNTRY` denotes the border of an administrative area
    * of class `AREA_COUNTRY`.
    */
  LINE_BORDER_COUNTRY,

  /** Border of a set of sub-countries. */
  LINE_BORDER_SUB_COUNTRY_SET,

  /** Border of a sub-country. */
  LINE_BORDER_SUB_COUNTRY,

  /** Border of a county. */
  LINE_BORDER_COUNTY,

  /** Border of a municipality. */
  LINE_BORDER_MUNICIPALITY,

  /** Border of a municipality subdivision. */
  LINE_BORDER_MUNICIPALITY_SUBDIVISION,

  /** Border of a neighborhood. */
  LINE_BORDER_NEIGHBORHOOD,

  /** Border of a city block. */
  LINE_BORDER_CITY_BLOCK,

  /** Generic type for non-administrative border line features. */
  LINE_BORDER_NON_ADMIN,

  /** Border of area code for phone numbers. */
  LINE_BORDER_PHONE,

  /** Border of postal code area. */
  LINE_BORDER_POSTAL,

  /** Border of police district. */
  LINE_BORDER_POLICE,

  /** Border of school district. */
  LINE_BORDER_SCHOOL,

  /** Border of time zone area. */
  LINE_TIME_ZONE,

  /** Generic type for geopolitical border features of disputed areas. */
  LINE_BORDER_DISPUTED,

  /**
    * Border of disputed country.
    *
    * Example: `LINE_BORDER_DISPUTED_COUNTRY` denotes the border of an
    * administrative area of type `AREA_COUNTRY`.
    */
  LINE_BORDER_DISPUTED_COUNTRY,

  /** Border of disputed sub-country. */
  LINE_BORDER_DISPUTED_SUB_COUNTRY,

  /** Generic feature type for geopolitical borders of treaty lines. */
  LINE_BORDER_TREATY_LINE,

  /**
    * Border of country-specific treaty line.
    *
    * Example: `LINE_BORDER_TREATY_LINE_COUNTRY` denotes the border of an
    * administrative area of type `AREA_COUNTRY`.
    */
  LINE_BORDER_TREATY_LINE_COUNTRY,

  /** Border of treaty line that is specific to a sub-country. */
  LINE_BORDER_TREATY_LINE_SUB_COUNTRY,

  /** Geopolitical border of the sea area of a country. */
  LINE_SEA_BORDER_COUNTRY,

  /** Geopolitical border of the sea area of a sub-country. */
  LINE_SEA_BORDER_SUB_COUNTRY,

  /**
    * Border of a special administrative region.
    *
    * Example: Can be used for the border of the Hong Kong region in a China
    * Overview Map.
    */
  LINE_BORDER_SPECIAL_ADMIN_REGION,

  /** Geopolitical border of a sea area of a set of sub-countries. */
  LINE_SEA_BORDER_SUB_COUNTRY_SET,

  /** Military ceasefire line. */
  LINE_BORDER_TREATY_CEASEFIRE_LINE,

  /** Border of a disputed territory. */
  LINE_BORDER_DISPUTED_TERRITORY,
};

/** Types for display area features. */
enum varuint16 DisplayAreaType
{
  /** Generic display area. */
  DISPLAY_AREA,

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

  /**
    * Generic type for area features where most of the land is covered by
    * buildings, roads, and artificial surfaces.
    */
  AREA_URBAN,

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
    * Generic type for area features with artificial land use.
    *
    * An artificial land use area has a surface that is modified by humans,
    * usually resulting from construction activities. The area serves a specific
    * purpose.
    */
  AREA_ARTIFICIAL,

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

  /**
    * Valley, gully, or streambed that remains dry except
    * during the rainy season.
    */
  AREA_WADI,

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

  /**
    * Area representing terrain.
    *
    * Can be used to indicate 3D surfaces that are just a terrain and do not
    * represent any specific area feature.
    */
  AREA_TERRAIN,

  /**
    * Pedestrian crossing on a road, for example, to be used for detailed
    * city models.
    */
  AREA_TRAFFIC_ROAD_PEDESTRIAN_CROSSING,

  /** Stop zone on a road. */
  AREA_TRAFFIC_ROAD_STOP_ZONE,

  /** Road decoration. */
  AREA_TRAFFIC_ROAD_DECORATION,

  /** Stop line on a road. */
  AREA_TRAFFIC_ROAD_STOP_LINE,

  /** Road restriction. */
  AREA_TRAFFIC_ROAD_RESTRICTION,

  /** Lane. */
  AREA_TRAFFIC_LANE,

  /** Lane marking. */
  AREA_TRAFFIC_LANE_MARKING,

  /** Lane separator marking. */
  AREA_TRAFFIC_LANE_SEPARATOR_MARKING,

  /** Bicycle lane. */
  AREA_TRAFFIC_LANE_BICYCLE,

  /** Bus lane. */
  AREA_TRAFFIC_LANE_BUS,

  /** Taxi lane. */
  AREA_TRAFFIC_LANE_TAXI,

  /** HOV lane. */
  AREA_TRAFFIC_LANE_HOV,

  /** Toll lane. */
  AREA_TRAFFIC_LANE_TOLL,

  /** Electronic toll collect lane. */
  AREA_TRAFFIC_LANE_TOLL_ETC,

  /** Parking row. */
  AREA_TRAFFIC_PARKING_ROW,

  /** Parking spot. */
  AREA_TRAFFIC_PARKING_SPOT,
};

/** Default drawing order of a display feature type. */
subtype varuint16 DefaultDrawingOrder;

/*!

### Clipping Edges

Polygons are clipped at tile borders. Because of this, additional edges are
introduced that can be ignored when drawing the outlines of display areas. The
structure `ClippingEdgeList` stores these edges.

The structure may also store edges of display areas within a tile that are
undesirable to be drawn. Example: The border between a lake and a river that
flows into the lake. The polygons of the two water areas share an edge that is
not to be displayed.

!*/

/** List of clipping edges. */
struct ClippingEdgeList
{
  /**
    * Coordinate shift of the list.
    * Shall match the coordinate shift used in the area display geometry layer.
    */
  CoordShift shift;

  /** Number of edges stored in the list. */
  varsize numEdges : numEdges > 0;

  /** Clipping edges. */
  ClippingEdge(shift) edges[numEdges];
};

/**
  * Edge of a polygon on a tile border that is introduced because of clipping or
  * edge of a polygon within a tile that is not to be displayed. This edge can
  * be ignored when drawing outlines of display areas.
  */
struct ClippingEdge(CoordShift shift)
{
  /** Start position of the edge. */
  Position2D(shift) startPosition;

  /** End position of the edge. */
  Position2D(shift) endPosition;
};

/*!

### Scale Denominator of Sublevel

The sublevel scale denominator determines for each feature at which scale
sublevel the feature is suppressed when gradually zooming out of the map.

The goal is to have a more or less uniform density of features on
the display while taking into account the subjective importance of features.
The range of scale denominator values is given by `maxScaleDenominator` and
`minScaleDenominator` in descending order.

Features on the corresponding level have a scale sublevel attribute in the range
[0, `numSubscales`-1]. A feature with the sublevel attribute i is suppressed
by the rendering engine if the current map scale denominator is greater
than subscale[i].

!*/

/**
  * Scale denominator of sublevel. Determines at which scale sublevel the
  * feature is suppressed when zooming out.
  */
subtype ScaleDenominator SublevelScaleDenominator;

/*!

## Generic Icon Mapping

Icon sets can be mapped to features, position attributes, or enum values of
position attributes.
This generic mapping can then be used to draw icons on the position
of all the instances of such a feature or position attributes, based on the
position validity of the feature.

Example – Icon for a POI standard category:

1. External descriptor points to the feature type, for which the icon set is valid:
   `descriptor.target` = `poi.reference.PoiStandardCategory`.
2. `targetEnumValue` points to the enum value of the POI standard category, for
   example, `POICAT_RESTAURANT`.
3. The application displays the mapped icon on the position of any POI of standard
   category `POICAT_RESTAURANT`.

Example – Generic icon mapping for intersections:

1. External descriptor points to the feature type, for which the icon set is valid:
   `descriptor.target` = `road.road.Intersection`.
2. The application displays the mapped icon on all positions of intersections.

Example: Generic icon mapping for stop signs:

1. External descriptor points to the data structure for which the icon set
   is valid: `descriptor.target` = `signs.warning.WarningSign`.
2. `targetEnumValue` points to the enum value of the warning sign, in this
   case `STOP`.
3. The application displays the mapped icon on the position of any `WARNING_SIGN`
   attribute of type `STOP`.

Icons and icon sets are stored in the icon layer and can be
referenced by other layers in the same smart layer using
icon set references.

!*/

/** Map to relate icon set IDs to features and position attributes. */
struct GenericIconSetMap
{
  /** Module name for which the icon set map is valid. */
  ModuleName moduleName;

  /** Module version for which the icon set map is valid. */
  ModuleVersion moduleVersion;

  /** Number of elements in the icon set map. */
  varsize numElements;

  /** List of relations between an icon set an features or position attributes. */
  packed GenericIconSetMapElement elements[numElements];
};

/** Mapping of a icon set to a feature or position attribute. */
struct GenericIconSetMapElement
{
  /** Identifier of the icon set. */
  IconSetId id;

  /**
    * Extern descriptor of the feature or position attribute to which the icon
    * set is assigned.
    */
  ModuleExtern descriptor;

  /** Value of the corresponding enum value of a position attribute. */
  optional varint targetEnumValue;
};


/*!

## Types for 3D Display

<!--TODO: add general description how polygon meshes work.-->

!*/

/**
* Defines functions that calculate the required number of bits for
* colors, normals, and texture coordinates.
*/
struct Mesh3DRenderLayerHeader
{
  /** Color modes used by the layer. */
  UsedColorModes colorModes;

  /** Number of used color ids. */
  uint16 numColorIds if (hasColorPerVertex() == true);

  /** Set to `true` if texture coordinates are available. */
  bool hasNormals;

  /** Number of vertex normals. */
  varsize numNormals if hasNormals == true : numNormals > 0;

  /** Set to `true` if texture coordinates are available. */
  bool hasTextureCoords;

  /** Number of texture coordinates. */
  varsize numTextureCoords if hasTextureCoords : numTextureCoords > 0;

  /** Set to `true` if coordinates for an additional texture are available. */
  bool hasTextureCoordsAdditional;

  /** Number of texture coordinates. */
  varsize numTextureCoordsAdditional if hasTextureCoordsAdditional : numTextureCoordsAdditional > 0;

  /** Check if colors are used or not. */
  function bool usesColors()
  {
    return valueof(colorModes) > 0;
  }

  /** Checks if colors per vertex are used. */
  function bool hasColorPerVertex()
  {
    return (colorModes & UsedColorModes.COLOR_PER_VERTEX) == UsedColorModes.COLOR_PER_VERTEX;
  }

  /** Calculates the number of color IDs. */
  function uint16 numOfColorIds()
  {
    return (colorModes & UsedColorModes.COLOR_PER_VERTEX) == UsedColorModes.COLOR_PER_VERTEX ? numColorIds : 0;
  }

  /** Calculates the number of normals. */
  function varsize numOfNormals()
  {
    return hasNormals ? numNormals : 0;
  }

  /** Calculates the number of texture coordinates. */
  function varsize numOfTextureCoords()
  {
    return hasTextureCoords ? numTextureCoords : 0;
  }

  /** Calculates the number of additional texture coordinates. */
  function varsize numOfTextureCoordsAdditional()
  {
    return hasTextureCoordsAdditional ? numTextureCoordsAdditional : 0;
  }
};

/**
  * Type that can be used for procedural styling.
  * Instead of using colors and or textures, an application
  * can also evaluate the enum value assigned to each mesh and
  * apply application specific colors and effects.
  */
enum varuint16 DisplayMesh3dType
{
  /** Generic polygon mesh type. */
  MESH_3D,

  /** Generic type for buildings. */
  BUILDING,

  /** Private home or residential building. */
  PRIVATE_HOME_RESIDENTIAL,

  /** Commercial building, for example, a shop. */
  COMMERCIAL_BUILDING,

  /** Convention or exhibition center. */
  CONVENTION_EXHIBITION_CENTER,

  /** Retail building. */
  RETAIL_BUILDING,

  /** Shopping center. */
  SHOPPING_CENTER,

  /** Petrol or gas station. */
  PETROL_STATION,

  /** Restaurant. */
  RESTAURANT,

  /** Hotel or motel. */
  HOTEL_OR_MOTEL,

  /** Dam. */
  DAM,

  /** Lighthouse. */
  LIGHT_HOUSE,

  /** Building without walls. */
  NO_WALLS,

  /** Multi-storey building. */
  MULTI_STOREY,

  /** Other facility. */
  OTHER_FACILITY,

  /** Tower. */
  TOWER,

  /** Industrial building, for example, a factory. */
  INDUSTRIAL_BUILDING,

  /** Transportation building. */
  TRANSPORTATION_BUILDING,

  /** Generic type for public buildings. */
  PUBLIC_BUILDING,

  /** Police office. */
  POLICE_OFFICE,

  /** Fire department. */
  FIRE_DEPARTMENT,

  /** Post office. */
  POST_OFFICE,

  /** Theater. */
  THEATER,

  /** Museum. */
  MUSEUM,

  /** Library. */
  LIBRARY,

  /** Building of an institution. */
  INSTITUTION,

  /** Generic type for religious buildings. */
  RELIGIOUS_BUILDING,

  /** Church. */
  CHURCH,

  /** Synagogue. */
  SYNAGOGUE,

  /** Mosque. */
  MOSQUE,

  /** Temple. */
  TEMPLE,

  /** Shrine. */
  SHRINE,

  /** Abbey. */
  ABBEY,

  /** Monastery. */
  MONASTERY,

  /** Generic type for building grounds. */
  BUILDING_GROUND,

  /** Paved. */
  PAVED,

  /** Sand. */
  SAND,

  /** Memorial ground. */
  MEMORIAL_GROUND,

  /** Museum ground. */
  MUSEUM_GROUND,

  /** Hospital ground. */
  HOSPITAL_GROUND,

  /** Library ground. */
  LIBRARY_GROUND,

  /** School ground. */
  SCHOOL_GROUND,

  /** Stadium ground. */
  STADIUM_GROUND,

  /** Generic type for governmental administration offices. */
  GOVERNMENT_OFFICE,

  /** Government building. */
  GOVERNMENT_BUILDING,

  /** City hall. */
  CITY_HALL,

  /** Courthouse. */
  COURTHOUSE,

  /** Prison. */
  PRISON,

  /** Platform for underground or subway trains. */
  SUBWAY_PLATFORM,

  /** Underground or subway station. */
  SUBWAY_STATION,

  /** Simplified shape of an underground building. */
  SCHEMATIC_BUILDING,

  /**
    * Generic type for area features where most of the land is covered by
    * buildings, roads, and artificial surfaces.
    */
  URBAN,

  /** Bridge in urban area. */
  URBAN_BRIDGE,

  /** Carriageway divider in urban area. */
  URBAN_CARRIAGEWAY_DIVIDER,

  /** Railway bridge in urban area. */
  URBAN_RAILWAY_BRIDGE,

  /** Railway crossing in urban area. */
  URBAN_RAILWAY_CROSSING,

  /** Tunnel in urban area. */
  URBAN_TUNNEL,

  /**
    * Walkway in urban area.
    *
    * A walkway is not passable for vehicles. It is a part
    * of the road network and access is restricted to
    * pedestrians. A walkway has physical characteristics that
    * prevent vehicles from entering.
    */
  URBAN_WALKWAY,

  /**
    * Area where most of the land is covered by structures. Buildings,
    * roads, and artificial surfaces cover most of the ground.
    * Patches of vegetation and bare soil are the exception.
    */
  CONTINUOUS_URBAN,

  /**
    * Area where most of the land is covered by structures. Buildings,
    * roads, and artificial surfaces alternate with unconnected patches of
    * vegetation and bare soil that occupy a significant portion of the area.
    */
  DISCONTINUOUS_URBAN,

  /**
    * Generic type for area features with artificial land use.
    *
    * An artificial land use area has a surface that is modified by humans,
    * usually resulting from construction activities. The area serves a specific
    * purpose.
    */
  ARTIFICIAL,

  /**
    * Artificial surface and infrastructure that is associated with
    * transportation or an industrial activity.
    */
  INDUSTRIAL_COMMERCIAL_TRANSPORT,

  /**
    * Area where artificial surfaces (with concrete, asphalt, tarmacadam, or
    * stabilized, such as beaten earth) devoid of vegetation occupy most of
    * the ground. The area also contains buildings or patches of vegetation.
    */
  INDUSTRIAL_COMMERCIAL_UNITS,

  /** Military base. */
  MILITARY_BASE,

  /**
    * Generic type for area features with traffic, such as roads, parking
    * facilities, or railways.
    *
    * Includes associated installations, such as stations, platforms, or
    * embankments.
    */
  TRAFFIC,

  /** Pedestrian area. */
  TRAFFIC_PEDESTRIAN,

  /** Detailed road area, for example, to be used for detailed city models. */
  TRAFFIC_ROAD,

  /** Railway line. */
  TRAFFIC_RAILWAY,

  /** Generic type for parking facilities. */
  TRAFFIC_PARKING,

  /** Parking garage. */
  TRAFFIC_PARKING_GARAGE,

  /** Parking lot, for example, open-space parking. */
  TRAFFIC_PARKING_LOT,

  /** Car racetrack. */
  CAR_RACETRACK,

  /** Underpass. */
  UNDERPASS,

  /** Center. */
  CENTER,

  /** City map coverage. */
  CITY_MAP_COVERAGE,

  /** Periphery. */
  PERIPHERY,

  /** Postal district. */
  POSTAL_DISTRICT,

  /** Garden path. */
  GARDEN_PATH,

  /** Port and port-specific infrastructure, such as quays, dockyards, and marinas. */
  PORT_FACILITIES,

  /**
    * Airport and airport-specific installations, such as runways, buildings, and
    * associated grounds.
    */
  AIRPORT,

  /** Runway of an airport. */
  AIRPORT_RUNWAY,

  /** Surface resulting from excavation, mine dump, or landfill. */
  MINE_DUMP,

  /**
    * Mineral extraction site.
    *
    * Area with open-pit extraction of industrial minerals, such as sandpits or
    * quarries, or other minerals (open cast mines).
    *
    * Includes flooded gravel pits, except for river-bed extraction.
    */
  MINERAL_EXTRACTION_SITE,

  /** Landfill or mine dump site, industrial or public. */
  DUMP,

  /**
    * Space under construction or development, including soil or bedrock
    * excavations or earthworks.
    */
  CONSTRUCTION,

  /** Cultivated area with vegetation dedicated to any purpose. */
  VEGETATED,

  /**
    * Cultivated area with vegetation in an urban environment dedicated to
    * any purpose.
    */
  GREEN_URBAN,

  /** Park within a city. */
  PARK,

  /** Cemetery or graveyard. */
  CEMETERY,

  /** Generic type for sport and leisure areas. */
  SPORT_LEISURE,

  /** Sports complex. */
  SPORTS_COMPLEX,

  /** Amusement park. */
  AMUSEMENT_PARK,

  /** Arts center. */
  ARTS_CENTER,

  /** Camping site. */
  CAMPING_SITE,

  /** Golf course. */
  GOLF_COURSE,

  /** Hippodrome. */
  HIPPODROME,

  /** Holiday area. */
  HOLIDAY,

  /** Recreational area. */
  RECREATIONAL,

  /** Rest area. */
  REST_AREA,

  /** Sports hall. */
  SPORTS_HALL,

  /** Stadium. */
  STADIUM,

  /** Walking terrain. */
  WALKING_TERRAIN,

  /** Zoo. */
  ZOO,

  /** Ski area. */
  SKI,

  /** Swimming pool. */
  SWIMMING_POOL,

  /** Train or railway station. */
  RAILWAY_STATION,

  /** Ferry terminal, for example, for passengers and cars. */
  FERRY_TERMINAL,

  /** Bus station. */
  BUS_STATION,

  /** Harbor for yachts or small port. */
  MARINA,

  /**
    * Area with vegetation that is cultivated to grow crops or fruits, or used for
    * grazing.
    */
  AGRICULTURAL,

  /**
    * Cultivated area regularly ploughed and generally under a rotation
    * system.
    */
  ARABLE,

  /**
    * Area planted with cereals, legumes, fodder crops, root crops, or fallow.
    *
    * Includes flower and tree (nurseries) cultivation and vegetables,
    * whether open field, under plastic, or glass (includes market
    * gardening). Includes aromatic, medicinal, and culinary plants.
    *
    * Excludes permanent pastures.
    */
  NON_IRRIGATED,

  /**
    * Area planted with crops irrigated permanently and periodically, using a permanent
    * infrastructure like irrigation channels and a drainage network. Most of
    * these crops could not be cultivated without an artificial water
    * supply.
    *
    * Excludes sporadically irrigated land.
    */
  PERMANENTLY_IRRIGATED,

  /**
    * Area with rice cultivation that has flat surfaces with
    * irrigation channels. Surfaces are flooded regularly.
    */
  RICE_FIELD,

  /**
    * Area with crops that are not cultivated under a rotation system, which provides
    * repeated harvests. The crops occupy the land for a long period before it
    * is ploughed and replanted. Mainly plantations of woody crops.
    *
    * Excludes pastures, grazing lands, and forests.
    */
  PERMANENT_CROP,

  /**
    * Area planted with fruit trees or scrubs.
    *
    * Includes single or mixed fruit species, fruit trees associated with
    * permanently grassed surfaces. Includes chestnut and walnut groves.
    */
  TREE_BERRY_PLANTATION,

  /** Area planted with vines. */
  VINEYARD,

  /**
    * Areas planted with olive trees, including mixed occurrence of
    * olive trees and vines on the same parcel.
    */
  OLIVE_GROVES,

  /**
    * Partly or fully cultivated area with crops or pastures next to other
    * vegetation, such as trees.
    */
  HETEROGENEOUS,

  /**
    * Area with non-permanent crop, such as arable land or pasture, associated with
    * permanent crop on the same ground.
    */
  COMPLEX_CULTIVATION,

  /**
    * Area with non-permanent crop, such as arable land or pasture, associated with
    * permanent crop on the same ground.
    */
  ANNUAL_PERMANENT,

  /**
    * Area with annual crops of grazing land under the wooded cover of forestry
    * species.
    */
  AGRO_FORESTRY,

  /**
    * Area primarily occupied by agriculture, interspersed with
    * significant natural areas.
    */
  AGRICULTURAL_AND_NATURAL,

  /** Grassland area usually used for grazing. */
  PASTURE_RANGELAND,

  /**
    * Area with dense, predominantly graminoid grass cover of floral
    * composition, which is not under a rotation system.
    *
    * Mainly used for grazing, but the fodder may be harvested mechanically.
    * Includes areas with hedges (bocage).
    */
  PASTURE,

  /**
    * Spatially extensive area of natural grass cover, usually short
    * grass in semi-arid climates, on which ruminants are allowed to
    * graze freely.
    */
  RANGELAND,

  /** Annual crops of grazing land under the wooded cover of forestry species. */
  FOREST_SEMI_NATURAL,

  /**
    * Vegetation formation composed primarily of trees, including shrub
    * and bush undergrowth.
    */
  FOREST,

  /**
    * Vegetation formation composed primarily of trees, including
    * shrub and bush undergrowth, where broad-leaved species
    * predominate.
    */
  LEAVED_FOREST,

  /**
    * Vegetation formation composed primarily of trees, including
    * shrub and bush undergrowth, where coniferous species
    * predominate.
    */
  CONIFEROUS,

  /**
    * Vegetation formation composed primarily of trees, including
    * shrub and bush undergrowth, where broad-leaved and coniferous
    * species co-dominate.
    */
  MIXED_FOREST,

  /**
    * Bushy vegetation, generally with low cover and with no or scattered
    * trees.
    */
  SCRUB,

  /**
    * Low productivity grassland. Often situated in areas of rough
    * uneven ground. Frequently includes rocky areas, briars, and heath.
    */
  GRASSLAND,

  /**
    * Vegetation with low and closed cover, dominated by bushes,
    * shrubs and herbaceous plants, for example, heath, briars, broom, gorse,
    * or laburnum.
    */
  MOOR_HEATH,

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
  SCLEROPHYLLOUS,

  /**
    * Bushy or herbaceous vegetation with scattered trees. Can
    * represent either woodland degradation or forest
    * regeneration/colonization.
    */
  WOODLAND,

  /**
    * Area with little or no vegetation, such as sandy or rocky areas,
    * permanent ice or snow, or sparsely vegetated high altitude areas.
    */
  OPEN_SPACE,

  /** Scree, cliff, rock, and outcrop. */
  ROCK,

  /** Area covered by glaciers or permanent snowfields. */
  GLACIER,

  /** Areas affected by recent fires, still mainly black. */
  BURNT,

  /**
    * Area with sparse vegetation.
    *
    * Includes steppes, tundras, and badlands. Scattered high-altitude vegetation.
    */
  SPARSELY_VEGETATED,

  /**
    * Beach, dunes, and expanses of sand or pebbles in coastal or
    * continental locations.
    *
    * Includes beds of stream channels with torrential regime.
    */
  BEACH_DUNE,

  /** Inland or coastal area seasonally, tidally, or permanently waterlogged. */
  WETLAND,

  /**
    * Forested or non-forested area either partially, seasonally, or
    * permanently waterlogged. The water may be stagnant or circulating.
    */
  INLAND_WETLAND,

  /**
    * Low-lying land usually flooded in winter and more or less
    * saturated by water all year round.
    */
  INLAND_MARSH,

  /**
    * Peatland consisting mainly of decomposed moss and vegetable
    * matter. May or may not be exploited.
    */
  PEATBOG,

  /**
    * Wetland, including wooded seeps, shrub swamps, and floodplain forests,
    * dominated by shrubs or trees. May or may not be exploited.
    */
  FORESTED_WETLAND,

  /**
    * Non-wooded costal area either tidally, seasonally, or permanently
    * waterlogged with brackish or saline water.
    */
  COASTAL_WETLAND,

  /**
    * Non-wooded area either tidally, seasonally, or permanently
    * waterlogged with brackish or saline water.
    */
  SALT_MARSH,

  /**
    * Salt plants, active or in process of abandonment. Sections of
    * salt marsh exploited for the production of salt by evaporation.
    * Saline areas are clearly distinguishable from the rest of the marsh by
    * their segmentation and embankment system.
    */
  SALINE,

  /**
    * Generally unvegetated expanses of mud, sand, or rock between high-water
    * and low-water marks. On contour on maps.
    */
  INTERTIDAL_FLAT,

  /**
    * Island.
    *
    * Islands can be connected to other land by means of a bridge or tunnel or
    * be accessible by ferry.
    */
  ISLAND,

  /** Generic type for water area features. */
  WATER,

  /** Water bodies with no or only limited connection to the sea or ocean. */
  INLAND_WATER,

  /** Linear body of inland water of natural or semi-natural origin. */
  RIVER,

  /** Artificially constructed linear water body. */
  CANAL,

  /** Natural or artificial stretches of water, excluding reservoirs. */
  LAKE,

  /**
    * Constructed stretches of water or artificially contained
    * natural stretches of water, used primarily as water sources
    * for human populations or for agricultural purposes.
    */
  RESERVOIR,

  /** Low-lying area of land that a river runs through. */
  BASIN,

  /**
    * Valley, gully, or streambed that remains dry except
    * during the rainy season.
    */
  WADI,

  /** Sea, ocean, or other saline water bodies connected to them. */
  MARINE_WATER,

  /** Zone seaward of the lowest tide limit. */
  SEA_OCEAN,

  /**
    * Unvegetated stretches of salt or brackish waters separated from
    * the sea by a tongue of land or other similar topography. These
    * water bodies can be connected with the sea at limited points,
    * either permanently or for parts of the year only.
    */
  COASTAL_LAGOON,

  /** Mouth of a river within which the tide ebbs and flows. */
  ESTUARY,

  /** Generic type for administrative area features. */
  ADMIN,

  /** Country. */
  COUNTRY,

  /** Set of sub-countries. */
  SUB_COUNTRY_SET,

  /** Sub-country. */
  SUB_COUNTRY,

  /** County. */
  COUNTY,

  /** Municipality. */
  MUNICIPALITY,

  /** Municipality subdivision. */
  MUNICIPALITY_SUBDIVISION,

  /** Neighborhood. */
  NEIGHBORHOOD,

  /** City block. */
  CITY_BLOCK,

  /** Autonomous administrative area. */
  ADMIN_AUTONOMOUS,

  /** Native tribe reservation. */
  NATIVE_TRIBE_RESERVATION,

  /** Contour area. */
  CONTOUR,

  /** National park. */
  NATIONAL_PARK,

  /** Environmental zone. */
  ENVIRONMENTAL_ZONE,

  /** Toll zone. */
  TOLL_ZONE,

  /** Generic type for education buildings. */
  EDUCATION_BUILDING,

  /** School. */
  SCHOOL,

  /** University or college. */
  UNIVERSITY_OR_COLLEGE,

  /** Generic type for medical buildings. */
  MEDICAL_BUILDING,

  /** Hospital. */
  HOSPITAL,

  /** Emergency service. */
  EMERGENCY_SERVICE,

  /** Generic type for cultural buildings. */
  CULTURE_BUILDING,

  /** Historical building. */
  HISTORICAL_BUILDING,

  /** Tourist building. */
  TOURIST_BUILDING,

  /** Castle. */
  CASTLE,

  /** Fortress. */
  FORTRESS,

  /** Monument. */
  MONUMENT,

  /** Viewpoint. */
  VIEW,

  /** Watermill. */
  WATERMILL,

  /** Windmill. */
  WINDMILL,

  /** Building that is used for recreation and leisure activities. */
  LEISURE_BUILDING,

  /** Sport building, for example, gym or indoor swimming pool. */
  SPORT_BUILDING,

  /**
    * Area representing terrain.
    *
    * Can be used to indicate 3D surfaces that are just a terrain and do not
    * represent any specific area feature.
    */
  TERRAIN,

  /**
    * Pedestrian crossing on a road, for example, to be used for detailed
    * city models.
    */
  TRAFFIC_ROAD_PEDESTRIAN_CROSSING,

  /** Stop zone on a road. */
  TRAFFIC_ROAD_STOP_ZONE,

  /** Road decoration. */
  TRAFFIC_ROAD_DECORATION,

  /** Stop line on a road. */
  TRAFFIC_ROAD_STOP_LINE,

  /** Road restriction. */
  TRAFFIC_ROAD_RESTRICTION,

  /** Lane. */
  TRAFFIC_LANE,

  /** Lane marking. */
  TRAFFIC_LANE_MARKING,

  /** Lane separator marking. */
  TRAFFIC_LANE_SEPARATOR_MARKING,

  /** Bicycle lane. */
  TRAFFIC_LANE_BICYCLE,

  /** Bus lane. */
  TRAFFIC_LANE_BUS,

  /** Taxi lane. */
  TRAFFIC_LANE_TAXI,

  /** HOV lane. */
  TRAFFIC_LANE_HOV,

  /** Toll lane. */
  TRAFFIC_LANE_TOLL,

  /** Electronic toll collect lane. */
  TRAFFIC_LANE_TOLL_ETC,

  /** Parking row. */
  TRAFFIC_PARKING_ROW,

  /** Parking spot. */
  TRAFFIC_PARKING_SPOT,

};


/**
  * Vertex normal, defined in spherical coordinates. Length is always 1 by
  * definition.
  */
struct NormalSphere
{
   /**
    * Zenith angle from the negative z-axis. Each value = 1 degree
    * theta =   0: up
    * theta =  90: sideways (horizontal)
    * theta = 180: down
    */
   uint8 theta;

   /**
    * Azimuth angle from the negative y-axis; (clockwise; 256 = 360 degree)
    * phi =   0 (0x00): North
    * phi =  64 (0x40): East
    * phi = 128 (0x80): South
    * phi = 192 (0xc0): West
    */
   uint8 phi;
};

/** Defines render configuration aspect for one mesh and all its render groups. */
struct Mesh3DRenderConfiguration(Mesh3DRenderLayerHeader header)
{
   /** Color mode that is used by the mesh. */
   ColorMode colorMode;

   /** Set to `true` if the mesh references texture coordinates. */
   bool hasTextureCoords;

   /** Set to `true` if the mesh references additional texture coordinates. */
   bool hasTextureCoordsAdditional;

   /** Set to `true` if the mesh references normals. */
   bool hasNormals;

  /** Checks if colors per vertex are used. */
  function bool usesColorPerVertex()
  {
    return header.usesColors() && colorMode == ColorMode.COLOR_PER_VERTEX;
  }

  /** Checks if colors per vertex are used. */
  function bool usesColorPerRenderGroup()
  {
    return header.usesColors() && colorMode == ColorMode.COLOR_PER_RENDER_GROUP;
  }
};

/**
 * Defines all aspects that are needed to render a polygon mesh besides its
 * geometry.
 */
struct Mesh3DRenderData(PolyMesh3D mesh, Mesh3DRenderLayerHeader header)
{
  /** Applicable render configuration. */
  Mesh3DRenderConfiguration(header) mesh3DRenderConfiguration;

  /** First element of the normal index buffer entries for this mesh. */
  varsize startIndexNormals if mesh3DRenderConfiguration.hasNormals;

  /** First element of the color index buffer entries for this mesh. */
  varsize startIndexColors if mesh3DRenderConfiguration.usesColorPerVertex();

  /** First element of the texture index buffer entries for this mesh. */
  varsize startIndexTextureCoords if mesh3DRenderConfiguration.hasTextureCoords;

  /** First element of the texture additional index buffer entries for this mesh. */
  varsize startIndexTextureCoordsAdditional if mesh3DRenderConfiguration.hasTextureCoordsAdditional;

  /** Subsets or subparts of a mesh that need to be displayed differently. */
  RenderGroup(mesh, mesh3DRenderConfiguration) renderGroups[] : lengthof(renderGroups) > 0;
};

/** Supported version of (binary) glTF (also known as GLB) content. */
enum uint8 GltfVersion
{
  /**
    * glTF version 2.0.
    * See also: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#glb-file-format-specification.
    */
  GLTF_V20,
};

/**
 * Id of a used glTF extension.
 * See also: https://registry.khronos.org/glTF/specs/2.0/glTF-2.0.html#specifying-extensions
*/
subtype string GltfExtensionId;

/*!

### Render Groups

Render groups define parts of a mesh that are rendered with the same material
configuration. This allows to connect all render groups with the same material
in one step.

All vertex specific aspects like coordinates, texture coordinates, etc. are
defined using a list of indices.

!*/

/*
 * Index that is relative to the start index of the mesh within the relevant
 * index buffer of the layer.
 */
subtype IndexBufferEntry MeshRangeIndex;

/**
  * Render group. Defines parts of a mesh that are rendered with the same
  * material configuration.
  */
struct RenderGroup(PolyMesh3D mesh, Mesh3DRenderConfiguration config)
{
  /** Color of the complete face. */
  ColorId colorId if config.usesColorPerRenderGroup();

  /** Render group uses triangle strips. */
  RenderGroupTriangleStrip(mesh, config) triangleStrip
  if mesh.indexType == IndexType.TRIANGLE_STRIP;

  /** Render group uses triangles. */
  RenderGroupTriangles(mesh, config) triangles
  if mesh.indexType == IndexType.TRIANGLES;

  /** Material for standard texture. */
  Material material if config.hasTextureCoords == true;

  /** Material for extended standard texture. */
  Material materialAdditional if config.hasTextureCoordsAdditional == true;
 };

 /** Render group data that is based on triangle strips. */
 struct RenderGroupTriangleStrip(PolyMesh3D mesh, Mesh3DRenderConfiguration config)
 {
  /**
  * Count of used vertices or normals. Starting with 4 vertices, which equals
  * 2 triangles in a strip. Each value counts 2 vertices, which equals 2
  * triangles in a strip.
  */
  varuint16 consecutiveQuads;

  /**
  * Vertex array for describing a triangle strip. The count of triangles is
  * always even, starting with 2 triangles, which equals 4 vertices. Each
  * first triangle of the strip has to be ordered in counterclockwise winding (CCW).
  */
  MeshRangeIndex(maxMeshIndex()) vertIndices[numIndicesTriangleStrip()];

  /** Number of indices needed to define the rendering group. */
  function uint16 numIndicesTriangleStrip()
  {
  return (4 + 2 * consecutiveQuads);
  }

  /**
    * Maximum relative index within the range of indices that define the mesh
    * that the render group belongs to.
    */
  function varsize maxMeshIndex()
  {
  return mesh.numPositions;
  }
 };

 /** Render group data that is triangle based. */
 struct RenderGroupTriangles(PolyMesh3D mesh, Mesh3DRenderConfiguration config)
 {
  /** Count of used vertices or normals. Starting with 6 vertices (equals 2 triangles).  */
  varuint16 numberOfTriangles;

  /** Vertex indices. */
  MeshRangeIndex(maxMeshIndex())  vertIndices[numIndicesTriangle()];

  /** Number of indices needed to define the rendering group. */
  function uint16 numIndicesTriangle()
  {
  return (3 * numberOfTriangles);
  }

  /**
    * Maximum relative index within the range of indices that define the mesh
    * that the render group belongs to.
    */
  function varsize maxMeshIndex()
  {
  return mesh.numPositions;
  }
 };

/*!

### Material and Textures

Natural materials are represented by providing information about the applicable
colors, lighting properties, and textures.

Materials can refer to a texture using a texture reference.

!*/

/** Material. Results in an OpenGL states collection in a map viewer. */
struct Material
{
  /** Content of the material. */
  MaterialContent content;

  /**
    * Ambient color. Constant value that simulates indirect lighting from the
    * environment.
    */
  ColorId ambient
    if content.hasAmbientAndDiffuseColor == true;

  /**
    * Diffuse color. Describes the effect of a dim surface that emits light
    * evenly in all directions.
    */
  ColorId diffuse
    if content.hasAmbientAndDiffuseColor == true;

  /** Color of specular reflected light. */
  ColorId specular
    if content.hasSpecularAndShininessColor == true;

  /** Shininess. Defines how strong the material reflects specular light. */
  uint8 shininess
    if content.hasSpecularAndShininessColor == true;

  /** Reference to a texture. */
  TextureReference texture
    if content.usesTextures == true;
};


/** Defines the content of a material. */
struct MaterialContent
{
  /** Set to `true` if the material has ambient and diffuse colors. */
  bool hasAmbientAndDiffuseColor;

  /** Set to `true` if the material has specular and shininess colors. */
  bool hasSpecularAndShininessColor;

  /**
    * Set to `true` if the material uses transparency. Transparent materials
    * are rendered after opaque materials.
    */
  bool isTransparent;

  /**
    * Set to `true` if the material emits light. A light emitting texture contains
    * light sources, which affects the way that the texture is rendered.
    */
  bool isLightEmitting;

  /** Set to `true` if the material uses textures. */
  bool usesTextures;

  /** Defines how the texture coordinates are used. */
  TextureCoordsUsageType textureCoordUsageType if usesTextures;
};


/*!

Textures describe the surface structure of 3D objects, such as brick walls and
rough plaster. The texture information is stored as images, which are applied
to the surface of a 3D object based on the selected usage type of the texture
coordinates.

![Usage type of texture coordinates](assets/display_3D_texture_coords_type.png)

<!--TODO: Redo image-->

Different textures that are suitable for different conditions,
such as time of day, weather, or season, can be provided in an array.
Conditions of different types can be combined, for example, there can be one
sunny days in winter or a condition for summer nights. More specific conditions
are listed before less specific conditions, that is, sunny days in summer would
come before sunny days (without specifying a season).

A texture image can be split up into several sections. If the texture reference
points to a texture section, the texture coordinates in the body geometry are
relative to the rectangular area described in the texture section.
Texture sections are optional and can be used to improve texture filtering when
multiple textures are merged in one bitmap.


!*/

rule_group TextureRules
{
  /*!
  Distinct Condition Usage Type Combinations for Textures:

  The array in `textureConditionUsageType` shall not contain multiple entries
  for the same combination of bitmask values. For example, the array shall not
  contain two entries for sunny days in winter.
  !*/

  rule "display-76iga9";
};

/**
  * Usage type of texture coordinates that defines how texture coordinates are
  * used.
  */
enum bit:2 TextureCoordsUsageType
{
  /** Clamp. Texture coordinates are reduced to the range [0,1]. */
  CLAMP,

  /** Repeat. The integer part of the texture coordinates is ignored. */
  REPEAT,

  /**
    * Mirror: Vertical mirror if the integer part of x is odd;
    * horizontal mirror if the integer part of y is odd.
    */
  MIRROR
};

/**
  * Texture coordinates, which are mapped to the vertices of the body geometry of
  * the 3D object. The reference point for the local coordinate system (x = 0, y = 0)
  * is the bottom-left corner of the corresponding texture.
  */
struct TextureCoords
{
  float16 u;
  float16 v;
};

/** Texture. Can be used to render 3D objects. */
struct Texture
{
  /** ID of the texture. */
  TextureId textureId;

  /** Rendering type of a texture. */
  TextureRenderingUsageType textureRenderingUsageType;

  /** Format of the texture. */
  TextureFormat format;

  /**
    * Set to `true` if the texture is double-sided. Applies to textures that can
    * be rendered on both sides, for example, trees or fences.
    */
  bool doubleSided;

  /**
    * Defines under which conditions the texture is used, for example,
    * depending on the weather or time of day.
    */
  TextureConditionUsageType textureConditionUsageType[];

  /** Assigns texture data for the selected texture usage types. */
  TextureData textureData[] : lengthof(textureData) == lengthof(textureConditionUsageType);
};

/** Defines how the texture is used in the rendering pipeline. */
enum uint8 TextureRenderingUsageType
{
  /** The texture is the basic colored representation. */
  COLOR_TEXTURE,

  /** The texture is rendered using normal mapping. */
  NORMAL_MAP,

  /** The texture is rendered using bump mapping. */
  BUMP_MAP
};


/** File or container format used to store the texture data. */
enum bit:4 TextureFormat
{
  /** Portable Network Graphics format. */
  PNG,

  /** JPEG format. */
  JPG,

  /** DirectDraw Surface file format. */
  DDS,

  /** PVR container that supports PowerVR Texture Compression (PVRTC). */
  PVR,

  /**
   * Container format for compressed textures that is developed by the
   * Khronos Group. The format is supported by OpenGL ES 2.0.
   * Textures can be stored in one of the compressed formats such as
   * ETC, ETC2 or ASTC (Adaptive Scalable Texture Compression).
   */
  KTX,
};


/** Defines the conditions that the texture can be used for. */
bitmask varuint64 TextureConditionUsageType
{
  /** Textures that are only applied during daytime.*/
  TIME_DAY,

  /** Textures that are only applied during nighttime, such as neon signs and illuminated windows.*/
  TIME_NIGHT,

  /** Textures that are only applied during a rainy day.*/
  WEATHER_RAINY,

  /** Textures that are only applied during a cloudy day.*/
  WEATHER_CLOUDY,

  /** Textures that are only applied during a sunny day.*/
  WEATHER_SUNNY,

  /** Textures that are only applied during a snowy day.*/
  WEATHER_SNOWY,

  /** Textures that only apply during the winter season.*/
  SEASONAL_WINTER,

  /** Textures that only apply during the spring season.*/
  SEASONAL_SPRING,

  /** Textures that only apply during the summer season.*/
  SEASONAL_SUMMER,

  /** Textures that only apply during the fall season. */
  SEASONAL_FALL,
};

/** Texture data. */
struct TextureData
{
  /** Texture file in the specified texture format. */
  extern textureData;

  /**
    * Array of texture sections.
    * Filled if at least one of the texture sections is used in a pattern mode,
    * for example, a small portion of a brickwall that is repeated many times to
    * fill a large wall.
    * NULL if the texture has no sections.
    */
  TextureSectionArray TextureSectionArray;
};

/** Array of texture sections. */
struct TextureSectionArray
{
  /** Number of sections. */
  TextureSectionNumber numSections;

  /** List of texture sections. */
  TextureSection sections[numSections];
};

/**
  * Section of a texture. All values are given in pixels.
  * (0, 0) is the upper left corner of the image.
  */
struct TextureSection
{
  /** Upper bounding of the texture section. */
  uint16 top;

  /** Left bounding of the texture section. */
  uint16 left;

  /** Height of the texture section. */
  uint16 height;

  /** Width of the texture section. */
  uint16 width;
};

/*!

### Colors

!*/

/** ID of a color in a color palette. */
subtype varuint16 ColorId;

/** Color used in a 3D display style layer. */
struct Style3DColor
{
  /** Identifier of the color. */
  ColorId colorId;

  /** RGBA values of the color. */
  ColorRgba colorRgba;
};

/** Color mode that is used by a polygon mesh. */
enum bit:2 ColorMode
{
  /** No color is used. */
  NO_COLOR,

  /** One color per render group. */
  COLOR_PER_RENDER_GROUP,

  /** One color per vertex. */
  COLOR_PER_VERTEX,
};

/** Combination of color modes that are used/supported. */
bitmask bit:4 UsedColorModes
{
  /** One color per render group. */
  COLOR_PER_RENDER_GROUP,

  /** One color per vertex. */
  COLOR_PER_VERTEX,
};


/*!

### Assigning Polygon Meshes to Tiles

A polygon mesh is assigned to the tile that contains its center of gravity.
In the rare case that a mesh covers more than two tiles, perpendicular cuts
need to be applied at reasonable locations. These locations do not have to match
with tile borders.

## Level of Detail

The level of detail (LOD) is used in computer graphics to decrease complexity of
3D objects. The less important a detailed resolution is for the viewer, the
fewer details need to be displayed. NDS.Live does not define specific LODs.

Instead, a tile-based approach is used. Display tiles contain 3D display feature
layers with different levels of detail. The scale denominator settings of each
layer are used to determine the level of detail on that level.

That way, 3D objects from a different level are shown when users zoom in or out
of the map.

<!--TODO: Can objects from different 3D levels be combined in one zoom level?
TODO: are aggregation or downward/upward references at all interesting for 3D?
TODO: Is the same coordinate precision a requirement on different levels?-->

!*/

/*!

## Heightmaps

A heightmap is a grid of squares that stores height values for surface elevation
data. The values are stored in a grid layer containing one or more grids. The
application can render the height information to display a 3D view of the
terrain. Each grid in the grid layer is built by a defined number of height
points, starting at the south-west corner of the grid. All height points in the
grid have the same distance to the next height point.

The following figure shows a sample heightmap that is rendered as a 3D surface
or as using height columns.

![Heightmap rendered as 3D surface and height column diagram](assets/terrain_heightmap_rendered.png)

Heightmap grids are independent of each other, that is, no relation exists
between grids in the same grid layer as well as grids in other containers, such
as tiles. The grid dimension of adjacent grids can be different. It can be
necessary to create additional grid points in the application at runtime in case
the number of the cells of adjacent heightmap grids is smaller than the
number of cells of the current heightmap grid.

For heightmap grids that cover the extent of a tile, a buffer can be specified
around the actual dimensions of the tile. The buffer enables tiles to overlap
and applications to create a smooth terrain display, avoiding gaps or spikes
between the tiles. Using buffers is especially useful for applications that
process the terrain tile by tile, because it enables the application to
calculate the proper normals for shading at the tile borders.

!*/

/** Identifier of a heightmap grid. */
subtype varuint32 HeightmapGridId;

/**
  * Types for terrain optimization. Describes if the terrain is optimized for
  * usage with other data like city models.
  */
bitmask varuint32 TerrainOptimizationType
{
  /** Terrain is optimized for usage with 3D city models. */
  CITY_MODEL_FITTED,

  /** Terrain is optimized for usage with 3D junction views. */
  JUNCTION_VIEW_FITTED,
};

/*!

### Effects of Map Projection

With respect to the WGS 84 coordinate system, heightmap grids are quadratic. But
taking the real extent of the covered ground into account, heightmap grids are
nearly rectangular trapezoids whose width decreases towards the poles whereas
the height stays fixed. As a result, the shape of the raster images closer to
the poles is more quadratic and becomes more rectangular closer to the equator.
The number of pixels in the raster images can be equal or close to the next
higher power of 2 depending on the actual aspect ratio, for example, 128 x 256
pixels for aspect ratio 1:2, and 32 x 256 pixels for aspect ratio 1:8.
Alternatively, Web Mercator projection can be applied to heightmaps.
Web Mercator projection preserves angles and has distortion only towards the
poles. For this reason, many applications transform WGS 84 data to Web Mercator
for map display. Storing heightmaps directly with this projection enhances map
display performance for such applications.

!*/

/** Map projection method applied to heightmap data. */
subtype MapProjectionMethod HeightmapMapProjection;

/*!

### Interpolation of Heightmap Data

The map data compiler applies interpolation to fit the input data, such as NASA
SRTM, into the heightmap grid format, which typically has a lower resolution
than the source data. The application may need to apply interpolation to
determine the higher resolution of coordinate units based on the lower
resolution of height value grids. The application can perform this interpolation
if the ratio of coordinate unit to pixel is small, for example, 1:10. In
addition, the application may need to interpolate at the borders between two
grids to avoid gaps or spikes, especially if interpolation was not done by the
compiler.

The following figure illustrates height map interpolation.

![Interpolation of heightmaps](assets/terrain_heightmaps_interpolation.png)

!*/

/*!

## Batched Dynamic Adaptive Meshes (BDAM)

Batched Dynamic Adaptive Meshes (BDAM) are used for out-of-core rendering of
fully scalable data for large digital terrain databases.
The geometry data is stored in so-called BDAM patches organized in a pair of
binary trees. A BDAM patch is a polygon primitive modeled by means of a compound
of right-angled, isosceles triangles. Within the BDAM patch, the triangles are
organized in TINs (Triangulated Irregular Network), and the polygons are organized
in triangle strips.

For general information on BDAM, refer to
­http://vcg.isti.cnr.it/publications/papers/bdam.pdf.


### BDAM Surfaces

A BDAM layer stores BDAM patches in regular grids with square cells called BDAM
surfaces. Each BDAM surface grid contains a number of BDAM surfaces of the same
size. Different BDAM surface grids can have different cell sizes, allowing to
provide different levels of detail. Each BDAM surface in a surface grid contains
a fixed number of BDAM patches.

Because the BDAM patches are triangular and are matched to a grid of square
surfaces, two BDAM patches fit exactly into such a square.

!*/


/** Grid containing BDAM surfaces. */
struct BdamSurfaceGrid(BdamLayerHeader header)
{
  /** South-west anchor position of the grid. */
  Position2D(header.shiftXY) southWestCorner;

  /** Size of all cells in any surface of the grid. */
  SurfaceGridCellSize surfaceGridCellSize;

  /** Number of rows in the grid. */
  NumGridCells numRows;

  /** Number of columns in the grid. */
  NumGridCells numColumns;

  /** Space error of the long side on BDAM level 1. */
  SpaceError longSideErrorL1;

  /**
   * Space error of the short side on BDAM level 1 and the long side
   * on BDAM level 2.
   */
  SpaceError shortSideErrorL1;

  /** Space error of the short side on BDAM level 2. */
  SpaceError shortSideErrorL2;

  /** Size of all cells in any vertex grid of any BDAM surface. */
  VertexGridCellSize vertexGridCellSize;

  /** All surfaces contained in the grid. */
  BdamSurface(header, surfaceGridCellSize, vertexGridCellSize) surfaces[numRows*numColumns];
};

/** Size of a grid cell in a BDAM surface grid. */
subtype GridCellSize SurfaceGridCellSize;

/** Space error in cm. */
subtype varsize SpaceError;

/** Header of the BDAM layer. */
struct BdamLayerHeader
{
  /** Coordinate shift for longitude and latitude values. */
  CoordShift shiftXY;

  /** Coordinate shift for elevation values. */
  CoordShift shiftZ;

  /** Whether the surface uses a texture or not. */
  bool hasTexture;

};


/*!

### NDS Levels and BDAM Levels

To provide BDAM data with different levels of detail, more-detailed NDS levels have
smaller BDAM surface grid sizes than less-detailed levels.
In addition, the surfaces in each surface grid on one NDS level contain BDAM
patches with two different levels of detail, also called BDAM levels.

Each surface in a surface grid is covered by exactly two BDAM patches on
BDAM level 1 and four BDAM patches on BDAM level 2. Each BDAM patch on the next
more-detailed BDAM level is half the size of the BDAM patch of the previous BDAM level.

Two subsequent changes of BDAM levels correspond to one change of NDS levels.

The following figure illustrates how the BDAM patches are cut on the different
levels. On NDS level 13, there are two surfaces that each contain two BDAM
patches on BDAM level 1 and 4 BDAM patches on BDAM level 2. On level 14, this
number is quadrupled, and so on.

![BDAM patches on different levels](assets/terrain_bdam_levels.png)

The BDAM patches in a BDAM surface are addressed via indices. To illustrate this,
alternating BDAM patches are labeled as black and white in the following.
The reference point for all coordinates stored in BDAM
patches is the center point of the NDS tile assigned to the respective BDAM patch.

The BDAM patches are assigned to the BDAM surface as follows:

- On all levels, the south-west tile is regarded as a black tile.
- The horizontal and vertical neighbors of a black tile are regarded as white
  tiles. That way, a pattern similar to a chess board is created.
- On BDAM level 1, the BDAM patches are matched as follows to a tile:
    - Black tiles: Cut tile diagonally from bottom left to top right, like a slash.
      The patches are indexed from north-west to south-east.
    - White tiles: Cut tile diagonally from top left to bottom right, like a backslash.
      The patches are indexed from south-west to north-east.
- On BDAM level 2, the BDAM patches are matched as follows to a tile:
    - Cut tile diagonally in both directions, resulting in four BDAM patches.
      This is called an envelope split or X split.
    - Black and white tiles are indexed in the following order:
      west > south > east > north.

The following figure shows in which order the BDAM patches are indexed:

![Splitting rules for BDAM patches](assets/terrain_bdam_splitting_rules.png)

!*/

rule_group BdamTileRules
{
  /*!
  BDAM Surface Grid Size in Tile-Based Layers:

  If the BDAM layers are provided via smart layer tiles, then each BDAM surface
  fully covers the requested tile.
  !*/

  rule "display-q3m7r3";
};

/** BDAM surface containing six BDAM patches. */
struct BdamSurface(BdamLayerHeader header, SurfaceGridCellSize surfaceCellSize,
                   VertexGridCellSize vertexCellSize)
{
  /**
    * Set to `true` if the regular vertex grid is used. Set to `false` if only
    * off-grid vertices are used.
    */
  bool hasRegularVertexGrid;

  /** Vertices defined by a regular vertex grid. */
  packed RegularGridVertex(header.shiftZ, header.hasTexture)
         regularVertexGrid[numGridVertices()] if hasRegularVertexGrid == true;

  /**
    * Array of off-grid vertices.
    * If a regular vertex grid is used, the array contains only the vertices
    * that are not located on the nodes of the regular vertex grid. Else, the array
    * contains all vertices.
    */
  packed Position3D(header.shiftXY, header.shiftZ) vertices[];

  /** Array of vertex normals. */
  packed NormalSphere normals[lengthof(vertices)];

  /** Array of vertex-specific texture coordinates. */
  packed TextureCoords textureCoordinates[lengthof(vertices)] if header.hasTexture == true;

  /**
    * Binary tree of TINs describing the surface in form of
    * rendering objects, following the BDAM patch split schema
    * and uses two levels.
    */
  BdamSurfaceTin(numbits(numVertices())) surfaceTins[6];

  /** Returns the number of vertices defined by the regular vertex grid. */
  function varsize numGridVertices()
  {
    return hasRegularVertexGrid ?
           (
              (surfaceCellSize  / vertexCellSize) *
              (surfaceCellSize  / vertexCellSize)
           ) : 0;
  }

  /** Number of all vertices used by the BDAM surface. */
  function varsize numVertices()
  {
    return lengthof(vertices) + numGridVertices();
  }

};

/*!

### Combining Multiple Levels of Detail for BDAM

To display large objects correctly and to support high-performance rendering, it
is necessary to have multiple levels of detail (LOD) at the same time.
BDAM patches can be combined in different sizes and, thus, combine different
LODs in a single map display view. It is important that the
different LODs match on their respective boundaries and do not have holes or other
graphic artifacts. This method is called continuous LOD.

The following figure shows the advantage of continuous LODs instead of discrete
LODs, where the entire object is displayed with the same level of detail.

![Continuous and discrete levels of detail](assets/terrain_bdam_lod_comparison.png)

To avoid holes in the terrain model when combining BDAM patches from different LODs,
space errors are stored for the sides of BDAM patches.
One space error is set for the long side of the BDAM patch and another space error
is set for the two short sides. On the same BDAM level, the long side of matching
BDAM patches have the same space error, and the short sides of a BDAM patch have the
same space error as the corresponding short sides of the adjacent BDAM patches.

BDAM patches from different BDAM levels can be combined based on the following:

- The space error of the two short sides of a BDAM patch equals the space error
  of the corresponding long side of the next more-detailed BDAM level.
- The space error of the long side of a BDAM patch equals the space error of one
  of the short sides of the BDAM patch on the next less-detailed BDAM level.

This is illustrated in the following figure:

- Blue: The long side of the BDAM patch with the high LOD equals the short
  side of the BDAM patch with the medium LOD.
- Orange: The long side of the BDAM patch with the medium LOD equals the
  short side of the BDAM patch with the low LOD.

![Mixing BDAM levels of detail](assets/terrain_bdam_mixing_lods.png)

!*/

rule_group MixingBdamPatchesRules
{
  /*!
  Matching Space Errors of BDAM Patches:

  The space error of the long side of a BDAM patch on any BDAM level N shall
  match the following: On BDAM level N, it matches the long side of
  another BDAM patch. On BDAM level N-1, it matches one of the short sides of
  another BDAM patch.
  The space error of the short side of a BDAM patch on any BDAM level N shall
  match the following: On BDAM level N, it matches the short side of
  another BDAM patch. On BDAM level N+1, it matches the long side of
  another BDAM patch.
  !*/

  rule "display-yy28z8-I";
};


/*!

### Content of a BDAM Patch

Each BDAM patch contains a TIN (triangulated irregular network) mesh that covers
the entire surface of the BDAM patch. A TIN is a vertex-based representation of
the physical terrain surface. It is made up of lines and irregularly distributed
nodes with three-dimensional coordinates that are arranged in a network
of non-overlapping triangles. The following figure illustrates the TIN mesh in a
BDAM patch.

![BDAM patch surface covered by a TIN mesh](assets/terrain_bdam_patch_tin_mesh.png)

A TIN is made up of triangles to support an accurate terrain representation. The
TIN can have a variation in density. The following figure illustrates a TIN with
low density on the left side and high density on the right side.

![TIN with variation in density](assets/terrain_bdam_regulargrid_tin_details.png)

High density can be caused by complex terrain, for example, a small hill.
Lower density can be caused by flat terrain, for example, a lake or a flat plain.

!*/

rule_group BdamSurfaceTinAndVertexRules
{
  /*!
  Value in `RegularGridVertex` is 0 for All Unused Regular Vertices:

  For all unused vertices of the regular vertex grid, the compiler shall set the
  corresponding values in `RegularGridVertex` to 0.
  !*/

  rule "display-34j249";

  /*!
  Indices in `BdamSurfaceTin` and `RenderSurfacePart`:

  All reference to vertices in `BdamSurfaceTin.indices` and
  `RenderSurfacePart.indices` shall follow the rule that the indices from the
  array of the regular vertex grid are counted first, followed by the indices from the
  array of off-grid vertices.
  !*/

  rule "display-6oyhng";

  /*!
  Only Triangle Strips in `BdamSurfaceTin` and `RenderSurfacePart`:

  The index arrays in `BdamSurfaceTin` and `RenderSurfacePart` shall only represent
  triangle strips, not triangle fans or single triangles. Triangles in
  triangle strips are oriented counterclockwise.
  !*/

  rule "display-5dkyg2";
};

/** Triangulated irregular network (TIN) covering one BDAM patch. */
struct BdamSurfaceTin(bit:5 numIndexBits)
{
  /**
   * Array of logical objects, for example, one street, one forest, one building etc.
   * Each logical object can reference several geometries to render certain
   * details in extra calls, for example, a building made up of several parts.
   */
  RenderSurface(numIndexBits) renderSurfaces[];

  /**
   * Index array used to render the complete area only with vertices and normals.
   * Texture coordinates are created by OGL.
   * The whole area can then be rendered using a single glDrawElements-call.
   */
   packed bit<numIndexBits+1> indices[];
};

/**
  * Render object represents one logical object within a BDAM surface.
  * One such object may consist of several geometries that can be
  * drawn with one render call each.
  */
struct RenderSurface(bit:5 numIndexBits)
{
  /**
    * Display area type of the render surface. It is needed to represent
    * area features of a specific type in 3D.
    */
  DisplayAreaType areaType;

  /** Array of render surface parts. */
  RenderSurfacePart(numIndexBits) renderSurfaceParts[]: lengthof(renderSurfaceParts) > 0;
};

/**
 * Render surface part.
 *
 * A render object part is a bunch of geometry that can be rendered in one draw call
 * as all parameters/attributes result in on set of drawing states.
 * The vertices are stored directly in the layer and in a layout that results in
 * one call to `glDrawArrays`. There is no index vector needed.
 */
struct RenderSurfacePart(bit:5 numIndexBits)
{
  /** Material. */
  optional Material material;

align(8):

  /**
    * Index array used to render the complete area only with vertices and normals.
    * Texture coordinates are created by OGL.
    * The whole area can then be rendered using a single glDrawElements-call.
    */
  packed bit<numIndexBits+1> indices[];
};

/*!

### Regular Vertex Grids and Off-Grid Vertices

BDAM surfaces can use vertices located on regular vertex grids and off-grid
vertices. Regular vertices and off-grid vertices can be combined
within one surface.

The regular are located on the nodes of the regular vertex grid. To
save space, the regular vertices are stored in a compact way, where longitude
and latitude values can be derived from the grid itself and only elevation,
normals, and texture coordinates are stored explicitly for each vertex.

The position of regular vertices in a surface is defined as follows:

- row = index div `vertexGridCellSize`
- col = index mod `vertexGridCellSize`

Off-grid vertices are not located on the nodes of the regular vertex grid.
They are explicitly stored in the content of the terrain surface and defined by
longitude, latitude, and elevation coordinates. Therefore, regular
vertex grids make storing BDAM data more efficient.

The index array within a BDAM surface TIN or a render surface part within a TIN
reference the vertices from both the regular vertex grid and the array of
off-grid vertices. First, all regular vertices are counted and then all off-grid
vertices: If the regular vertex grid has N entries, then the first entry in the
array of off-grid vertices is addressed by the index N.

The following figure illustrates how the indexing works. The array of the regular
vertex grid contains 25 vertices. Therefore, the first vertex in the array of off-grid
vertices is addressed with index 25.

![Addressing regular vertices and off-grid vertices](assets/terrain_bdam_regulargrid_tin_index.png)

Some regular vertices are not relevant for rendering because they are not
referenced by the TIN. However, these vertices are required to guarantee a
correct index in the regular vertex grid.

!*/

/** Vertex in a regular vertex grid. */
struct RegularGridVertex(CoordShift shiftZ, bool hasTexture)
{
  /** Elevation in cm above/below WGS 84 reference ellipsoid. */
  int<31-shiftZ + 1> elevation;

  /** Normal vector. */
  NormalSphere normal;

  /** Texture coordinate. */
  TextureCoords textureCoord if hasTexture == true;
};

/** Size of a grid cell in a BDAM vertex grid. */
subtype GridCellSize VertexGridCellSize;

/*!

## Orthoimages

Orthoimages are produced from aerial images or satellite photographs.

The orthoimage configuration specifies the format and source of an orthoimage
as well as conditions that an orthoimage can be used in, for example, specific
time or weather conditions.

!*/

/**
  * Orthoimage configuration that defines the format and content of the
  * orthoimage.
  */
struct OrthoImageConfig
{
  /** Format of the orthoimage. */
  OrthoImageFormat format;

  /** Content type of the orthoimage. */
  OrthoImageContentType sourceType;

  /**
    * Defines under which conditions the orthoimage is used, for example,
    * depending on the weather or time of day.
    */
  OrthoImageConditionUsageType usageType;
};

/** Content type of the orthoimage. Defines the source of the orthoimage. */
enum bit:4 OrthoImageContentType
{
  /** Orthoimage is based on an aerial image. */
  AERIAL,

  /** Orthoimage is based on a satellite image. */
  SATELLITE
};

/** Format of the orthoimage. */
subtype TextureFormat OrthoImageFormat;

/** Defines the conditions that the orthoimage can be used in. */
subtype TextureConditionUsageType OrthoImageConditionUsageType;