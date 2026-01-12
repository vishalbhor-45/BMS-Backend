CREATE TABLE IF NOT EXISTS age_of_brdge (
  age_id INTEGER,
  age_when_inspection_done_first TEXT,
  age_code INTEGER
);


CREATE TABLE IF NOT EXISTS approaches (
  approaches_id INTEGER,
  bridge_inspection_id INTEGER,
  type_of_terrain TEXT,
  type_of_approach TEXT,
  material_of_approach TEXT,
  approach_geometrics TEXT,
  approaches_having_span TEXT,
  pavement_surface TEXT,
  pavement_surface_image TEXT,
  pothole_length INTEGER,
  pothole_width INTEGER,
  pothole_depth INTEGER,
  cracking_length INTEGER,
  cracking_width INTEGER,
  cracking_depth INTEGER,
  side_slopes TEXT,
  erosion_of_embankment_by_rain_cuts_or_any_other_damage TEXT,
  erosion_image TEXT,
  approach_slab TEXT,
  approach_slab_image TEXT,
  wall_type_and_height TEXT,
  retaining_wall_condition TEXT,
  retaining_wall_condition_image TEXT,
  silt_and_debris TEXT,
  silt_and_debris_image TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS approaches_bridge (
  approaches_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  type_of_terrain TEXT,
  type_of_approach TEXT,
  material_of_approach TEXT,
  approach_geometrics TEXT,
  approaches_having_span TEXT,
  wall_type_and_height TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS bearing_and_pedistal (
  bearing_and_pedistal_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  bearing_no_per_abutment TEXT,
  pedestal_no_per_abutment TEXT,
  bearing_no_per_pier TEXT,
  pedestal_no_per_pier TEXT,
  bearing_total INTEGER,
  pedestal_total INTEGER,
  pier_bearing_total INTEGER,
  pier_pedestal_total INTEGER,
  total_piers_at_add INTEGER,
  bearing_type_allowable_movements TEXT,
  pedestal_type_allowable_movements TEXT,
  bearing_material TEXT,
  pedestal_material TEXT,
  bearing_general_condition TEXT,
  pedestal_general_condition TEXT,
  bearing_functioning TEXT,
  pedestal_functioning TEXT,
  general_condition_images TEXT,
  functioning_images TEXT,
  bearing_condition TEXT,
  name_of_span TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS bearing_and_pedistal_bridge (
  bearing_and_pedistal_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  bearing_no_per_abutment TEXT,
  pedestal_no_per_abutment TEXT,
  bearing_no_per_pier TEXT,
  pedestal_no_per_pier TEXT,
  bearing_total INTEGER,
  pedestal_total INTEGER,
  pier_bearing_total INTEGER,
  pier_pedestal_total INTEGER,
  total_piers_at_add INTEGER,
  bearing_type_allowable_movements TEXT,
  pedestal_type_allowable_movements TEXT,
  bearing_material TEXT,
  pedestal_material TEXT,
  metallic_bearings TEXT,
  elastomeric_bearing TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS bearing_and_pedistal_condition (
  bpc_id INTEGER,
  bridge_inspection_id INTEGER,
  bearing_and_pedistal_id INTEGER,
  pedestal_condition TEXT,
  pedestal_condition_length INTEGER,
  pedestal_condition_width INTEGER,
  pedestal_condition_depth INTEGER,
  pedestal_condition_distance_x INTEGER,
  pedestal_condition_distance_y INTEGER,
  created_by INTEGER,
  created_on DATE,
  name_of_span TEXT
);


CREATE TABLE IF NOT EXISTS bearing_rating_details (
  id INTEGER,
  bridge_inspection_id INTEGER,
  component_type TEXT,
  form_no INTEGER,
  bearing_name TEXT,
  bearing_type TEXT,
  bearing_condition TEXT,
  images TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS bridge (
  bridge_id INTEGER PRIMARY KEY,
  project_name TEXT,
  state_id TEXT,
  zone TEXT,
  road_type TEXT,
  highway_no TEXT,
  chainage TEXT,
  bridge_no TEXT,
  direction_of_inventory_start TEXT,
  direction_of_inventory_end TEXT,
  latitude TEXT,
  longitude TEXT,
  date DATE,
  consultant_name TEXT,
  popular_name_of_bridge TEXT,
  custodian TEXT,
  engineer_designation TEXT,
  contact_details TEXT,
  email_id TEXT,
  departmental_chainage TEXT,
  departmental_bridge_number TEXT,
  bridge_side TEXT,
  width_of_bridge TEXT,
  length_of_bridge TEXT,
  height_of_bridge TEXT,
  total_no_of_span INTEGER,
  traffic_lane_on_bridge TEXT,
  type_of_bridge TEXT,
  age_of_bridge TEXT,
  structural_form TEXT,
  material_of_construction TEXT,
  loading_as_per_irc TEXT,
  hydraluic_tone_weightage TEXT,
  pay_load TEXT,
  bridge_crossing_feature TEXT,
  rating_of_deck_geometry TEXT,
  rating_for_vertical_clearance TEXT,
  rating_of_waterway_adequacy TEXT,
  rating_of_average_daily_traffic TEXT,
  rating_for_social_importance TEXT,
  rating_for_economic_growth_potential TEXT,
  rating_alternate_route TEXT,
  rating_environmental_impact TEXT,
  structure_data_bridge TEXT,
  general_bridge TEXT,
  approaches_bridge TEXT,
  protection_works_bridge TEXT,
  foundation_bridge TEXT,
  substructure_bridge TEXT,
  bearing_and_pedistal_bridge TEXT,
  superstructure_bridge TEXT,
  expansion_joint_bridge TEXT,
  wearing_coat_bridge TEXT,
  handrails_parapets_crash_barriers_bridge TEXT,
  bridge_images TEXT,
  status TEXT,
  created_on DATE,
  created_by INTEGER,
  updated_on DATE,
  updated_by INTEGER,
  form_filled TEXT,
  bmc_status TEXT,
  bmc_user INTEGER,
  bmc_status_updated_on TEXT,
  is_inspecion_schedule TEXT,
  bridge_identity_no TEXT,
  design_discharge_in_cumecs TEXT
);


CREATE TABLE IF NOT EXISTS bridge_inspection (
  bridge_inspection_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  state_id INTEGER,
  zone_id INTEGER,
  design_discharge_in_cumecs INTEGER,
  design_hfl_and_lwl INTEGER,
  design_scour_level_at_pier INTEGER,
  design_scour_level_at_abutment INTEGER,
  founding_strata INTEGER,
  water_body_lowest_level INTEGER,
  whether_the_bridge_is_in_grade TEXT,
  road_formation_level INTEGER,
  ground_level INTEGER,
  deck_soft_level_of_superstructure INTEGER,
  clear_carriageway_width NUMERIC,
  overall_deck_width NUMERIC,
  roadway_width_for_approaches INTEGER,
  safety_kerb_width NUMERIC,
  footpath_width NUMERIC,
  bridge_railing_type TEXT,
  bridge_railing_material TEXT,
  bridge_railing_width INTEGER,
  whether_median_if_yes_its_width NUMERIC,
  shoulder_width NUMERIC,
  shoulder_material TEXT,
  height_of_approach_embankment INTEGER,
  average_skew TEXT,
  whether_navigable TEXT,
  horizontal_clearance INTEGER,
  vertical_clearence INTEGER,
  hign_level_submersible_causeway TEXT,
  bridge_inspection TEXT,
  general TEXT,
  approaches TEXT,
  protection_works TEXT,
  waterway TEXT,
  foundation TEXT,
  substructure TEXT,
  for_subways TEXT,
  bearing_and_pedestal TEXT,
  superstructure TEXT,
  expansion_joint TEXT,
  wearing_coat TEXT,
  drainage_spouts_and_vest_holes TEXT,
  hand_rails_&_parapets_walls TEXT,
  footpaths TEXT,
  utilities TEXT,
  bridge_number TEXT,
  environment TEXT,
  aesthetics TEXT,
  bmc_inspection_status TEXT,
  bmc_user INTEGER,
  bmc_inspection_status_date TEXT,
  remark TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  upadted_on DATE
);


CREATE TABLE IF NOT EXISTS bridge_inspection_distress (
  id INTEGER,
  bridge_inspection_id INTEGER,
  table_type TEXT,
  distress_type TEXT,
  name_of_span TEXT,
  field_type TEXT,
  distress_length INTEGER,
  distress_width INTEGER,
  distress_depth INTEGER,
  distance_of_distress_x INTEGER,
  distance_of_distress_y INTEGER,
  abutment_A1 INTEGER,
  abutment_A2 INTEGER,
  piers INTEGER,
  spans INTEGER,
  foundation INTEGER,
  expansion INTEGER,
  lhs_distress INTEGER,
  rhs_distress INTEGER,
  created_by INTEGER,
  created_on DATE
);


CREATE TABLE IF NOT EXISTS bridge_inspection_rejection_comment (
  rejection_id INTEGER,
  bridge_inspection_id INTEGER,
  comment TEXT,
  comment_by INTEGER,
  comment_on DATE
);


CREATE TABLE IF NOT EXISTS bridge_rejection_comment (
  rejection_id INTEGER,
  bridge_id INTEGER,
  comment TEXT,
  comment_by INTEGER,
  comment_on DATE
);


CREATE TABLE IF NOT EXISTS bridge_side (
  id INTEGER,
  bridge_sides TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE
);


CREATE TABLE IF NOT EXISTS company_firms (
  firm_id INTEGER,
  firm_name TEXT,
  firm_code TEXT,
  current_year TEXT,
  current_challan INTEGER,
  current_invoice INTEGER,
  credit_number INTEGER,
  debit_number INTEGER,
  cash_invoice_no INTEGER,
  lot_no INTEGER,
  rev_no INTEGER,
  year_code TEXT,
  grin_no INTEGER,
  mid_no INTEGER,
  material_inward_no INTEGER,
  order_id INTEGER,
  quotation_id INTEGER,
  spo_number INTEGER,
  sales_order_id INTEGER,
  po_number INTEGER,
  inward_stock_id INTEGER,
  stock_transfer_id INTEGER,
  gst_num TEXT,
  state_code INTEGER,
  state_name TEXT,
  firm_address TEXT,
  firm_email TEXT,
  firm_mobile TEXT,
  firm_jurisdiction TEXT,
  logo_image TEXT,
  status TEXT,
  parent_firm INTEGER,
  disply_name TEXT,
  asso_client_id INTEGER,
  asso_supplier_id INTEGER,
  receipt_number INTEGER,
  booking_id INTEGER,
  job_number INTEGER,
  address TEXT
);


CREATE TABLE IF NOT EXISTS drainage_spouts_and_vest_holes (
  drainage_spouts_and_vest_holes_id INTEGER,
  bridge_inspection_id INTEGER,
  check_clogging_lhs TEXT,
  check_clogging_rhs TEXT,
  distress_length INTEGER,
  distress_width INTEGER,
  distress_depth INTEGER,
  check_projection_of_spout_lhs TEXT,
  check_projection_of_spout_rhs TEXT,
  check_adequacy_thereof_lhs TEXT,
  check_adequacy_thereof_rhs TEXT,
  for_subway_reports_lhs TEXT,
  for_subway_reports_rhs TEXT,
  for_submersible_bridges_lhs TEXT,
  for_submersible_bridges_rhs TEXT,
  report_absence_of_drainage_spouts_lhs TEXT,
  report_absence_of_drainage_spouts_rhs TEXT,
  check_choking_of_drainage_holes_lhs TEXT,
  check_choking_of_drainage_holes_rhs TEXT,
  check_clogging_images TEXT,
  check_projection_of_spout_images TEXT,
  check_adequacy_thereof_images TEXT,
  for_subway_reports_images TEXT,
  for_submersible_bridges_images TEXT,
  report_absence_of_drainage_spouts_images TEXT,
  check_choking_of_drainage_holes_images TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS expansion_joint (
  expansion_joint_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  type_a1 TEXT,
  type_a2 TEXT,
  functioning_a1 TEXT,
  functioning_a2 TEXT,
  expansion_name TEXT,
  name_of_span TEXT,
  condition_a1 TEXT,
  condition_a2 TEXT,
  functioning_distress_length TEXT,
  functioning_distress_width TEXT,
  functioning_distress_depth TEXT,
  sealing_material_a1 TEXT,
  sealing_material_a2 TEXT,
  check_secureness_of_the_joints_a1 TEXT,
  check_secureness_of_the_joints_a2 TEXT,
  top_sliding_plate_a1 TEXT,
  top_sliding_plate_a2 TEXT,
  locking_of_joints_a1 TEXT,
  locking_of_joints_a2 TEXT,
  check_for_debris_in_joints_a1 TEXT,
  check_for_debris_in_joints_a2 TEXT,
  report_rattling_a1 TEXT,
  report_rattling_a2 TEXT,
  check_drainage_from_expansion_joint_a1 TEXT,
  check_drainage_from_expansion_joint_a2 TEXT,
  check_alignment_and_clearance_a1 TEXT,
  check_alignment_and_clearance_a2 TEXT,
  type_a1_images TEXT,
  type_a2_images TEXT,
  condition_a1_images TEXT,
  condition_a2_images TEXT,
  functioning_a1_images TEXT,
  functioning_a2_images TEXT,
  sealing_material_a1_images TEXT,
  sealing_material_a2_images TEXT,
  check_secureness_of_the_joints_a1_images TEXT,
  check_secureness_of_the_joints_a2_images TEXT,
  top_sliding_plate_a1_images TEXT,
  top_sliding_plate_a2_images TEXT,
  locking_of_joints_a1_images TEXT,
  locking_of_joints_a2_images TEXT,
  check_for_debris_in_joints_a1_images TEXT,
  check_for_debris_in_joints_a2_images TEXT,
  report_rattling_a1_images TEXT,
  report_rattling_a2_images TEXT,
  check_drainage_from_expansion_joint_a1_images TEXT,
  check_drainage_from_expansion_joint_a2_images TEXT,
  check_alignment_and_clearance_a1_images TEXT,
  check_alignment_and_clearance_a2_images TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS expansion_joint_bridge (
  expansion_joint_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  type_a1 TEXT,
  type_a2 TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS expansion_joint_bridge_items (
  id INTEGER,
  bridge_id INTEGER,
  expansion_name TEXT,
  expansion_type TEXT,
  default_condition TEXT,
  display_order INTEGER,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS expansion_joint_pilers (
  expansion_pilers_id INTEGER,
  expansion_joint_id INTEGER,
  bridge_inspection_id INTEGER,
  type TEXT,
  condition TEXT,
  functioning TEXT,
  sealing_material TEXT,
  check_secureness_of_the_joints TEXT,
  top_sliding_plate TEXT,
  locking_of_joints TEXT,
  check_for_debris_in_joints TEXT,
  report_rattling TEXT,
  check_drainage_from_expansion_joint TEXT,
  check_alignment_and_clearance TEXT,
  piler_name TEXT,
  piler_images TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS footpaths (
  footpath_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  present_lhs TEXT,
  present_rhs TEXT,
  material_lhs TEXT,
  material_rhs TEXT,
  conditions_lhs TEXT,
  conditions_rhs TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS foundation (
  foundation_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  foundation_type TEXT,
  foundation_name TEXT,
  material TEXT,
  floating_bodies_boulders TEXT,
  floating_bodies_boulders_image TEXT,
  seepage_vehicle_impact TEXT,
  seepage_vehicle_impact_image TEXT,
  condition_of_foundation TEXT,
  condition_of_foundation_image TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS foundation_bridge (
  foundation_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  foundation_type TEXT,
  material TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS general (
  general_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  corrosion_protection_measures INTEGER,
  bank_protection_and_type TEXT,
  floor_protection TEXT,
  floor_type TEXT,
  bridge_located_in_back_water_or_chemical_affected_water TEXT,
  whether_guard_rail_or_crash_barrier TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS general_bridge (
  general_id INTEGER,
  bridge_id INTEGER,
  corrosion_protection_measures INTEGER,
  bank_protection_and_type TEXT,
  floor_protection TEXT,
  floor_type TEXT,
  bridge_located_in_back_water_or_chemical_affected_water TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS handrails_parapets_crash_barriers (
  handrails_parapets_crash_barriers_id INTEGER,
  bridge_inspection_id INTEGER,
  present_lhs TEXT,
  present_rhs TEXT,
  material_lhs TEXT,
  material_rhs TEXT,
  conditions_lhs TEXT,
  conditions_rhs TEXT,
  expansion_joint_gap_lhs TEXT,
  expansion_joint_gap_rhs TEXT,
  distress_length INTEGER,
  distress_width INTEGER,
  distress_depth INTEGER,
  present_of_additional_safety_measures_lhs TEXT,
  present_of_additional_safety_measures_rhs TEXT,
  presence_of_towers_lhs TEXT,
  presence_of_towers_rhs TEXT,
  inspection_galley_ladder_platform_lhs TEXT,
  inspection_galley_ladder_platform_rhs TEXT,
  whether_guard_rail_or_crash_barrier TEXT,
  expansion_joint_gap_images TEXT,
  present_of_additional_safety_measures_images TEXT,
  presence_of_towers_images TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS handrails_parapets_crash_barriers_bridge (
  handrails_parapets_crash_barriers_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  material_lhs TEXT,
  material_rhs TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS hydraluic_tone_weightage (
  htw_id INTEGER,
  hydraluic_tone_code INTEGER,
  hydraluic_tone_rating TEXT
);


CREATE TABLE IF NOT EXISTS inspection_cause_rating (
  id INTEGER,
  inspection_distress_id INTEGER,
  bridge_inspection_id INTEGER,
  component_name TEXT,
  foundation INTEGER,
  wearing_coat INTEGER,
  expansion_joint INTEGER,
  superstructure INTEGER,
  distress_type TEXT,
  impact INTEGER,
  abrasion INTEGER,
  erosion INTEGER,
  overload INTEGER,
  fatigue INTEGER,
  temprature INTEGER,
  shrinkage INTEGER,
  settlement INTEGER,
  carbon_dioxide INTEGER,
  sulphates INTEGER,
  carbonation INTEGER,
  alkali INTEGER,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS inspection_component_rating (
  id INTEGER,
  bridge_inspection_id INTEGER,
  rating_id INTEGER,
  component_type TEXT,
  bearing_and_pedestal_name TEXT,
  bearing_type TEXT,
  component_name TEXT,
  foundation_id INTEGER,
  superstructure_id INTEGER,
  expansion_joint_id INTEGER,
  form_no INTEGER,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS loading_icr (
  l_id INTEGER,
  loading_code TEXT,
  allowed_loading TEXT,
  loading_rating_code INTEGER
);


CREATE TABLE IF NOT EXISTS material_of_construction (
  moc_id INTEGER,
  material_of_construction_code TEXT,
  material_of_construction_description TEXT
);


CREATE TABLE IF NOT EXISTS material_of_construction_bkp (
  moc_id INTEGER,
  material_of_construction_code TEXT,
  material_of_construction_description TEXT
);


CREATE TABLE IF NOT EXISTS non_structural_elements (
  non_structural_element_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  element_type TEXT,
  element_description TEXT,
  l_value INTEGER,
  w_value NUMERIC,
  d_value NUMERIC,
  nos_value INTEGER,
  condition_rating TEXT,
  location TEXT,
  material TEXT,
  distress_type TEXT,
  maintenance_required TEXT,
  priority_level TEXT,
  inspection_notes TEXT,
  images TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by TEXT,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS overall_bridge_rating (
  id INTEGER,
  bridge_inspection_id INTEGER,
  rating_id INTEGER,
  bmc_rejected TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS protection_works (
  protection_works_id INTEGER,
  bridge_inspection_id INTEGER,
  type TEXT,
  layout_cross_section_profile TEXT,
  slope_pitching_apron_and_toe_walls TEXT,
  floor_protection_works TEXT,
  scour_for_abutments TEXT,
  scour_for_abutments_image TEXT,
  scour_for_piers TEXT,
  scour_for_piers_image TEXT,
  reserve_store_material TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS protection_works_bridge (
  protection_works_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  type TEXT,
  reserve_store_material TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS rating_alternate_route (
  route_id INTEGER,
  route_rating_code INTEGER,
  route_rating TEXT,
  route_rating_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_environmental_impact (
  er_id INTEGER,
  environmental_impact_rating_code INTEGER,
  environmental_impact_rating TEXT,
  environmental_impact_rating_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_abrasion (
  rating_for_abrasion_id INTEGER PRIMARY KEY,
  rating_for_abrasion_code INTEGER,
  rating_for_abrasion_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_alkali (
  rating_for_alkali_id INTEGER PRIMARY KEY,
  rating_for_alkali_code INTEGER,
  rating_for_alkali_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_carbonation (
  rating_for_carbonation_id INTEGER PRIMARY KEY,
  rating_for_carbonation_code INTEGER,
  rating_for_carbonation_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_carbon_dioxide (
  rating_for_carbon_dioxide_id INTEGER PRIMARY KEY,
  rating_for_carbon_dioxide_code INTEGER,
  rating_for_carbon_dioxide_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_economic_growth_potential (
  economic_growth_potential_id INTEGER,
  economic_growth_potential_code INTEGER,
  economic_growth_potential_rating TEXT,
  economic_growth_potential_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_erosion (
  rating_for_erosion_id INTEGER PRIMARY KEY,
  rating_for_erosion_code INTEGER,
  rating_for_erosion_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_fatigue (
  rating_for_fatigue_id INTEGER PRIMARY KEY,
  rating_for_fatigue_code INTEGER,
  rating_for_fatigue_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_impact (
  rating_for_impact_id INTEGER PRIMARY KEY,
  rating_for_impact_code INTEGER,
  rating_for_impact_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_overload (
  rating_for_overload_id INTEGER PRIMARY KEY,
  rating_for_overload_code INTEGER,
  rating_for_overload_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_social_importance (
  social_importance_id INTEGER,
  social_importance_code INTEGER,
  social_importance_rating TEXT,
  social_importance_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_sulphates (
  rating_for_sulphates_id INTEGER,
  rating_for_sulphates_code INTEGER,
  rating_for_sulphates_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_temperature (
  rating_for_temperature_id INTEGER PRIMARY KEY,
  rating_for_temperature_code INTEGER,
  rating_for_temperature_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_for_vertical_clearance (
  vertical_clearance_id INTEGER,
  road_type TEXT,
  vertical_clearance_rating_code INTEGER,
  vertical_clearance_rating TEXT
);


CREATE TABLE IF NOT EXISTS rating_of_average_daily_traffic (
  daily_traffic_id INTEGER,
  traffic_rating_code INTEGER,
  traffic_rating TEXT,
  traffic_rating_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_of_deck_geometry (
  geometry_rating_id INTEGER,
  geometry_rating_code INTEGER,
  geometry_rating TEXT
);


CREATE TABLE IF NOT EXISTS rating_of_settlement (
  rating_of_settlement_id INTEGER PRIMARY KEY,
  rating_of_settlement_code INTEGER,
  rating_of_settlement_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_of_shrinkage (
  rating_of_shrinkage_id INTEGER PRIMARY KEY,
  rating_of_shrinkage_code INTEGER,
  rating_of_shrinkage_desc TEXT
);


CREATE TABLE IF NOT EXISTS rating_of_waterway_adequacy (
  waterway_adequacy_id INTEGER,
  waterway_rating_code TEXT,
  waterway_rating TEXT,
  waterway_rating_desc TEXT
);


CREATE TABLE IF NOT EXISTS road_type (
  road_type_id INTEGER PRIMARY KEY,
  road_code TEXT,
  road_type TEXT
);


CREATE TABLE IF NOT EXISTS sapn_arrangment (
  sp_id INTEGER,
  bridge_id INTEGER,
  span_material TEXT,
  span_type TEXT,
  span_length INTEGER,
  created_by INTEGER,
  created_on DATE
);


CREATE TABLE IF NOT EXISTS schedule_adhoc_inspecion (
  adhoc_inspecion_id INTEGER,
  bridge_id INTEGER,
  adhoc_inspecion_date DATE,
  comment TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS schedule_inspecion (
  si_id INTEGER,
  bridge_id INTEGER,
  pre_month INTEGER,
  post_month INTEGER,
  routine_inspecion_month INTEGER,
  routine_inspecion_frequency TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS schedule_inspecion_notification (
  notification_id INTEGER,
  bridge_id INTEGER,
  si_id INTEGER,
  adhoc_inspecion_id INTEGER,
  inspecion_type TEXT,
  reminder_date DATE,
  status TEXT
);


CREATE TABLE IF NOT EXISTS state (
  state_id INTEGER PRIMARY KEY,
  state_name TEXT,
  state_code TEXT
);


CREATE TABLE IF NOT EXISTS state_bkp (
  state_id INTEGER,
  state_name TEXT,
  state_code TEXT
);


CREATE TABLE IF NOT EXISTS structural_crossing_feature (
  cf_id INTEGER,
  structural_crossing_feature_code INTEGER,
  structural_crossing_feature_description TEXT
);


CREATE TABLE IF NOT EXISTS structural_form (
  sf_id INTEGER,
  structural_form_code INTEGER,
  structural_form_description TEXT
);


CREATE TABLE IF NOT EXISTS structural_form_bkp (
  sf_id INTEGER,
  structural_form_code INTEGER,
  structural_form_description TEXT
);


CREATE TABLE IF NOT EXISTS structural_rating (
  structural_rating_id INTEGER PRIMARY KEY,
  structural_rating_code INTEGER,
  structural_rating_title TEXT,
  structural_rating_desc TEXT
);


CREATE TABLE IF NOT EXISTS structure_data_bridge (
  structure_data_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  design_discharge_in_cumecs INTEGER,
  design_hfl_and_lwl INTEGER,
  design_scour_level_at_pier INTEGER,
  design_scour_level_at_abutment INTEGER,
  founding_strata INTEGER,
  water_body_lowest_level INTEGER,
  whether_the_bridge_is_in_grade TEXT,
  road_formation_level INTEGER,
  ground_level INTEGER,
  deck_soft_level_of_superstructure INTEGER,
  clear_carriageway_width NUMERIC,
  overall_deck_width NUMERIC,
  roadway_width_for_approaches INTEGER,
  safety_kerb_width NUMERIC,
  footpath_width NUMERIC,
  bridge_railing_type TEXT,
  bridge_railing_material TEXT,
  bridge_railing_width INTEGER,
  whether_median_if_yes_its_width NUMERIC,
  shoulder_width NUMERIC,
  shoulder_material TEXT,
  height_of_approach_embankment INTEGER,
  average_skew TEXT,
  whether_navigable TEXT,
  horizontal_clearance INTEGER,
  vertical_clearence INTEGER,
  hign_level_submersible_causeway TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS substructure (
  substructure_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  type_a1 TEXT,
  type_a2 TEXT,
  substructure_material_a1 TEXT,
  substructure_material_a2 TEXT,
  condition_a1 TEXT,
  condition_a2 TEXT,
  substructure_name TEXT,
  condition_distress_length INTEGER,
  condition_distress_width INTEGER,
  condition_distress_depth INTEGER,
  distance_distress_x TEXT,
  distance_distress_y TEXT,
  efficiency_drainage_a1 TEXT,
  efficiency_drainage_a2 TEXT,
  max_depth_abutment_found_a1 INTEGER,
  max_depth_abutment_found_a2 INTEGER,
  efficiency_drainage_a1_images TEXT,
  efficiency_drainage_a2_images TEXT,
  max_depth_abutment_found_a1_images TEXT,
  max_depth_abutment_found_a2_images TEXT,
  condition_a1_images TEXT,
  condition_a2_images TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS substructure_bridge (
  substructure_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  type_a1 TEXT,
  type_a2 TEXT,
  substructure_material_a1 TEXT,
  substructure_material_a2 TEXT,
  max_depth_abutment_found_a1 INTEGER,
  max_depth_abutment_found_a2 INTEGER,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS substructure_piers_bridge (
  p_id INTEGER,
  substructure_bridge_id INTEGER,
  bridge_id INTEGER,
  type TEXT,
  substructure_material TEXT,
  condition TEXT,
  efficiency_of_drainage TEXT,
  max_depth_of_abutment_foundation INTEGER,
  piler_name TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS subways (
  subway_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  check_condition_of_side_retaining_wall TEXT,
  check_condition_of_side_retaining_wall_image TEXT,
  check_condition_of_side_retaining_wall_distress_length INTEGER,
  check_condition_of_side_retaining_wall_distress_width INTEGER,
  check_condition_of_side_retaining_wall_distress_depth INTEGER,
  check_large_excavations_done TEXT,
  check_large_excavations_done_image TEXT,
  check_large_excavations_done_distress_length INTEGER,
  check_large_excavations_done_distress_width INTEGER,
  check_large_excavations_done_distress_depth INTEGER,
  check_damages_to_protective_measures TEXT,
  check_damages_to_protective_measures_image TEXT,
  check_damages_to_protective_measures_distress_length INTEGER,
  check_damages_to_protective_measures_distress_width INTEGER,
  check_damages_to_protective_measures_distress_depth INTEGER,
  check_damage_to_protective_coating_or_paint TEXT,
  check_damage_to_protective_coating_or_paint_image TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS superstructure (
  superstructure_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  name_of_span TEXT,
  type_of_span TEXT,
  no_of_girder TEXT,
  structural_system TEXT,
  type_of_material TEXT,
  check_spalling_disintegration_or_honey_combing TEXT,
  superstructure_name TEXT,
  check_cracks TEXT,
  check_exposed_reinforcement TEXT,
  check_wear_of_deck_surface TEXT,
  check_scaling TEXT,
  check_surface_stains_and_rust_stains TEXT,
  check_leaching TEXT,
  check_corrosion_of_reinforcements TEXT,
  check_leakage TEXT,
  check_damages_due_to_moving_vehicles TEXT,
  check_condition_of_articulation TEXT,
  check_excessive_vibrations TEXT,
  check_excessive_deflections_loss_of_camber TEXT,
  check_cracks_around_anchorage_zone TEXT,
  check_excessive_deflections_at_central_hinge TEXT,
  in_box_girders TEXT,
  check_accumulation_of_slit TEXT,
  check_peeling_off TEXT,
  check_steel_members TEXT,
  check_condition_of_protective_system TEXT,
  check_corrosion_if_any TEXT,
  check_excessive_vibrations_if_any TEXT,
  check_alignment_of_members TEXT,
  check_condition_for_steel_superstructure TEXT,
  check_excessive_loss_of_camber TEXT,
  check_buckling_kinking_warping_and_waviness TEXT,
  check_apparent_fracture TEXT,
  check_excessive_wear TEXT,
  check_conditions_inside_the_closed_members TEXT,
  check_masonry_arches TEXT,
  check_condition_of_joints_mortar TEXT,
  check_profile_report_flattening TEXT,
  check_cracks_indicate_location_etc TEXT,
  check_drainage_of_spandrel_fillings TEXT,
  check_spalling_images TEXT,
  check_exposed_reinforcement_images TEXT,
  check_cracks_images TEXT,
  check_wear_of_deck_surface_images TEXT,
  check_scaling_images TEXT,
  check_surface_stains_and_rust_stains_images TEXT,
  check_leaching_images TEXT,
  check_corrosion_of_reinforcements_images TEXT,
  check_leakage_images TEXT,
  check_damages_due_to_moving_vehicles_images TEXT,
  check_condition_of_articulation_images TEXT,
  check_excessive_vibrations_images TEXT,
  check_excessive_deflections_loss_of_camber_images TEXT,
  check_excessive_deflections_at_central_hinge_images TEXT,
  check_cracks_around_anchorage_zone_images TEXT,
  check_accumulation_of_slit_images TEXT,
  in_box_girders_images TEXT,
  check_peeling_off_images TEXT,
  check_steel_members_images TEXT,
  check_condition_of_protective_system_images TEXT,
  check_corrosion_if_any_images TEXT,
  check_excessive_vibrations_if_any_images TEXT,
  check_alignment_of_members_images TEXT,
  check_condition_for_steel_superstructure_images TEXT,
  check_buckling_kinking_warping_and_waviness_images TEXT,
  check_excessive_wear_images TEXT,
  check_apparent_fracture_images TEXT,
  check_conditions_inside_the_closed_members_images TEXT,
  check_masonry_arches_images TEXT,
  check_condition_of_joints_mortar_images TEXT,
  check_profile_report_flattening_images TEXT,
  check_cracks_indicate_location_etc_images TEXT,
  check_drainage_of_spandrel_fillings_images TEXT,
  check_excessive_loss_of_camber_images TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS superstructure_bridge (
  superstructure_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  reinforced_concrete_and_prestressed_concrete_members TEXT,
  check_steel_members TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS superstructure_no_of_girders (
  sg_id INTEGER,
  bridge_inspection_id INTEGER,
  superstructure_id INTEGER,
  girder_name TEXT,
  condition_of_girder TEXT,
  girder_length NUMERIC,
  girder_width NUMERIC,
  girder_depth INTEGER,
  girder_distance_x INTEGER,
  girder_distance_y INTEGER,
  created_by INTEGER,
  created_on DATE
);


CREATE TABLE IF NOT EXISTS traffic_lane_on_bridge (
  traffic_lane_id INTEGER,
  traffic_lane_code INTEGER,
  traffic_lane_desc TEXT
);


CREATE TABLE IF NOT EXISTS type_of_bridge (
  type_of_bridge_id INTEGER PRIMARY KEY,
  type_of_bridge_code TEXT,
  type_of_bridge TEXT
);


CREATE TABLE IF NOT EXISTS users (
  uid INTEGER,
  username TEXT,
  pass TEXT,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone_number INTEGER,
  address TEXT,
  state_id INTEGER,
  user_role TEXT,
  user_status TEXT,
  sign TEXT
);


CREATE TABLE IF NOT EXISTS utilities (
  utilities_id INTEGER,
  bridge_inspection_id INTEGER,
  present_lhs TEXT,
  present_rhs TEXT,
  type_of_utility_lhs TEXT,
  type_of_utility_rhs TEXT,
  report_damage_due_to_utility_lhs TEXT,
  report_damage_due_to_utility_rhs TEXT,
  distress_length INTEGER,
  distress_width INTEGER,
  distress_depth INTEGER,
  any_type_of_encroachment_lhs TEXT,
  any_type_of_encroachment_rhs TEXT,
  report_damage_due_to_utility_images TEXT,
  any_type_of_encroachment_images TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS waterway (
  waterway_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  check_presence_of_obstruction_in_flow TEXT,
  check_presence_of_obstruction_in_flow_image TEXT,
  flow_pattern TEXT,
  flow_pattern_image TEXT,
  maximum_flood_level_observed_during_the_year TEXT,
  maximum_flood_level_observed_during_the_year_image TEXT,
  afflux_from_us_and_ds TEXT,
  afflux_from_us_and_ds_image TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS wearing_coat (
  wearing_coat_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER,
  material TEXT,
  surface_condition TEXT,
  surface_condition_distress_length TEXT,
  surface_condition_distress_width TEXT,
  surface_condition_distress_depth TEXT,
  details_of_water_proofing_system TEXT,
  surface_condition_images TEXT,
  details_of_water_proofing_system_images TEXT,
  status TEXT,
  created_by INTEGER,
  created_on DATE,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS wearing_coat_bridge (
  wearing_coat_bridge_id INTEGER PRIMARY KEY,
  bridge_id INTEGER,
  material TEXT,
  status TEXT,
  updated_by INTEGER,
  updated_on DATE
);


CREATE TABLE IF NOT EXISTS zone (
  zone_id INTEGER PRIMARY KEY,
  zone_code TEXT,
  zone_name TEXT
);
