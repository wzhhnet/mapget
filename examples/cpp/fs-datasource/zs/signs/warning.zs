/*!

# Warning Signs

This package defines warning signs, including supplementary warning signs and
variable warning signs.

**Dependencies**

!*/

package signs.warning;

/*!

Warning signs indicate a hazard, obstacle, or condition that a driver may not be
aware of.

Attribute name                         |Vienna Convention code|Example 1                                                                                                          |Example 2
---------------------------------------|----------------------|-------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------
GENERAL_HAZARD                         |A32a                  |![General hazard (Germany).](assets/warning_generalhazard.png)                                               |![General hazard (Poland).](assets/warning_generalhazard_pl.png)
PASS_LEFT_OR_RIGHT_OF_OBSTACLE         |none                  |![Pass left or right of obstacle(USA).](assets/warning_passleftright.png)                                    |![Divided highway (USA).](assets/warning_passleftright_highway.png)
PASS_LEFT_OF_OBSTACLE                  |D2                    |![Pass left of obstacle (Germany).](assets/warning_passleft.png)                                             |![Pass left of obstacle (China).](assets/warning_passleft_china.png)
PASS_RIGHT_OF_OBSTACLE                 |D2                    |![Pass right of obstacle (Germany).](assets/warning_passright.png)                                           |![Pass right of obstacle (China).](assets/warning_passright_china.png)
CATTLE                                 |A15a                  |![Cattle crossing (Germany).](assets/warning_cattle_de.png)                                                  |![Cattle crossing (China).](assets/warning_cattle_china.png)
ANIMALS                                |A15b                  |![Animals crossing (Germany).](assets/warning_animals_de.png)                                                |![Animals crossing (Australia).](assets/warning_animals_australia.png)
ROAD_WORKS                             |A16                   |![Road works ahead (Germany).](assets/warning_roadworks_de.png)                                              |![Road works ahead (Canada).](assets/warning_roadworks_canada.png)
LIVING_STREET_ENTRY                    |E17a                  |![Living street entry (Germany).](assets/warning_residentalentry_de.png)                                     |
LIVING_STREET_EXIT                     |E17b                  |![Living street exit (Germany).](assets/warning_residentalexit_de.png)                                       |
CURVE_RIGHT                            |A1a                   |![Dangerous curve to the right (India).](assets/warning_curveright_india.png)                                |![Dangerous curve to the right (Canada).](assets/warning_curveright_canada.png)
CURVE_LEFT                             |A1b                   |![Dangerous curve to the left (Austria).](assets/warning_curveleft_au.png)                                   |![Dangerous curve to the left (USA).](assets/warning_curveleft_us.png)
TRUCK_ROLLOVER                         |                      |![Danger of trucks rolling over (USA).](assets/warning_truckrollover_us.png)                                 |![Danger of trucks rolling over (New Zealand).](assets/warning_truckrollover_nz.png)
FOG_AREA                               |                      |![Fog area (USA).](assets/warning_fogarea_us.png)                                                            |
CURVE_RIGHT_THEN_LEFT                  |A1d                   |![Series of curves, the first one to the right (USA).](assets/warning_curverightleft_us.png)                 |
CURVE_LEFT_THEN_RIGHT                  |A1c                   |![Series of curves, the first one to the left (USA).](assets/warning_curveleftright_us.png)                  |
TIRE_CHAINS_MANDATORY                  |                      |![Tire chains required (Switzerland).](assets/warning_tirechainsmandatory_ch.png)                            |![Tire chains required (Chile).](assets/warning_tirechainsmandatory_chile.png)
HIJACKING_HOTSPOT                      |none                  |![Hijacking hotspot (South Africa).](assets/warning_hi-jack_za.png)                                          |
CURVY_ROAD                             |none                  |![Series of curves (USA).](assets/warning_curvyroad.png)                                                     |![Series of curves (China).](assets/warning_windingroad-china.png)
REVERSE_BENDS                          |                      |![Reverse bends (China).](assets/warning_reversebends_chn.png)                                               |
ROUNDABOUT_AHEAD                       |                      |![Roundabout ahead.](assets/warning_roundabout_ahead.png)                                                    |
NO_OVERTAKING_FOR_TRUCKS               |C13b                  |![Start of a no-passing zone for trucks (Germany).](assets/warning_noovertakingtrucks.png)                   |
NO_OVERTAKING_FOR_TRUCKS_END           |C17d                  |![End of a no-passing zone for trucks (Germany).](assets/warning_noovertakingtrucksend.png)                  |
DANGEROUS_INTERSECTION                 |                      |![Dangerous intersection (Germany).](assets/warning_dangerousintersection_de.png)                            |![Dangerous intersection (Australia).](assets/warning_dangerousintersection_aus.png)
OVERPASS_AHEAD                         |                      |                                                                                                                   |
TUNNEL                                 |E11a                  |![Tunnel ahead (Germany).](assets/warning_tunnel_de.png)                                                     |![Tunnel ahead (Sweden).](assets/warning_tunnel_sw.png)
FERRY_TERMINAL                         |none                  |![Ferry terminal(China).](assets/warning_ferry_china.png)                                                    |
NARROW_BRIDGE                          |none                  |![Narrow bridge (India).](assets/warning_narrowbridge_india.png)                                             |![Narrow bridge (USA).](assets/warning_narrowbridge_us.png)
NO_IDLING                              |none                  |![No idling (Germany).](assets/warning_noidling_de.png)                                                      |![No idling (USA).](assets/warning_noidling_us.png)
HUMPBACK_BRIDGE                        |none                  |![Humpback bridge (China).](assets/warning_humpbackbridge_china.png)                                         |
EMBANKMENT_ON_THE_RIGHT                |A6                    |![Embankment on the right (Germany).](assets/warning_embankmentright.png)                                    |![Embankment on the right (China).](assets/warning_embankmentright_china.png)
EMBANKMENT_ON_THE_LEFT                 |none                  |![Embankment on the left (China).](assets/warning_embankmentleft_china.png)                                  |
LIGHT_SIGNALS                          |A17                   |![Light signals ahead (Germany).](assets/warning_lightsignal_de.png)                                         |![Light signals ahead (Japan).](assets/warning_lightsignals_japan.png)
YIELD                                  |B1                    |![Give way (Germany).](assets/warning_yield.png)                                                             |
STOP                                   |B2                    |![Stop (Germany).](assets/warning_stop.png)                                                                  |
PRIORITY_ROAD                          |B3                    |![Priority road (Germany).](assets/warning_priorityroad.png)                                                 |
INTERSECTION                           |A18                   |![Intersection ahead (USA).](assets/warning_intersection_us.png)                                             |![Intersection ahead (Japan).](assets/warning_intersection_japan.png)
CROSSING_WITH_PRIORITY_OVER_MINOR_ROAD |A19                   |![Crossing with priority (Germany).](assets/warning_intersection.png)                                        |![Crossing with priority (Sweden).](assets/warning_intersectionpriority_sv.png)
CROSSING_WITH_PRIORITY_TO_THE_RIGHT    |                      |![Crossing with priority to the right (UK).](assets/warning_crossing_with_priority_to_the_right_uk.png)      |
BRANCH_TO_THE_RIGHT                    |D1a                   |![Branch to the right (Germany).](assets/warning_branchright.png)                                            |
BRANCH_TO_THE_LEFT                     |D1a                   |![Branch to the left (Germany).](assets/warning_branchleft.png)                                              |
CARRIAGEWAY_NARROWS                    |A4a                   |![Carriageway narrows (Germany).](assets/warning_roadnarrows_de.png)                                         |![Carriageway narrows (Canada).](assets/warning_roadnarrows_ca.png)
CARRIAGEWAY_NARROWS_RIGHT              |A4b                   |![Carriageway narrows on the right (Germany).](assets/warning_roadnarrowsright_de.png)                       |![Carriageway narrows on the right (USA).](assets/warning_roadnarrowsright_us.png)
CARRIAGEWAY_NARROWS_LEFT               |A4b                   |![Carriageway narrows on the left (Germany).](assets/warning_roadnarrowsleft_de.png)                         |
LANE_MERGE_FROM_LEFT                   |G12, A19c             |![Lane merge from the left (Germany).](assets/warning_lanemergeleft_de.png)                                  |
LANE_MERGE_FROM_RIGHT                  |G12, A19c             |![Lane merge from the right (Germany).](assets/warning_lanemergeright_de.png)                                |![Lane merge from the right (USA).](assets/warning_lanemergeright_us.png)
LANE_MERGE_CENTER                      |G12                   |![Lanes merge in the center (UK).](assets/warning_lanemergecenter_uk.png)                                    |
NO_OVERTAKING                          |C13aa, a              |![Start of a no-passing zone (Germany).](assets/warning_noovertaking_de.png)                                 |
NO_OVERTAKING_END                      |C17c                  |![End of a no-passing zone (Germany).](assets/warning_noovertakingend_de.png)                                |
PROTECTED_PASSING_END                  |none                  |![End of protected passing (Germany).](assets/warning_lanemergeright_de.png)                                 |
PROTECTED_PASSING                      |none                  |![Start of protected passing (Germany).](assets/warning_protectedpassing_de.png)                             |
PEDESTRIANS                            |none                  |![Beware of pedestrians (Germany).](assets/warning_pedestrians_de.png)                                       |![Beware of pedestrians (USA).](assets/warning_pedestrians_us.png)
PEDESTRIAN_CROSSING                    |A12                   |![Pedestrian crossing (Germany).](assets/warning_pedestrianscrossing_de.png)                                 |
CHILDREN                               |A13                   |![Beware of children (Germany).](assets/warning_children_de.png)                                             |
SCHOOL_ZONE                            |none                  |![School in the area (USA).](assets/warning_school_us.png)                                                   |![School in the area (India).](assets/warning_school_india.png)
CYCLISTS                               |A14                   |![Beware of cyclists (Germany).](assets/warning_cyclists.png)                                                |
TWO_WAY_TRAFFIC                        |A23                   |![Beware of two-way traffic (Germany).](assets/warning_twowaytraffic_de.png)                                 |![Beware of two-way traffic (USA).](assets/warning_twowaytraffic_us.png)
RAILROAD_CROSSING_WITH_GATES           |A25                   |![Protected railway crossing ahead (Germany).](assets/warning_railroadgates_de.png)                          |
RAILROAD_CROSSING_WITHOUT_GATES        |A26                   |![Unprotected railway crossing ahead (Sweden).](assets/warning_railroadunguarded_sv.png)                     |![Unprotected railway crossing ahead (Germany).](assets/warning_railroadunguarded_de.png)
RAILROAD_CROSSING                      |A28                   |![Railway crossing ahead (UK).](assets/warning_railroadcrossing.png)                                         |
TRAMWAY_CROSSING                       |A27                   |![Intersection with tramway line (Finland).](assets/warning_tramcrossing_fi.png)                             |
FALLING_ROCKS                          |                      |![Falling rocks (USA).](assets/warning_falling_rocks.png)                                                    |
FALLING_ROCKS_ON_THE_LEFT              |none                  |![Falling rocks on the left (Germany).](assets/warning_fallingrocks_left_de.png)                             |![Falling rocks on the left (China).](assets/warning_fallingrocksleft_china.png)
FALLING_ROCKS_ON_THE_RIGHT             |A11                   |![Falling rocks on the right (Germany).](assets/warning_fallingrocks_de.png)                                 |![Falling rocks on the right (China).](assets/warning_fallingrocksright_china.png)
STEEP_DROP_ON_LEFT                     |none                  |![Steep drop on the left (China).](assets/warning_steepdropleft_china.png)                                   |
STEEP_DROP_ON_RIGHT                    |none                  |![Steep drop on the right (China).](assets/warning_steepdropright_china.png)                                 |
SLIPPERY_ROAD                          |A9                    |![Slippery road (USA).](assets/warning_slipperyroad_us.png)                                                  |![Slippery road (Germany).](assets/warning_slipperyroad_de.png)
STEEP_INCLINE                          |A3                    |![Steep incline (Germany).](assets/warning_steepincline_de.png)                                              |![Steep incline (China).](assets/warning_steepincline_china.png)
STEEP_DECLINE                          |A2                    |![Steep decline (Germany).](assets/warning_steepdecline_de.png)                                              |
UNEVEN_ROAD                            |A7a                   |![Uneven road (Germany).](assets/warning_unevenroad_de.png)                                                  |
BUMP                                   |A7b                   |![Bump ahead (USA).](assets/warning_bumps_us.png)                                                            |
DIP                                    |A7c                   |![Dip ahead (USA).](assets/warning_dip_us.png)                                                               |
ROAD_FLOODS                            |none                  |![Beware of road floods (China).](assets/warning_standingwater_china.png)                                    |
ICY_ROAD                               |H9                    |![Beware of icy road (Germany).](assets/warning_icyroad_de.png)                                              |
WIND                                   |A31                   |![Beware of heavy cross winds or side winds (Germany).](assets/warning_wind_de.png)                          |
TRAFFIC_CONGESTION                     |A24                   |![Traffic congestion (Germany).](assets/warning_trafficcongestion_de.png)                                    |
HIGH_ACCIDENT_AREA                     |none                  |![High accident area (Germany).](assets/warning_highaccidentarea_de.png)                                     |![High accident area (China).](assets/warning_highaccidentarea_china.png)
CITY_ENTRY                             |E7                    |![Entry of city (Germany).](assets/warning_cityentry_de.png)                                                 |
AUDIBLE_WARNING                        |                      |![Audible warning (India).](assets/warning_audiablewarning_india.png)                                        |
END_OF_ALL_RESTRICTIONS                |C17a                  |![End of all restrictions (Germany).](assets/warning_endofallrestrictions.png)                               |
PRIORITY_OVER_ONCOMING                 |B6                    |![Priority over oncoming traffic (Germany).](assets/warning_priorityoveroncoming_de.png)                     |
YIELD_TO_ONCOMING                      |B5                    |![Give way to oncoming traffic (Norway).](assets/warning_yieldtooncoming.png)                                |
CITY_EXIT                              |E8                    |![Exit of city (Germany).](assets/warning_cityexit_de.png)                                                   |
VILLAGE_AHEAD                          |                      |![Village ahead (China).](assets/warning_villageahead_chn.png)                                               |
SPEED_CAMERA                           |                      |![Speed camera (UK).](assets/warning_speedcamera_uk.png)                                                     |
TRAFFIC_ENFORCEMENT_CAMERA             |                      |![Traffic enforcement camera (USA).](assets/warning_trafficenforcementcamera.png)                             |
SPEED_LIMIT                            |C14                   |![Start of speed limit (Germany).](assets/warning_speedlimit_de.png)                                         |
SPEED_LIMIT_END                        |C17b                  |![End of speed limit (Germany).](assets/warning_speedlimitend_de.png)                                        |
MOVABLE_BRIDGE                         |                      |![Movable bridge ahead (Poland).](assets/warning_movablebridge.png)                                          |
SLOW_DOWN                              |                      |![Slow down (USA).](assets/warning_slowdown.png)                                                             |![Slow down (UK)](assets/warning_slow_down_uk.png)
INTERSECTION_T_RIGHT                   |                      |![Three-way junction to the right (USA).](assets/warning_intersectiontright.png)                             |
INTERSECTION_T_LEFT                    |                      |![Three-way junction to the left (USA).](assets/warning_intersectiontleft.png)                               |
INTERSECTION_T_LEFT_RIGHT              |                      |![Three-way junction to the left and right (USA).](assets/warning_intersectiontleftright.png)                |
INTERSECTION_Y                         |                      |![Y-shaped three-way junction (USA).](assets/warning_intersectiony.png)                                      |
PRIORITY_ROAD_END                      |                      |![End of priority road (Netherlands).](assets/warning_priorityroadend_nl.png)                                |![End of priority road (Greece).](assets/warning_priorityroadend_gr.png)
USE_LOW_GEAR                           |none                  |![Start of use low gear (New Zealand).](assets/warning_uselowgear_nz.png)                                    |![Start of use low gear (UK).](assets/warning_uselowgear_uk.png)
NO_COMPRESSION_BRAKING                 |none                  |![Start of no compression release engine braking allowed (USA).](assets/warning_no_compression_brake.png)    |
WAITING_LINE                           |                      |![Waiting line (Germany).](assets/warning_waiting_line_de.png)                                               |
DONT_STOP_ZONE                         |                      |![Start of Do-not-stop zone (USA).](assets/warning_dontstopzone.png)                                         |
LANE_USED_IN_BOTH_DIRECTIONS           |                      |![Lane used in both directions (China).](assets/warning_laneusedinbothdirections_chn.png)                    |
HONKING_PROHIBITED                     |                      |![Honking prohibited (Uruguay).](assets/warning_honkingprohibited_ury.png)                                   |
FASTEN_SEAT_BELT                       |                      |![Fasten seat belt (Philippines).](assets/warning_fastenseatbelt_phl.png)                                    |
DEAD_END                               |                      |![Dead end road (Germany).](assets/warning_deadend_de.png)                                                   |![Dead end road (USA).](assets/warning_deadend_us.png)
ADVISORY_SPEED_LIMIT                   |                      |![Start of advisory speed limit (Spain).](assets/warning_advisoryspeedlimit_esp.png)                         |
SPEED_LIMIT_NIGHT                      |                      |![Speed limit at night (USA).](assets/warning_speedlimitnight_us.png)                                        |
MINIMUM_SPEED                          |                      |![Start of a minimum speed requirement (USA).](assets/warning_minimumspeed_us.png)                           |![Start of a minimum speed requirement (Germany).](assets/warning_minimumspeed_de.png)
VARIABLE_SPEED_LIMIT                   |                      |![Variable speed limit (USA).](assets/warning_variablespeedlimit_us.png)                                     |
VARIABLE                               |                      |![Variable warning sign using light elements (Germany).](assets/warning_variable_prohovertake2.8t_de.png)    |![Variable warning sign using mechanical elements (Germany).](assets/warning_variable_trafficjam_de.png)
UNPROTECTED_LEFT_TURN                  |                      |![Unprotected left turn (USA).](assets/warning_unprotectedleftturn_us.png)                                   |
USE_LOW_GEAR_END                       |                      |![End of use low gear (USA).](assets/warning_uselowgear_end.png)                                             |
NO_COMPRESSION_BRAKING_END             |                      |![End of no compression release engine braking allowed  (USA).](assets/warning_nocompressionbraking_end.png) |
DOUBLE_HAIRPIN_CURVE                   |                      |![Double hairpin curve ahead (China).](assets/warning_doublehairpin.png)                                     |
TRIPLE_HAIRPIN_CURVE                   |                      |![Triple hairpin curve ahead (China).](assets/warning_triplehairpin.png)                                     |
EMBANKMENT                             |                      |![Embankment (South Korea).](assets/warning_embankment.png)                                                  |
HILL                                   |                      |![Hill (USA).](assets/warning_hill.png)                                                                      |
PROTECTED_PASSING_LEFT                 |                      |![Extra lane for passing on the left (Germany).](assets/warning_protectedpassing_left.png)                   |
PROTECTED_PASSING_RIGHT                |                      |![Extra lane for passing on the right (Germany).](assets/warning_protectedpassing_right.png)                 |
RISK_OF_GROUNDING                      |                      |![Risk of grounding (USA).](assets/warning_riskofgrounding.png)                                              |![Risk of grounding (UK).](assets/warning_risk_of_grounding_uk.png)
CURVY_ROAD_LEFT                        |                      |![Curvy or winding road starting to the left (Japan).](assets/warning_curvyroadleft_1.png)                   |
CURVY_ROAD_RIGHT                       |                      |![Curvy or winding road starting to the right (Japan).](assets/warning_curvyroadright.png)                   |
ADVISORY_SPEED_LIMIT_END               |                      |![End of advisory speed limit (Spain).](assets/warning_advisoryspeedlimit_end.png)                           |
MOTORWAY                               |                      |![Start of a motorway (Germany).](assets/warning_motorway.png)                                               |
MOTORWAY_END                           |                      |![End of a motorway(Germany).](assets/warning_motorway_end.png)                                              |
ONEWAY                                 |                      |![One-way road (USA).](assets/warning_oneway_black.png)                                                       |
BICYCLE_PATH                           |                      |![Start of bicycle path (Netherlands).](assets/warning_bicyclepath.png)                                      |
BICYCLE_PATH_END                       |                      |![End of bicycle path (Germany).](assets/warning_bicyclepath_end_2.png)                                      |
HEIGHT_RESTRICTION                     |                      |![Height restriction (USA).](assets/warning_heightrestriction_yellow.png)                                    |![Height restriction (Germany).](assets/warning_heightrestriction_red.png)
LENGTH_RESTRICTION                     |                      |![Length restriction (Germany).](assets/warning_lengthrestriction.png)                                       |
WIDTH_RESTRICTION                      |                      |![Width restriction (Germany).](assets/warning_widthrestriction.png)                                         |
WEIGHT_RESTRICTION                     |                      |![Weight restriction (Germany).](assets/warning_weightrestriction_10t.png)                                   |
PASSING_RESTRICTION                    |                      |![Passing restriction (Germany).](assets/warning_passingrestriction_blue.png)                                |
TURN_RESTRICTION                       |                      |![Turn restriction (USA).](assets/warning_turnrestriction_bent.png)                                          |![Turn restriction (Germany).](assets/warning_turnrestriction_bentdouble.png)
CARS_PROHIBITED                        |                      |![Cars prohibited (Germany).](assets/warning_carsprohibited.png)                                             |
VEHICLES_PROHIBITED                    |                      |![Trucks prohibited (Germany).](assets/warning_vehiclesprohibited_truck.png)                                 |![Trailers prohibited (Netherlands).](assets/warning_vehiclesprohibited_trailer.png)
PEDESTRIANS_PROHIBITED                 |                      |![Pedestrians prohibited (USA).](assets/warning_pedestriansprohibited_crossedout.png)                        |![Pedestrians prohibited (Germany).](assets/warning_pedestriansprohibited.png)
PEDESTRIAN_ZONE                        |                      |![Start of pedestrian zone (Germany).](assets/warning_pedestrianzone.png)                                    |
PEDESTRIAN_ZONE_END                    |                      |![End of pedestrian zone (Germany).](assets/warning_pedestrianzone_end.png)                                  |
DO_NOT_ENTER                           |                      |![Do not enter (USA).](assets/warning_donotenter.png)                                                        |
TRUCK_SPEED_LIMIT                      |                      |![Start of speed limit for trucks (USA).](assets/warning_truckspeedlimit.png)                                |![Start of speed limit for trucks (Germany).](assets/warning_speedlimittruck_de.png)
TRUCK_SPEED_LIMIT_END                  |                      |![End of speed limit for trucks (USA.)](assets/warning_truckspeedlimit_end.png)                              |
MINIMUM_SPEED_END                      |                      |![End of a minimum speed requirement (Germany).](assets/warning_minimumspeed_end.png)                        |
HAMLET_ENTRY                           |                      |![Entry of hamlet (Germany).](assets/warning_hamletentry.png)                                                |
HAMLET_EXIT                            |                      |![Exit of hamlet (Germany).](assets/warning_hamletexit.png)                                                  |
MOTOR_VEHICLE_ROAD                     |                      |![Motor vehicle road (Germany).](assets/warning_motorvehicleroad.png)                                        |
MOTOR_VEHICLE_ROAD_END                 |                      |![Motor vehicle road (Germany).](assets/warning_motorvehicleroadend_2.png)                                   |
PEDESTRIAN_PATH                        |                      |![Start of pedestrian path (Germany).](assets/warning_pedestrianpath.png)                                    |
PEDESTRIAN_PATH_END                    |                      |![End of pedestrian path (Germany).](assets/warning_pedestrianpath_end.png)                                  |
GOOD_LUCK                              |                                                                                                                                          |
NO_TURN_ON_RED                         |                      |![No turn on red allowed.](assets/warning_no_turn_on_red.png)                                                |![No turn on red allowed (Canada).](assets/warning_no_turn_on_red2.png)
TURN_ON_RED_ALLOWED                    |                      |![Turn on red allowed (New York).](assets/warning_turn_on_red_allowed.png)                                   |![Turn on red allowed (Germany).](assets/warning_turn_on_red_allowed2.png)
NO_LEFT_TURN                           |                      |![No left turn.](assets/warning_no_left_turn.png)                                                            |
NO_RIGHT_TURN                          |                      |![No right turn.](assets/warning_no_right_turn.png)                                                          |
NO_STRAIGHT_THROUGH                    |                      |![No straight through.](assets/warning_no_straight_through.png)                                              |
NO_LEFT_OR_RIGHT_TURN                  |                      |![No left or right turn.](assets/warning_no_left_or_right_turn.png)                                          |
NO_STRAIGHT_THROUGH_OR_LEFT_TURN       |                      |![No straight through or left turn.](assets/warning_no_straight_through_or_left_turn.png)                    |
NO_STRAIGHT_THROUGH_OR_RIGHT_TURN      |                      |![No straight through or right turn.](assets/warning_no_straight_through_or_right_turn.png)                  |
STRAIGHT_THROUGH_ONLY                  |                      |![Straight through only.](assets/warning_straight_through_only.png)                                          |![Straight through only (USA).](assets/warning_straight_through_only2.png)
LEFT_TURN_ONLY                         |                      |![Left turn only.](assets/warning_left_turn_only.png)                                                        |![Left turn only (USA).](assets/warning_left_turn_only2.png)
RIGHT_TURN_ONLY                        |                      |![Right turn only.](assets/warning_right_turn_only.png)                                                      |![Right turn only (USA).](assets/warning_right_turn_only2.png)
STRAIGHT_THROUGH_OR_LEFT_TURN_ONLY     |                      |![Straight through or left turn only.](assets/warning_straight_through_or_left_turn_only.png)                |![Straight through or left turn only (USA).](assets/warning_straight_through_or_left_turn_only2.png)
STRAIGHT_THROUGH_OR_RIGHT_TURN_ONLY    |                      |![Straight through or right turn.](assets/warning_straight_through_or_right_turn_only.png)                   |![Straight through or right turn only (USA).](assets/warning_straight_through_or_right_turn_only2.png)
LEFT_OR_RIGHT_TURN_ONLY                |                      |![Left or right turn only.](assets/warning_left_or_right_turn_only.png)                                      |
NO_U_TURN                              |                      |![U-turn not allowed.](assets/warning_no_u_turn.png)                                                         |
U_TURN_ONLY                            |                      |![U-turn only.](assets/warning_u_turn_only.png)                                                              |![U-turn only (USA).](assets/warning_u_turn_only2.png)
U_TURN_ALLOWED                         |                      |![U-turn allowed.](assets/warning_u_turn_allowed.png)                                                        |
CROSSING_WITH_PRIORITY_TO_THE_LEFT     |                      |![Crossing with priority to the left (UK).](assets/warning_crossing_with_priority_to_the_left_uk.png)        |
UNPROTECTED_RIGHT_TURN                 |                      |![Unprotected right turn (Canada).](assets/warning_unprotected_right_turn.png)                               |
ROUNDABOUT                             |                      |![Roundabout (Germany).](assets/warning_roundabout.png)                                                      |
SPEED_LIMIT_ZONE                       |                      |![Speed limit zone (Germany).](assets/warning_speed_limit_zone.png)                                          |
SPEED_LIMIT_ZONE_END                   |                      |![End of speed limit zone (Germany).](assets/warning_speed_limit_zone_end.png)                               |
BICYCLE_ZONE                           |                      |![Bicycle zone (Germany).](assets/warning_bicycle_zone.png)                                                  |
BICYCLE_ZONE_END                       |                      |![End of bicycle zone (Germany).](assets/warning_bicycle_zone_end.png)                                       |
SCHOOL_ZONE_END                        |                      |![End of school zone (USA).](assets/warning_school_end_us.png)                                               |![End of school zone (Slovakia).](assets/warning_school_end_sk.png)
!*/

