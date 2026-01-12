import express from 'express';
import { 
  getAllBridges,
  getBridgeById,
  createBridge,
  updateBridge,
  deleteBridge,
  approveBridge,
  rejectBridge,
  getBMCBridge,
  scheduleInspection,
  scheduleAdhocInspection,
  updateBridgeImages,
  getBridgeImages,
  getZonesByState,
  getAllStates,
  getAllZones,
  getAllProjects
} from '../controllers/bridge.controller.js';
import { authenticateToken } from '../middleware/auth.middleware.js';
import { uploadMultiple } from '../middleware/upload.middleware.js';

const router = express.Router();

// All routes require authentication
router.use(authenticateToken);

// Get all bridges
router.get('/', getAllBridges);
router.get('/bridge-list', getAllBridges); // Legacy endpoint

// Get bridge by ID
router.get('/:id', getBridgeById);

// Create bridge
router.post('/', createBridge);

// Update bridge
router.put('/:id', updateBridge);

// Delete bridge
router.delete('/:id', deleteBridge);

// Approve bridge
router.post('/:id/approve', approveBridge);

// Reject bridge
router.post('/:id/reject', rejectBridge);

// Get BMC bridges by status
router.get('/bmc/bridge/index/:status', getBMCBridge);

// Schedule inspection
router.post('/schedule_inspecion/:id', scheduleInspection);
router.post('/schedule_adhoc_inspecion/:id', scheduleAdhocInspection);

// Bridge images
router.post('/update_images/:id', uploadMultiple('images', 20), updateBridgeImages);
router.get('/images/:id', getBridgeImages);

// Bridge data sections (structure, general, approaches, etc.)
// These will be handled by separate controller methods
router.post('/structure_data/:id', createBridge);
router.post('/general_data/:id', createBridge);
router.post('/approaches_data/:id', createBridge);
router.post('/protection_works/:id', createBridge);
router.post('/foundation/:id', createBridge);
router.post('/substructure/:id', createBridge);
router.post('/bearing_pedestal/:id', createBridge);
router.post('/superstructure/:id', createBridge);
router.post('/expansion_joint/:id', createBridge);
router.post('/wearing_coat/:id', createBridge);
router.post('/handrails/:id', createBridge);

// Get bridge data sections
router.get('/structure_data/:id', getBridgeById);
router.get('/general_data/:id', getBridgeById);
router.get('/approaches_data/:id', getBridgeById);
router.get('/protection_works/:id', getBridgeById);
router.get('/foundation/:id', getBridgeById);
router.get('/substructure/:id', getBridgeById);
router.get('/bearing_pedestal/:id', getBridgeById);
router.get('/superstructure/:id', getBridgeById);
router.get('/expansion_joint/:id', getBridgeById);
router.get('/wearing_coat/:id', getBridgeById);
router.get('/handrails/:id', getBridgeById);

// Utility endpoints
router.post('/get_zones_by_state', getZonesByState);
router.get('/get_zones_by_state', getZonesByState); // Also support GET for compatibility
router.get('/get_states', getAllStates);
router.get('/get_zones', getAllZones);
router.get('/get_projects', getAllProjects);

export default router;

