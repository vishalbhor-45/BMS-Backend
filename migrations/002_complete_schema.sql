-- ============================================================================
-- Bridge Management System (BMS) - Complete Database Schema
-- Database: bms2_2
-- Version: 2.0
-- Created: 2026-01-12
-- ============================================================================

-- Enable UUID extension if needed
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================================
-- SECTION 1: DROP EXISTING TABLES (if re-running)
-- ============================================================================
-- Uncomment the following lines if you need to drop all tables
-- DROP TABLE IF EXISTS zone CASCADE;
-- DROP TABLE IF EXISTS wearing_coat_bridge CASCADE;
-- DROP TABLE IF EXISTS wearing_coat CASCADE;
-- ... (add all tables in reverse dependency order)

-- ============================================================================
-- SECTION 2: CREATE SEQUENCES FOR AUTO-INCREMENTING IDs
-- ============================================================================

-- Bridge sequences
CREATE SEQUENCE IF NOT EXISTS bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS bridge_inspection_id_seq START WITH 1 INCREMENT BY 1;

-- User sequence
CREATE SEQUENCE IF NOT EXISTS user_id_seq START WITH 1 INCREMENT BY 1;

-- Component sequences
CREATE SEQUENCE IF NOT EXISTS approaches_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS bearing_and_pedistal_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS bearing_and_pedistal_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS expansion_joint_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS expansion_joint_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS foundation_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS foundation_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS general_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS handrails_parapets_crash_barriers_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS protection_works_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS structure_data_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS substructure_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS substructure_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS superstructure_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS superstructure_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS waterway_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS wearing_coat_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS wearing_coat_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS footpath_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS subway_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS non_structural_element_id_seq START WITH 1 INCREMENT BY 1;

-- Lookup table sequences
CREATE SEQUENCE IF NOT EXISTS state_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS zone_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS road_type_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS type_of_bridge_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS structural_rating_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_for_abrasion_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_for_alkali_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_for_carbonation_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_for_carbon_dioxide_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_for_erosion_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_for_fatigue_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_for_impact_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_for_overload_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_for_temperature_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_of_settlement_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS rating_of_shrinkage_id_seq START WITH 1 INCREMENT BY 1;

-- ============================================================================
-- SECTION 3: CREATE LOOKUP TABLES (no dependencies)
-- ============================================================================