/** Warning signs. */
enum varuint16 WarningSign
{
    GENERAL_HAZARD,

    PASS_LEFT_OR_RIGHT_OF_OBSTACLE,

    PASS_LEFT_OF_OBSTACLE,

    PASS_RIGHT_OF_OBSTACLE,

    CATTLE,

    ANIMALS,

    ROAD_WORKS,

    LIVING_STREET_ENTRY,

    LIVING_STREET_EXIT,

    CURVE_RIGHT,

    CURVE_LEFT,

    TRUCK_ROLLOVER,

    FOG_AREA,

    CURVE_RIGHT_THEN_LEFT,

    CURVE_LEFT_THEN_RIGHT,

    TIRE_CHAINS_MANDATORY,

    HIJACKING_HOTSPOT,

    CURVY_ROAD,

    REVERSE_BENDS,

    ROUNDABOUT_AHEAD,

    NO_OVERTAKING_FOR_TRUCKS,

    NO_OVERTAKING_FOR_TRUCKS_END,

    DANGEROUS_INTERSECTION,

    OVERPASS_AHEAD,

    TUNNEL,

    FERRY_TERMINAL,

    NARROW_BRIDGE,

    NO_IDLING,

    HUMPBACK_BRIDGE,

    EMBANKMENT_ON_THE_RIGHT,

