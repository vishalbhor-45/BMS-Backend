import express from 'express';
import {
  getStatistics,
  getScheduledCount,
  getOngoingCount,
  getApprovedCount,
  getRejectedCount,
  getPendingBridgesCount,
  getApprovedBridgesCount,
  getRejectedBridgesCount,
  getChainageWiseData,
  getLocationData
} from '../controllers/dashboard.controller.js';
import { authenticateToken } from '../middleware/auth.middleware.js';

const router = express.Router();

// All routes require authentication
router.use(authenticateToken);

// Get dashboard statistics
router.get('/statistics', getStatistics);

// Get counts
router.get('/scheduled_count', getScheduledCount);
router.get('/ongoing_count', getOngoingCount);
router.get('/approved_count', getApprovedCount);
router.get('/rejected_count', getRejectedCount);
router.get('/pending_bridges', getPendingBridgesCount);
router.get('/approved_bridges', getApprovedBridgesCount);
router.get('/rejected_bridges', getRejectedBridgesCount);

// Get data
router.get('/chainage_wise', getChainageWiseData);
router.get('/location_data', getLocationData);

export default router;