-- State table
CREATE TABLE IF NOT EXISTS state (
  state_id INTEGER PRIMARY KEY DEFAULT nextval('state_id_seq'),
  state_name TEXT NOT NULL,
  state_code TEXT UNIQUE,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Zone table
CREATE TABLE IF NOT EXISTS zone (
  zone_id INTEGER PRIMARY KEY DEFAULT nextval('zone_id_seq'),
  zone_code TEXT UNIQUE,
  zone_name TEXT NOT NULL,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Road type table
CREATE TABLE IF NOT EXISTS road_type (
  road_type_id INTEGER PRIMARY KEY DEFAULT nextval('road_type_id_seq'),
  road_code TEXT UNIQUE,
  road_type TEXT NOT NULL,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Type of bridge table
CREATE TABLE IF NOT EXISTS type_of_bridge (
  type_of_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('type_of_bridge_id_seq'),
  type_of_bridge_code TEXT UNIQUE,
  type_of_bridge TEXT NOT NULL,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Structural rating table
CREATE TABLE IF NOT EXISTS structural_rating (
  structural_rating_id INTEGER PRIMARY KEY DEFAULT nextval('structural_rating_id_seq'),
  structural_rating_code INTEGER UNIQUE,
  structural_rating_title TEXT NOT NULL,
  structural_rating_desc TEXT,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Rating tables
CREATE TABLE IF NOT EXISTS rating_for_abrasion (
  rating_for_abrasion_id INTEGER PRIMARY KEY DEFAULT nextval('rating_for_abrasion_id_seq'),
  rating_for_abrasion_code INTEGER UNIQUE,
  rating_for_abrasion_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_for_alkali (
  rating_for_alkali_id INTEGER PRIMARY KEY DEFAULT nextval('rating_for_alkali_id_seq'),
  rating_for_alkali_code INTEGER UNIQUE,
  rating_for_alkali_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_for_carbonation (
  rating_for_carbonation_id INTEGER PRIMARY KEY DEFAULT nextval('rating_for_carbonation_id_seq'),
  rating_for_carbonation_code INTEGER UNIQUE,
  rating_for_carbonation_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_for_carbon_dioxide (
  rating_for_carbon_dioxide_id INTEGER PRIMARY KEY DEFAULT nextval('rating_for_carbon_dioxide_id_seq'),
  rating_for_carbon_dioxide_code INTEGER UNIQUE,
  rating_for_carbon_dioxide_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_for_erosion (
  rating_for_erosion_id INTEGER PRIMARY KEY DEFAULT nextval('rating_for_erosion_id_seq'),
  rating_for_erosion_code INTEGER UNIQUE,
  rating_for_erosion_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_for_fatigue (
  rating_for_fatigue_id INTEGER PRIMARY KEY DEFAULT nextval('rating_for_fatigue_id_seq'),
  rating_for_fatigue_code INTEGER UNIQUE,
  rating_for_fatigue_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_for_impact (
  rating_for_impact_id INTEGER PRIMARY KEY DEFAULT nextval('rating_for_impact_id_seq'),
  rating_for_impact_code INTEGER UNIQUE,
  rating_for_impact_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_for_overload (
  rating_for_overload_id INTEGER PRIMARY KEY DEFAULT nextval('rating_for_overload_id_seq'),
  rating_for_overload_code INTEGER UNIQUE,
  rating_for_overload_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_for_temperature (
  rating_for_temperature_id INTEGER PRIMARY KEY DEFAULT nextval('rating_for_temperature_id_seq'),
  rating_for_temperature_code INTEGER UNIQUE,
  rating_for_temperature_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_of_settlement (
  rating_of_settlement_id INTEGER PRIMARY KEY DEFAULT nextval('rating_of_settlement_id_seq'),
  rating_of_settlement_code INTEGER UNIQUE,
  rating_of_settlement_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_of_shrinkage (
  rating_of_shrinkage_id INTEGER PRIMARY KEY DEFAULT nextval('rating_of_shrinkage_id_seq'),
  rating_of_shrinkage_code INTEGER UNIQUE,
  rating_of_shrinkage_desc TEXT NOT NULL
);

-- Other rating lookup tables
CREATE TABLE IF NOT EXISTS rating_alternate_route (
  route_id INTEGER PRIMARY KEY,
  route_rating_code INTEGER UNIQUE,
  route_rating TEXT NOT NULL,
  route_rating_desc TEXT
);

CREATE TABLE IF NOT EXISTS rating_environmental_impact (
  er_id INTEGER PRIMARY KEY,
  environmental_impact_rating_code INTEGER UNIQUE,
  environmental_impact_rating TEXT NOT NULL,
  environmental_impact_rating_desc TEXT
);

CREATE TABLE IF NOT EXISTS rating_for_economic_growth_potential (
  economic_growth_potential_id INTEGER PRIMARY KEY,
  economic_growth_potential_code INTEGER UNIQUE,
  economic_growth_potential_rating TEXT NOT NULL,
  economic_growth_potential_desc TEXT
);

CREATE TABLE IF NOT EXISTS rating_for_social_importance (
  social_importance_id INTEGER PRIMARY KEY,
  social_importance_code INTEGER UNIQUE,
  social_importance_rating TEXT NOT NULL,
  social_importance_desc TEXT
);

CREATE TABLE IF NOT EXISTS rating_for_sulphates (
  rating_for_sulphates_id INTEGER PRIMARY KEY,
  rating_for_sulphates_code INTEGER UNIQUE,
  rating_for_sulphates_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_for_vertical_clearance (
  vertical_clearance_id INTEGER PRIMARY KEY,
  road_type TEXT,
  vertical_clearance_rating_code INTEGER,
  vertical_clearance_rating TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_of_average_daily_traffic (
  daily_traffic_id INTEGER PRIMARY KEY,
  traffic_rating_code INTEGER UNIQUE,
  traffic_rating TEXT NOT NULL,
  traffic_rating_desc TEXT
);

CREATE TABLE IF NOT EXISTS rating_of_deck_geometry (
  geometry_rating_id INTEGER PRIMARY KEY,
  geometry_rating_code INTEGER UNIQUE,
  geometry_rating TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rating_of_waterway_adequacy (
  waterway_adequacy_id INTEGER PRIMARY KEY,
  waterway_rating_code TEXT UNIQUE,
  waterway_rating TEXT NOT NULL,
  waterway_rating_desc TEXT
);

-- Other lookup tables
CREATE TABLE IF NOT EXISTS age_of_brdge (
  age_id INTEGER PRIMARY KEY,
  age_when_inspection_done_first TEXT,
  age_code INTEGER
);

CREATE TABLE IF NOT EXISTS bridge_side (
  id INTEGER PRIMARY KEY,
  bridge_sides TEXT NOT NULL,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS hydraluic_tone_weightage (
  htw_id INTEGER PRIMARY KEY,
  hydraluic_tone_code INTEGER UNIQUE,
  hydraluic_tone_rating TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS loading_icr (
  l_id INTEGER PRIMARY KEY,
  loading_code TEXT UNIQUE,
  allowed_loading TEXT NOT NULL,
  loading_rating_code INTEGER
);

CREATE TABLE IF NOT EXISTS material_of_construction (
  moc_id INTEGER PRIMARY KEY,
  material_of_construction_code TEXT UNIQUE,
  material_of_construction_description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS material_of_construction_bkp (
  moc_id INTEGER PRIMARY KEY,
  material_of_construction_code TEXT UNIQUE,
  material_of_construction_description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS structural_crossing_feature (
  cf_id INTEGER PRIMARY KEY,
  structural_crossing_feature_code INTEGER UNIQUE,
  structural_crossing_feature_description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS structural_form (
  sf_id INTEGER PRIMARY KEY,
  structural_form_code INTEGER UNIQUE,
  structural_form_description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS structural_form_bkp (
  sf_id INTEGER PRIMARY KEY,
  structural_form_code INTEGER UNIQUE,
  structural_form_description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS state_bkp (
  state_id INTEGER PRIMARY KEY,
  state_name TEXT NOT NULL,
  state_code TEXT
);

CREATE TABLE IF NOT EXISTS traffic_lane_on_bridge (
  traffic_lane_id INTEGER PRIMARY KEY,
  traffic_lane_code INTEGER UNIQUE,
  traffic_lane_desc TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS company_firms (
  firm_id INTEGER PRIMARY KEY,
  firm_name TEXT NOT NULL,
  firm_code TEXT UNIQUE,
  current_year TEXT,
  current_challan INTEGER DEFAULT 0,
  current_invoice INTEGER DEFAULT 0,
  credit_number INTEGER DEFAULT 0,
  debit_number INTEGER DEFAULT 0,
  cash_invoice_no INTEGER DEFAULT 0,
  lot_no INTEGER DEFAULT 0,
  rev_no INTEGER DEFAULT 0,
  year_code TEXT,
  grin_no INTEGER DEFAULT 0,
  mid_no INTEGER DEFAULT 0,
  material_inward_no INTEGER DEFAULT 0,
  order_id INTEGER DEFAULT 0,
  quotation_id INTEGER DEFAULT 0,
  spo_number INTEGER DEFAULT 0,
  sales_order_id INTEGER DEFAULT 0,
  po_number INTEGER DEFAULT 0,
  inward_stock_id INTEGER DEFAULT 0,
  stock_transfer_id INTEGER DEFAULT 0,
  gst_num TEXT,
  state_code INTEGER,
  state_name TEXT,
  firm_address TEXT,
  firm_email TEXT,
  firm_mobile TEXT,
  firm_jurisdiction TEXT,
  logo_image TEXT,
  status TEXT DEFAULT 'active',
  parent_firm INTEGER,
  disply_name TEXT,
  asso_client_id INTEGER,
  asso_supplier_id INTEGER,
  receipt_number INTEGER DEFAULT 0,
  booking_id INTEGER DEFAULT 0,
  job_number INTEGER DEFAULT 0,
  address TEXT,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- SECTION 4: CREATE MAIN TABLES
-- ============================================================================

-- Users table
CREATE TABLE IF NOT EXISTS users (
  uid INTEGER PRIMARY KEY DEFAULT nextval('user_id_seq'),
  username TEXT UNIQUE NOT NULL,
  pass TEXT NOT NULL,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone_number INTEGER,
  address TEXT,
  state_id INTEGER,
  user_role TEXT NOT NULL CHECK (user_role IN ('siteengg', 'bmcuser', 'admin')),
  user_status TEXT DEFAULT 'active' CHECK (user_status IN ('active', 'inactive', 'suspended')),
  sign TEXT,
  created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_user_state FOREIGN KEY (state_id) REFERENCES state(state_id) ON DELETE SET NULL
);

-- Bridge table (main table)
CREATE TABLE IF NOT EXISTS bridge (
  bridge_id INTEGER PRIMARY KEY DEFAULT nextval('bridge_id_seq'),
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
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected', 'draft')),
  created_on DATE DEFAULT CURRENT_DATE,
  created_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  form_filled TEXT,
  bmc_status TEXT CHECK (bmc_status IN ('pending', 'approved', 'rejected', NULL)),
  bmc_user INTEGER,
  bmc_status_updated_on TEXT,
  is_inspecion_schedule TEXT DEFAULT 'no' CHECK (is_inspecion_schedule IN ('yes', 'no')),
  bridge_identity_no TEXT UNIQUE,
  design_discharge_in_cumecs TEXT,
  CONSTRAINT fk_bridge_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_bridge_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_bridge_bmc_user FOREIGN KEY (bmc_user) REFERENCES users(uid) ON DELETE SET NULL
);

-- Bridge inspection table
CREATE TABLE IF NOT EXISTS bridge_inspection (
  bridge_inspection_id INTEGER PRIMARY KEY DEFAULT nextval('bridge_inspection_id_seq'),
  bridge_id INTEGER NOT NULL,
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
  bmc_inspection_status TEXT DEFAULT 'pending' CHECK (bmc_inspection_status IN ('pending', 'approved', 'rejected', 'ongoing')),
  bmc_user INTEGER,
  bmc_inspection_status_date TEXT,
  remark TEXT,
  status TEXT DEFAULT 'draft' CHECK (status IN ('draft', 'scheduled', 'ongoing', 'completed', 'approved', 'rejected')),
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  upadted_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_inspection_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_inspection_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_inspection_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_inspection_bmc_user FOREIGN KEY (bmc_user) REFERENCES users(uid) ON DELETE SET NULL
);

-- ============================================================================
-- SECTION 5: CREATE BRIDGE COMPONENT TABLES
-- ============================================================================

-- Structure data bridge
CREATE TABLE IF NOT EXISTS structure_data_bridge (
  structure_data_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('structure_data_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_structure_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_structure_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_structure_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- General bridge
CREATE TABLE IF NOT EXISTS general_bridge (
  general_id INTEGER PRIMARY KEY DEFAULT nextval('general_id_seq'),
  bridge_id INTEGER NOT NULL,
  corrosion_protection_measures INTEGER,
  bank_protection_and_type TEXT,
  floor_protection TEXT,
  floor_type TEXT,
  bridge_located_in_back_water_or_chemical_affected_water TEXT,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_general_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_general_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_general_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Approaches bridge
CREATE TABLE IF NOT EXISTS approaches_bridge (
  approaches_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('approaches_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
  type_of_terrain TEXT,
  type_of_approach TEXT,
  material_of_approach TEXT,
  approach_geometrics TEXT,
  approaches_having_span TEXT,
  wall_type_and_height TEXT,
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_approaches_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_approaches_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Protection works bridge
CREATE TABLE IF NOT EXISTS protection_works_bridge (
  protection_works_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('protection_works_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
  type TEXT,
  reserve_store_material TEXT,
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_protection_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_protection_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Foundation bridge
CREATE TABLE IF NOT EXISTS foundation_bridge (
  foundation_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('foundation_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
  foundation_type TEXT,
  material TEXT,
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_foundation_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_foundation_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Substructure bridge
CREATE TABLE IF NOT EXISTS substructure_bridge (
  substructure_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('substructure_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
  type_a1 TEXT,
  type_a2 TEXT,
  substructure_material_a1 TEXT,
  substructure_material_a2 TEXT,
  max_depth_abutment_found_a1 INTEGER,
  max_depth_abutment_found_a2 INTEGER,
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_substructure_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_substructure_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Substructure piers bridge
CREATE TABLE IF NOT EXISTS substructure_piers_bridge (
  p_id INTEGER PRIMARY KEY,
  substructure_bridge_id INTEGER,
  bridge_id INTEGER NOT NULL,
  type TEXT,
  substructure_material TEXT,
  condition TEXT,
  efficiency_of_drainage TEXT,
  max_depth_of_abutment_foundation INTEGER,
  piler_name TEXT,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_piers_substructure FOREIGN KEY (substructure_bridge_id) REFERENCES substructure_bridge(substructure_bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_piers_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_piers_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_piers_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Bearing and pedestal bridge
CREATE TABLE IF NOT EXISTS bearing_and_pedistal_bridge (
  bearing_and_pedistal_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('bearing_and_pedistal_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_bearing_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_bearing_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Superstructure bridge
CREATE TABLE IF NOT EXISTS superstructure_bridge (
  superstructure_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('superstructure_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
  reinforced_concrete_and_prestressed_concrete_members TEXT,
  check_steel_members TEXT,
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_superstructure_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_superstructure_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Expansion joint bridge
CREATE TABLE IF NOT EXISTS expansion_joint_bridge (
  expansion_joint_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('expansion_joint_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
  type_a1 TEXT,
  type_a2 TEXT,
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_expansion_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_expansion_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Expansion joint bridge items
CREATE TABLE IF NOT EXISTS expansion_joint_bridge_items (
  id INTEGER PRIMARY KEY,
  bridge_id INTEGER NOT NULL,
  expansion_name TEXT,
  expansion_type TEXT,
  default_condition TEXT,
  display_order INTEGER,
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_expansion_items_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_expansion_items_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_expansion_items_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Wearing coat bridge
CREATE TABLE IF NOT EXISTS wearing_coat_bridge (
  wearing_coat_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('wearing_coat_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
  material TEXT,
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_wearing_coat_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_wearing_coat_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Handrails parapets crash barriers bridge
CREATE TABLE IF NOT EXISTS handrails_parapets_crash_barriers_bridge (
  handrails_parapets_crash_barriers_bridge_id INTEGER PRIMARY KEY DEFAULT nextval('handrails_parapets_crash_barriers_bridge_id_seq'),
  bridge_id INTEGER NOT NULL,
  material_lhs TEXT,
  material_rhs TEXT,
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_handrails_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_handrails_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Span arrangement
CREATE TABLE IF NOT EXISTS sapn_arrangment (
  sp_id INTEGER PRIMARY KEY,
  bridge_id INTEGER NOT NULL,
  span_material TEXT,
  span_type TEXT,
  span_length INTEGER,
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_span_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_span_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- ============================================================================
-- SECTION 6: CREATE INSPECTION COMPONENT TABLES
-- ============================================================================

-- Approaches (inspection)
CREATE TABLE IF NOT EXISTS approaches (
  approaches_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_approaches_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_approaches_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_approaches_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Bearing and pedestal (inspection)
CREATE TABLE IF NOT EXISTS bearing_and_pedistal (
  bearing_and_pedistal_id INTEGER PRIMARY KEY DEFAULT nextval('bearing_and_pedistal_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_bearing_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_bearing_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_bearing_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Bearing and pedestal condition
CREATE TABLE IF NOT EXISTS bearing_and_pedistal_condition (
  bpc_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
  bearing_and_pedistal_id INTEGER,
  pedestal_condition TEXT,
  pedestal_condition_length INTEGER,
  pedestal_condition_width INTEGER,
  pedestal_condition_depth INTEGER,
  pedestal_condition_distance_x INTEGER,
  pedestal_condition_distance_y INTEGER,
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  name_of_span TEXT,
  CONSTRAINT fk_bearing_condition_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_bearing_condition_bearing FOREIGN KEY (bearing_and_pedistal_id) REFERENCES bearing_and_pedistal(bearing_and_pedistal_id) ON DELETE CASCADE,
  CONSTRAINT fk_bearing_condition_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Bearing rating details
CREATE TABLE IF NOT EXISTS bearing_rating_details (
  id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
  component_type TEXT,
  form_no INTEGER,
  bearing_name TEXT,
  bearing_type TEXT,
  bearing_condition TEXT,
  images TEXT,
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_bearing_rating_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_bearing_rating_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_bearing_rating_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Drainage spouts and vest holes
CREATE TABLE IF NOT EXISTS drainage_spouts_and_vest_holes (
  drainage_spouts_and_vest_holes_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_drainage_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_drainage_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_drainage_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Expansion joint (inspection)
CREATE TABLE IF NOT EXISTS expansion_joint (
  expansion_joint_id INTEGER PRIMARY KEY DEFAULT nextval('expansion_joint_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_expansion_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_expansion_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_expansion_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Expansion joint pilers
CREATE TABLE IF NOT EXISTS expansion_joint_pilers (
  expansion_pilers_id INTEGER PRIMARY KEY,
  expansion_joint_id INTEGER,
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_expansion_pilers_joint FOREIGN KEY (expansion_joint_id) REFERENCES expansion_joint(expansion_joint_id) ON DELETE CASCADE,
  CONSTRAINT fk_expansion_pilers_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_expansion_pilers_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_expansion_pilers_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Footpaths
CREATE TABLE IF NOT EXISTS footpaths (
  footpath_id INTEGER PRIMARY KEY DEFAULT nextval('footpath_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
  present_lhs TEXT,
  present_rhs TEXT,
  material_lhs TEXT,
  material_rhs TEXT,
  conditions_lhs TEXT,
  conditions_rhs TEXT,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_footpaths_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_footpaths_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_footpaths_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Foundation (inspection)
CREATE TABLE IF NOT EXISTS foundation (
  foundation_id INTEGER PRIMARY KEY DEFAULT nextval('foundation_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
  foundation_type TEXT,
  foundation_name TEXT,
  material TEXT,
  floating_bodies_boulders TEXT,
  floating_bodies_boulders_image TEXT,
  seepage_vehicle_impact TEXT,
  seepage_vehicle_impact_image TEXT,
  condition_of_foundation TEXT,
  condition_of_foundation_image TEXT,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_foundation_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_foundation_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_foundation_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- General (inspection)
CREATE TABLE IF NOT EXISTS general (
  general_id INTEGER PRIMARY KEY DEFAULT nextval('general_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
  corrosion_protection_measures INTEGER,
  bank_protection_and_type TEXT,
  floor_protection TEXT,
  floor_type TEXT,
  bridge_located_in_back_water_or_chemical_affected_water TEXT,
  whether_guard_rail_or_crash_barrier TEXT,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_general_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_general_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_general_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Handrails parapets crash barriers (inspection)
CREATE TABLE IF NOT EXISTS handrails_parapets_crash_barriers (
  handrails_parapets_crash_barriers_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_handrails_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_handrails_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_handrails_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Protection works (inspection)
CREATE TABLE IF NOT EXISTS protection_works (
  protection_works_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
  type TEXT,
  layout_cross_section_profile TEXT,
  slope_pitching_apron_and_toe_walls TEXT,
  floor_protection_works TEXT,
  scour_for_abutments TEXT,
  scour_for_abutments_image TEXT,
  scour_for_piers TEXT,
  scour_for_piers_image TEXT,
  reserve_store_material TEXT,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_protection_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_protection_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_protection_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Substructure (inspection)
CREATE TABLE IF NOT EXISTS substructure (
  substructure_id INTEGER PRIMARY KEY DEFAULT nextval('substructure_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_substructure_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_substructure_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_substructure_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Subways
CREATE TABLE IF NOT EXISTS subways (
  subway_id INTEGER PRIMARY KEY DEFAULT nextval('subway_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_subways_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_subways_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_subways_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Superstructure (inspection)
CREATE TABLE IF NOT EXISTS superstructure (
  superstructure_id INTEGER PRIMARY KEY DEFAULT nextval('superstructure_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_superstructure_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_superstructure_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_superstructure_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Superstructure no of girders
CREATE TABLE IF NOT EXISTS superstructure_no_of_girders (
  sg_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
  superstructure_id INTEGER,
  girder_name TEXT,
  condition_of_girder TEXT,
  girder_length NUMERIC,
  girder_width NUMERIC,
  girder_depth INTEGER,
  girder_distance_x INTEGER,
  girder_distance_y INTEGER,
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_girders_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_girders_superstructure FOREIGN KEY (superstructure_id) REFERENCES superstructure(superstructure_id) ON DELETE CASCADE,
  CONSTRAINT fk_girders_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Utilities
CREATE TABLE IF NOT EXISTS utilities (
  utilities_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_utilities_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_utilities_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_utilities_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Waterway
CREATE TABLE IF NOT EXISTS waterway (
  waterway_id INTEGER PRIMARY KEY DEFAULT nextval('waterway_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
  check_presence_of_obstruction_in_flow TEXT,
  check_presence_of_obstruction_in_flow_image TEXT,
  flow_pattern TEXT,
  flow_pattern_image TEXT,
  maximum_flood_level_observed_during_the_year TEXT,
  maximum_flood_level_observed_during_the_year_image TEXT,
  afflux_from_us_and_ds TEXT,
  afflux_from_us_and_ds_image TEXT,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_waterway_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_waterway_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_waterway_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Wearing coat (inspection)
CREATE TABLE IF NOT EXISTS wearing_coat (
  wearing_coat_id INTEGER PRIMARY KEY DEFAULT nextval('wearing_coat_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
  material TEXT,
  surface_condition TEXT,
  surface_condition_distress_length TEXT,
  surface_condition_distress_width TEXT,
  surface_condition_distress_depth TEXT,
  details_of_water_proofing_system TEXT,
  surface_condition_images TEXT,
  details_of_water_proofing_system_images TEXT,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_wearing_coat_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_wearing_coat_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_wearing_coat_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- ============================================================================
-- SECTION 7: CREATE INSPECTION RATING AND DISTRESS TABLES
-- ============================================================================

-- Inspection component rating
CREATE TABLE IF NOT EXISTS inspection_component_rating (
  id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
  rating_id INTEGER,
  component_type TEXT,
  bearing_and_pedestal_name TEXT,
  bearing_type TEXT,
  component_name TEXT,
  foundation_id INTEGER,
  superstructure_id INTEGER,
  expansion_joint_id INTEGER,
  form_no INTEGER,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_component_rating_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_component_rating_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_component_rating_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Inspection cause rating
CREATE TABLE IF NOT EXISTS inspection_cause_rating (
  id INTEGER PRIMARY KEY,
  inspection_distress_id INTEGER,
  bridge_inspection_id INTEGER NOT NULL,
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
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_cause_rating_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_cause_rating_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Bridge inspection distress
CREATE TABLE IF NOT EXISTS bridge_inspection_distress (
  id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
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
  created_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_distress_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_distress_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Overall bridge rating
CREATE TABLE IF NOT EXISTS overall_bridge_rating (
  id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
  rating_id INTEGER,
  bmc_rejected TEXT,
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_overall_rating_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_overall_rating_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL,
  CONSTRAINT fk_overall_rating_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Non-structural elements
CREATE TABLE IF NOT EXISTS non_structural_elements (
  non_structural_element_id INTEGER PRIMARY KEY DEFAULT nextval('non_structural_element_id_seq'),
  bridge_inspection_id INTEGER NOT NULL,
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
  status TEXT DEFAULT 'active',
  created_by INTEGER,
  created_on DATE DEFAULT CURRENT_DATE,
  updated_by TEXT,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_non_structural_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_non_structural_created_by FOREIGN KEY (created_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- ============================================================================
-- SECTION 8: CREATE SCHEDULING AND COMMENT TABLES
-- ============================================================================

-- Schedule inspection
CREATE TABLE IF NOT EXISTS schedule_inspecion (
  si_id INTEGER PRIMARY KEY,
  bridge_id INTEGER NOT NULL,
  pre_month INTEGER,
  post_month INTEGER,
  routine_inspecion_month INTEGER,
  routine_inspecion_frequency TEXT,
  status TEXT DEFAULT 'active',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_schedule_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_schedule_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Schedule adhoc inspection
CREATE TABLE IF NOT EXISTS schedule_adhoc_inspecion (
  adhoc_inspecion_id INTEGER PRIMARY KEY,
  bridge_id INTEGER NOT NULL,
  adhoc_inspecion_date DATE NOT NULL,
  comment TEXT,
  status TEXT DEFAULT 'scheduled',
  updated_by INTEGER,
  updated_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_adhoc_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_adhoc_updated_by FOREIGN KEY (updated_by) REFERENCES users(uid) ON DELETE SET NULL
);

-- Schedule inspection notification
CREATE TABLE IF NOT EXISTS schedule_inspecion_notification (
  notification_id INTEGER PRIMARY KEY,
  bridge_id INTEGER NOT NULL,
  si_id INTEGER,
  adhoc_inspecion_id INTEGER,
  inspecion_type TEXT CHECK (inspecion_type IN ('routine', 'adhoc')),
  reminder_date DATE NOT NULL,
  status TEXT DEFAULT 'pending',
  CONSTRAINT fk_notification_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_notification_schedule FOREIGN KEY (si_id) REFERENCES schedule_inspecion(si_id) ON DELETE CASCADE,
  CONSTRAINT fk_notification_adhoc FOREIGN KEY (adhoc_inspecion_id) REFERENCES schedule_adhoc_inspecion(adhoc_inspecion_id) ON DELETE CASCADE
);

-- Bridge rejection comment
CREATE TABLE IF NOT EXISTS bridge_rejection_comment (
  rejection_id INTEGER PRIMARY KEY,
  bridge_id INTEGER NOT NULL,
  comment TEXT NOT NULL,
  comment_by INTEGER NOT NULL,
  comment_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_bridge_rejection_bridge FOREIGN KEY (bridge_id) REFERENCES bridge(bridge_id) ON DELETE CASCADE,
  CONSTRAINT fk_bridge_rejection_user FOREIGN KEY (comment_by) REFERENCES users(uid) ON DELETE CASCADE
);

-- Bridge inspection rejection comment
CREATE TABLE IF NOT EXISTS bridge_inspection_rejection_comment (
  rejection_id INTEGER PRIMARY KEY,
  bridge_inspection_id INTEGER NOT NULL,
  comment TEXT NOT NULL,
  comment_by INTEGER NOT NULL,
  comment_on DATE DEFAULT CURRENT_DATE,
  CONSTRAINT fk_inspection_rejection_inspection FOREIGN KEY (bridge_inspection_id) REFERENCES bridge_inspection(bridge_inspection_id) ON DELETE CASCADE,
  CONSTRAINT fk_inspection_rejection_user FOREIGN KEY (comment_by) REFERENCES users(uid) ON DELETE CASCADE
);

-- ============================================================================
-- SECTION 9: CREATE INDEXES FOR PERFORMANCE
-- ============================================================================

-- Bridge indexes
CREATE INDEX IF NOT EXISTS idx_bridge_status ON bridge(status);
CREATE INDEX IF NOT EXISTS idx_bridge_bmc_status ON bridge(bmc_status);
CREATE INDEX IF NOT EXISTS idx_bridge_created_by ON bridge(created_by);
CREATE INDEX IF NOT EXISTS idx_bridge_bridge_identity_no ON bridge(bridge_identity_no);
CREATE INDEX IF NOT EXISTS idx_bridge_state_zone ON bridge(state_id, zone);

-- Bridge inspection indexes
CREATE INDEX IF NOT EXISTS idx_bridge_inspection_bridge_id ON bridge_inspection(bridge_id);
CREATE INDEX IF NOT EXISTS idx_bridge_inspection_status ON bridge_inspection(status);
CREATE INDEX IF NOT EXISTS idx_bridge_inspection_bmc_status ON bridge_inspection(bmc_inspection_status);
CREATE INDEX IF NOT EXISTS idx_bridge_inspection_created_by ON bridge_inspection(created_by);
CREATE INDEX IF NOT EXISTS idx_bridge_inspection_created_on ON bridge_inspection(created_on);

-- Users indexes
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(user_role);
CREATE INDEX IF NOT EXISTS idx_users_status ON users(user_status);

-- Component bridge indexes
CREATE INDEX IF NOT EXISTS idx_structure_data_bridge_id ON structure_data_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_general_bridge_id ON general_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_approaches_bridge_id ON approaches_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_protection_works_bridge_id ON protection_works_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_foundation_bridge_id ON foundation_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_substructure_bridge_id ON substructure_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_bearing_bridge_id ON bearing_and_pedistal_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_superstructure_bridge_id ON superstructure_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_expansion_bridge_id ON expansion_joint_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_wearing_coat_bridge_id ON wearing_coat_bridge(bridge_id);
CREATE INDEX IF NOT EXISTS idx_handrails_bridge_id ON handrails_parapets_crash_barriers_bridge(bridge_id);

-- Inspection component indexes
CREATE INDEX IF NOT EXISTS idx_approaches_inspection_id ON approaches(bridge_inspection_id);
CREATE INDEX IF NOT EXISTS idx_bearing_inspection_id ON bearing_and_pedistal(bridge_inspection_id);
CREATE INDEX IF NOT EXISTS idx_expansion_inspection_id ON expansion_joint(bridge_inspection_id);
CREATE INDEX IF NOT EXISTS idx_foundation_inspection_id ON foundation(bridge_inspection_id);
CREATE INDEX IF NOT EXISTS idx_general_inspection_id ON general(bridge_inspection_id);
CREATE INDEX IF NOT EXISTS idx_protection_inspection_id ON protection_works(bridge_inspection_id);
CREATE INDEX IF NOT EXISTS idx_substructure_inspection_id ON substructure(bridge_inspection_id);
CREATE INDEX IF NOT EXISTS idx_superstructure_inspection_id ON superstructure(bridge_inspection_id);
CREATE INDEX IF NOT EXISTS idx_waterway_inspection_id ON waterway(bridge_inspection_id);
CREATE INDEX IF NOT EXISTS idx_wearing_coat_inspection_id ON wearing_coat(bridge_inspection_id);

-- Scheduling indexes
CREATE INDEX IF NOT EXISTS idx_schedule_bridge_id ON schedule_inspecion(bridge_id);
CREATE INDEX IF NOT EXISTS idx_adhoc_bridge_id ON schedule_adhoc_inspecion(bridge_id);
CREATE INDEX IF NOT EXISTS idx_adhoc_date ON schedule_adhoc_inspecion(adhoc_inspecion_date);
CREATE INDEX IF NOT EXISTS idx_notification_bridge_id ON schedule_inspecion_notification(bridge_id);
CREATE INDEX IF NOT EXISTS idx_notification_reminder_date ON schedule_inspecion_notification(reminder_date);

-- ============================================================================
-- SECTION 10: INSERT INITIAL DATA (OPTIONAL)
-- ============================================================================

-- Insert default admin user (password should be hashed in production)
-- Password: admin123 (change this!)
INSERT INTO users (uid, username, pass, first_name, last_name, email, user_role, user_status)
VALUES (1, 'admin', '$2a$10$rOzJqZqZqZqZqZqZqZqZqOqZqZqZqZqZqZqZqZqZqZqZqZqZqZq', 'Admin', 'User', 'admin@bms.com', 'admin', 'active')
ON CONFLICT (uid) DO NOTHING;

-- Insert default site engineer user
-- Password: siteengg123 (change this!)
INSERT INTO users (uid, username, pass, first_name, last_name, email, user_role, user_status)
VALUES (2, 'siteengg', '$2a$10$rOzJqZqZqZqZqZqZqZqZqOqZqZqZqZqZqZqZqZqZqZqZqZqZq', 'Site', 'Engineer', 'siteengg@bms.com', 'siteengg', 'active')
ON CONFLICT (uid) DO NOTHING;

-- Insert default BMC user
-- Password: bmcuser123 (change this!)
INSERT INTO users (uid, username, pass, first_name, last_name, email, user_role, user_status)
VALUES (3, 'bmcuser', '$2a$10$rOzJqZqZqZqZqZqZqZqZqOqZqZqZqZqZqZqZqZqZqZqZqZqZq', 'BMC', 'User', 'bmcuser@bms.com', 'bmcuser', 'active')
ON CONFLICT (uid) DO NOTHING;

-- Insert sample states (India)
INSERT INTO state (state_id, state_name, state_code) VALUES
(1, 'Maharashtra', 'MH'),
(2, 'Gujarat', 'GJ'),
(3, 'Rajasthan', 'RJ'),
(4, 'Madhya Pradesh', 'MP'),
(5, 'Uttar Pradesh', 'UP'),
(6, 'Telangana', 'TS')
ON CONFLICT (state_id) DO NOTHING;

-- Insert sample zones
INSERT INTO zone (zone_id, zone_code, zone_name) VALUES
(1, 'ZONE1', 'Zone 1'),
(2, 'ZONE2', 'Zone 2'),
(3, 'ZONE3', 'Zone 3')
ON CONFLICT (zone_id) DO NOTHING;

-- Insert road types
INSERT INTO road_type (road_type_id, road_code, road_type) VALUES
(1, 'NH', 'National Highway'),
(2, 'SH', 'State Highway'),
(3, 'MDR', 'Major District Road'),
(4, 'ODR', 'Other District Road')
ON CONFLICT (road_type_id) DO NOTHING;

-- Insert bridge types
INSERT INTO type_of_bridge (type_of_bridge_id, type_of_bridge_code, type_of_bridge) VALUES
(1, 'RC', 'Reinforced Concrete'),
(2, 'PSC', 'Prestressed Concrete'),
(3, 'STEEL', 'Steel'),
(4, 'COMPOSITE', 'Composite'),
(5, 'MASONRY', 'Masonry')
ON CONFLICT (type_of_bridge_id) DO NOTHING;

-- ============================================================================
-- SECTION 11: COMMENTS AND DOCUMENTATION
-- ============================================================================

COMMENT ON TABLE bridge IS 'Main bridge inventory table containing all bridge information';
COMMENT ON TABLE bridge_inspection IS 'Bridge inspection records linked to bridges';
COMMENT ON TABLE users IS 'System users with roles: siteengg, bmcuser, admin';
COMMENT ON TABLE schedule_inspecion IS 'Routine inspection schedules for bridges';
COMMENT ON TABLE schedule_adhoc_inspecion IS 'Ad-hoc inspection schedules for bridges';

COMMENT ON COLUMN bridge.status IS 'Bridge status: pending, approved, rejected, draft';
COMMENT ON COLUMN bridge.bmc_status IS 'BMC approval status: pending, approved, rejected';
COMMENT ON COLUMN bridge_inspection.status IS 'Inspection status: draft, scheduled, ongoing, completed, approved, rejected';
COMMENT ON COLUMN bridge_inspection.bmc_inspection_status IS 'BMC inspection status: pending, approved, rejected, ongoing';
COMMENT ON COLUMN users.user_role IS 'User role: siteengg (Site Engineer), bmcuser (BMC User), admin';

-- ============================================================================
-- END OF SCHEMA
-- ============================================================================

-- Verify tables created
SELECT 'Schema created successfully!' AS message;
SELECT COUNT(*) AS total_tables FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE';