    EMBANKMENT_ON_THE_LEFT,

    LIGHT_SIGNALS,

    YIELD,

    STOP,

    PRIORITY_ROAD,

    INTERSECTION,

    CROSSING_WITH_PRIORITY_OVER_MINOR_ROAD,

    CROSSING_WITH_PRIORITY_TO_THE_RIGHT,

    BRANCH_TO_THE_RIGHT,

    BRANCH_TO_THE_LEFT,

    CARRIAGEWAY_NARROWS,

    CARRIAGEWAY_NARROWS_RIGHT,

    CARRIAGEWAY_NARROWS_LEFT,

    LANE_MERGE_FROM_RIGHT,

    LANE_MERGE_FROM_LEFT,

    LANE_MERGE_CENTER,

    NO_OVERTAKING,

    NO_OVERTAKING_END,

    PROTECTED_PASSING_END,

    PROTECTED_PASSING,

    PEDESTRIANS,

    PEDESTRIAN_CROSSING,

    CHILDREN,

    SCHOOL_ZONE,

    CYCLISTS,

    TWO_WAY_TRAFFIC,

    RAILROAD_CROSSING_WITH_GATES,

    RAILROAD_CROSSING_WITHOUT_GATES,

    RAILROAD_CROSSING,

    TRAMWAY_CROSSING,

    FALLING_ROCKS,

    FALLING_ROCKS_ON_THE_LEFT,

    FALLING_ROCKS_ON_THE_RIGHT,

    STEEP_DROP_ON_LEFT,

    STEEP_DROP_ON_RIGHT,

    SLIPPERY_ROAD,

    STEEP_INCLINE,

    STEEP_DECLINE,

    UNEVEN_ROAD,

    BUMP,

    DIP,

    ROAD_FLOODS,

    ICY_ROAD,

    WIND,

    TRAFFIC_CONGESTION,

    HIGH_ACCIDENT_AREA,

    CITY_ENTRY,

    AUDIBLE_WARNING,

    END_OF_ALL_RESTRICTIONS,

    PRIORITY_OVER_ONCOMING,

    YIELD_TO_ONCOMING,

    CITY_EXIT,

    VILLAGE_AHEAD,

    SPEED_CAMERA,

    TRAFFIC_ENFORCEMENT_CAMERA,

    SPEED_LIMIT,

    SPEED_LIMIT_END,

    MOVABLE_BRIDGE,

    SLOW_DOWN,

    INTERSECTION_T_RIGHT,

    INTERSECTION_T_LEFT,

    INTERSECTION_T_LEFT_RIGHT,

    INTERSECTION_Y,

    PRIORITY_ROAD_END,

    USE_LOW_GEAR,

    NO_COMPRESSION_BRAKING,

    WAITING_LINE,

    DONT_STOP_ZONE,

    LANE_USED_IN_BOTH_DIRECTIONS,

    HONKING_PROHIBITED,

    FASTEN_SEAT_BELT,

    DEAD_END,

    ADVISORY_SPEED_LIMIT,

    SPEED_LIMIT_NIGHT,

    MINIMUM_SPEED,

    VARIABLE_SPEED_LIMIT,

    VARIABLE,

    UNPROTECTED_LEFT_TURN,

    USE_LOW_GEAR_END,

    NO_COMPRESSION_BRAKING_END,

    DOUBLE_HAIRPIN_CURVE,

    TRIPLE_HAIRPIN_CURVE,

    EMBANKMENT,

    HILL,

    PROTECTED_PASSING_LEFT,

    PROTECTED_PASSING_RIGHT,

    RISK_OF_GROUNDING,

    CURVY_ROAD_LEFT,

    CURVY_ROAD_RIGHT,

    ADVISORY_SPEED_LIMIT_END,

    MOTORWAY,

    MOTORWAY_END,

    ONEWAY,

    BICYCLE_PATH,

    BICYCLE_PATH_END,

    HEIGHT_RESTRICTION,

    LENGTH_RESTRICTION,

    WIDTH_RESTRICTION,

    WEIGHT_RESTRICTION,

    PASSING_RESTRICTION,

    TURN_RESTRICTION,

    CARS_PROHIBITED,

    VEHICLES_PROHIBITED,

    PEDESTRIANS_PROHIBITED,

    PEDESTRIAN_ZONE,

    PEDESTRIAN_ZONE_END,

    DO_NOT_ENTER,

    TRUCK_SPEED_LIMIT,

    TRUCK_SPEED_LIMIT_END,

    MINIMUM_SPEED_END,

    HAMLET_ENTRY,

    HAMLET_EXIT,

    MOTOR_VEHICLE_ROAD,

    MOTOR_VEHICLE_ROAD_END,

    PEDESTRIAN_PATH,

    PEDESTRIAN_PATH_END,

    GOOD_LUCK,

    NO_TURN_ON_RED,

    TURN_ON_RED_ALLOWED,

    NO_LEFT_TURN,

    NO_RIGHT_TURN,

    NO_STRAIGHT_THROUGH,

    NO_LEFT_OR_RIGHT_TURN,

    NO_STRAIGHT_THROUGH_OR_LEFT_TURN,

    NO_STRAIGHT_THROUGH_OR_RIGHT_TURN,

    STRAIGHT_THROUGH_ONLY,

    LEFT_TURN_ONLY,

    RIGHT_TURN_ONLY,

    STRAIGHT_THROUGH_OR_LEFT_TURN_ONLY,

    STRAIGHT_THROUGH_OR_RIGHT_TURN_ONLY,

    LEFT_OR_RIGHT_TURN_ONLY,

    NO_U_TURN,

    U_TURN_ONLY,

    U_TURN_ALLOWED,

    CROSSING_WITH_PRIORITY_TO_THE_LEFT,

    UNPROTECTED_RIGHT_TURN,

    ROUNDABOUT,

    SPEED_LIMIT_ZONE,

    SPEED_LIMIT_ZONE_END,

    BICYCLE_ZONE,

    BICYCLE_ZONE_END,

    SCHOOL_ZONE_END,
};

/*!

## Supplementary Warning Signs

Warning signs can consist of a main sign and a supplementary sign. For example,
the supplementary sign can indicate the distance to or the extent of the hazard.

!*/

/** Supplementary warning signs. */
enum varuint16 SupplementaryWarningSign
{
    /** Warning sign applies to the left turn. */
    LEFT_TURN,

    /** Warning sign applies to the right turn. */
    RIGHT_TURN,

    /** Warning sign applies to the right. */
    RIGHT,

    /** Warning sign applies to the left. */
    LEFT,

    /** Warning sign applies for a given distance. */
    FOR_DISTANCE,

    /** Warning sign applies in a given distance. */
    IN_DISTANCE,

    /** Warning sign applies during a time range. */
    TIME_RANGE,

    /**
     * Icon that is displayed if a driver is going to violate a restriction of
     * the primary warning sign, for example, if the driver is driving to fast
     * or if the driver is going to enter a one-way street in wrong direction.
     */
    ATTENTION,

    /**
     * Supplementary warning sign for `WarningSign.STOP`. Signals that drivers
     * from all directions must stop and have the right-of-way in the order of
     * their arrival. Also used for supplementary signs "2-way stop",
     * "3-way stop", etc.
     */
    ALL_WAY_STOP,
};

/*!

## Variable Warning Signs

Variable warning signs can change their display and validity dynamically.

Warning signs using mechanical elements, such as rotating prisms or mechanical
pixels, use the same colors as their static equivalents.

Warning signs using light elements, such as LEDs or illuminated segments,
sometimes use partially inverted colors. For example, such a warning sign may
switch between black and white while keeping the red frame.

!*/

/** Properties of a variable warning sign. */
enum uint8 VariableWarningSignProperties
{
   /** Variable warning sign using mechanical elements. */
    MECHANIC_ELEMENTS,

    /** Variable warning sign using light elements. */
    LIGHT_ELEMENTS
};

/*!

## Compatibility to NDS.Classic and ADASIS

In NDS.Live, definitions of enum data structures only contain textual enum
values. No fixed numeric enum values are encoded. Instead, integer numbers are
auto-generated and assigned to the textual enum values continuously, without any
gaps.

In NDS.Classic, integer enum values are directly encoded in the data structure
definitions. For historical reasons, the numeric enum values of warning signs
are not continuous but contain gaps. Because of this, some of these numbers
differ from the numbers of the equivalent warning signs in the NDS.Live
structure `WarningSign`. Additionally, the textual enum values may differ. The
same applies to the ADASIS v2 standard, which adopted the NDS.Classic enum
values of warning signs to facilitate combining both standards.

An application that combines NDS.Live with ADASIS v2 needs to map NDS.Live
warning sign data to ADASIS warning sign enum values. For this purpose, the
structure `ClassicAdasisWarningSign` is provided. It uses the textual enum
values from the NDS.Live structure `WarningSign` and associates them with the
corresponding numeric enum values from the structure `WarningSign` in
NDS.Classic version 2.5.4. The structure `ClassicAdasisWarningSign` is intended
to be used for the mapping only, it is not used elsewhere.

The following table shows an schematic example of the interaction between the
structures.

NDS.Live `WarningSign` | `ClassicAdasisWarningSign` | NDS.Classic `WarningSign`
-----------------------|----------------------------|--------------------------
SIGN_A = 0             | SIGN_A = 0                 | SIGN_A = 0
SIGN_B = 1             | SIGN_B = 1                 | SIGN_H = 1
SIGN_C = 2             | SIGN_C = 3                 | SIGN_C = 3
SIGN_D = 3             | SIGN_D = 4                 | SIGN_D = 4
SIGN_E = 4             | SIGN_E = 5                 | SIGN_J = 5
SIGN_F = 5             | SIGN_F = 7                 | SIGN_F = 7
SIGN_G = 6             | SIGN_G = 8                 | SIGN_K = 8

To map the numeric enum values of the NDS.Live structure `WarningSign` to the
equivalent values in the structure `ClassicAdasisWarningSign`, perform the
following steps:

1. For each of the structures, generate a map that associates each textual enum
   value with its numerical value. This can be done by either using the
   generated zserio classes enum traits or by manually creating lookup tables
   between the structures.
1. Compare the textual enum values to create a mapping between the numeric enum
   values.

For the example above, the resulting mapping is as follows:

Numeric enum value in NDS.Live | Numeric enum value in NDS.Classic
-------------------------------|----------------------------------
0                              | 0
1                              | 1
2                              | 3
3                              | 4
4                              | 5
5                              | 7
6                              | 8

!*/

/** Warning sign lookup structure for NDS.Classic 2.5.4 and ADASIS v2. */
enum uint8 ClassicAdasisWarningSign
{
    GENERAL_HAZARD = 0,
    PASS_LEFT_OR_RIGHT_OF_OBSTACLE = 1,
    PASS_LEFT_OF_OBSTACLE = 2,
    PASS_RIGHT_OF_OBSTACLE = 3,
    CATTLE = 4,
    ANIMALS = 5,
    ROAD_WORKS = 6,
    LIVING_STREET_ENTRY = 7,
    LIVING_STREET_EXIT = 8,
    CURVE_RIGHT = 9,
    CURVE_LEFT = 10,
    TRUCK_ROLLOVER = 11,
    FOG_AREA = 12,
    CURVE_RIGHT_THEN_LEFT = 13,
    CURVE_LEFT_THEN_RIGHT = 14,
    TIRE_CHAINS_MANDATORY = 15,
    HIJACKING_HOTSPOT = 16,
    CURVY_ROAD = 17,
    REVERSE_BENDS = 18,
    ROUNDABOUT_AHEAD = 19,
    NO_OVERTAKING_FOR_TRUCKS = 20,
    NO_OVERTAKING_FOR_TRUCKS_END = 21,
    DANGEROUS_INTERSECTION = 22,
    OVERPASS_AHEAD = 23,
    TUNNEL = 24,
    FERRY_TERMINAL = 25,
    NARROW_BRIDGE = 26,
    NO_IDLING = 27,
    HUMPBACK_BRIDGE = 28,
    EMBANKMENT_ON_THE_RIGHT = 29,
    EMBANKMENT_ON_THE_LEFT = 30,
    LIGHT_SIGNALS = 31,
    YIELD = 32,
    STOP = 33,
    PRIORITY_ROAD = 34,
    INTERSECTION = 35,
    CROSSING_WITH_PRIORITY_OVER_MINOR_ROAD = 36,
    CROSSING_WITH_PRIORITY_TO_THE_RIGHT = 37,
    BRANCH_TO_THE_RIGHT = 38,
    BRANCH_TO_THE_LEFT = 39,
    CARRIAGEWAY_NARROWS = 40,
    CARRIAGEWAY_NARROWS_RIGHT = 41,
    CARRIAGEWAY_NARROWS_LEFT = 42,
    LANE_MERGE_FROM_RIGHT = 43,
    LANE_MERGE_FROM_LEFT = 44,
    LANE_MERGE_CENTER = 45,
    NO_OVERTAKING = 46,
    NO_OVERTAKING_END = 47,
    PROTECTED_PASSING_END = 48,
    PROTECTED_PASSING = 49,
    PEDESTRIANS = 50,
    PEDESTRIAN_CROSSING = 51,
    CHILDREN = 52,
    SCHOOL_ZONE = 53,
    CYCLISTS = 54,
    TWO_WAY_TRAFFIC = 55,
    RAILROAD_CROSSING_WITH_GATES = 56,
    RAILROAD_CROSSING_WITHOUT_GATES = 57,
    RAILROAD_CROSSING = 58,
    TRAMWAY_CROSSING = 59,
    FALLING_ROCKS = 60,
    FALLING_ROCKS_ON_THE_LEFT = 61,
    FALLING_ROCKS_ON_THE_RIGHT = 62,
    STEEP_DROP_ON_LEFT = 63,
    STEEP_DROP_ON_RIGHT = 64,
    SLIPPERY_ROAD = 66,
    STEEP_INCLINE = 67,
    STEEP_DECLINE = 68,
    UNEVEN_ROAD = 69,
    BUMP = 70,
    DIP = 71,
    ROAD_FLOODS = 72,
    ICY_ROAD = 73,
    WIND = 74,
    TRAFFIC_CONGESTION = 75,
    HIGH_ACCIDENT_AREA = 76,
    CITY_ENTRY = 77,
    AUDIBLE_WARNING = 78,
    END_OF_ALL_RESTRICTIONS = 79,
    PRIORITY_OVER_ONCOMING = 81,
    YIELD_TO_ONCOMING = 82,
    CITY_EXIT = 83,
    VILLAGE_AHEAD = 84,
    SPEED_CAMERA = 85,
    TRAFFIC_ENFORCEMENT_CAMERA = 86,
    SPEED_LIMIT = 87,
    SPEED_LIMIT_END = 88,
    MOVABLE_BRIDGE = 89,
    SLOW_DOWN = 90,
    INTERSECTION_T_RIGHT = 91,
    INTERSECTION_T_LEFT = 92,
    INTERSECTION_T_LEFT_RIGHT = 93,
    INTERSECTION_Y = 94,
    PRIORITY_ROAD_END = 95,
    USE_LOW_GEAR = 96,
    NO_COMPRESSION_BRAKING = 97,
    WAITING_LINE = 98,
    DONT_STOP_ZONE = 99,
    LANE_USED_IN_BOTH_DIRECTIONS = 100,
    HONKING_PROHIBITED = 101,
    FASTEN_SEAT_BELT = 102,
    DEAD_END = 103,
    ADVISORY_SPEED_LIMIT = 104,
    SPEED_LIMIT_NIGHT = 105,
    MINIMUM_SPEED = 106,
    VARIABLE_SPEED_LIMIT = 107,
    VARIABLE = 108,
    UNPROTECTED_LEFT_TURN = 109,
    USE_LOW_GEAR_END = 110,
    NO_COMPRESSION_BRAKING_END = 111,
    DOUBLE_HAIRPIN_CURVE = 112,
    TRIPLE_HAIRPIN_CURVE = 113,
    EMBANKMENT = 114,
    HILL = 115,
    PROTECTED_PASSING_LEFT = 116,
    PROTECTED_PASSING_RIGHT = 117,
    RISK_OF_GROUNDING = 118,
    CURVY_ROAD_LEFT = 119,
    CURVY_ROAD_RIGHT = 120,
    ADVISORY_SPEED_LIMIT_END = 122,
    MOTORWAY = 123,
    MOTORWAY_END = 124,
    ONEWAY = 125,
    BICYCLE_PATH = 126,
    BICYCLE_PATH_END = 127,
    HEIGHT_RESTRICTION = 128,
    LENGTH_RESTRICTION = 129,
    WIDTH_RESTRICTION = 130,
    WEIGHT_RESTRICTION = 131,
    PASSING_RESTRICTION = 132,
    TURN_RESTRICTION = 133,
    CARS_PROHIBITED = 134,
    VEHICLES_PROHIBITED = 135,
    PEDESTRIANS_PROHIBITED = 136,
    PEDESTRIAN_ZONE = 137,
    PEDESTRIAN_ZONE_END = 138,
    DO_NOT_ENTER = 139,
    TRUCK_SPEED_LIMIT = 140,
    TRUCK_SPEED_LIMIT_END = 141,
    MINIMUM_SPEED_END = 142,
    HAMLET_ENTRY = 143,
    HAMLET_EXIT = 144,
    MOTOR_VEHICLE_ROAD = 145,
    MOTOR_VEHICLE_ROAD_END = 146,
    PEDESTRIAN_PATH = 147,
    PEDESTRIAN_PATH_END = 148,
    GOOD_LUCK = 255,
};
