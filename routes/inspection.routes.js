import express from 'express';
import {
  getScheduledInspections,
  getOngoingInspections,
  getApprovedInspections,
  getRejectedInspections,
  getPendingApprovalInspections,
  getInspectionById,
  createInspection,
  updateInspection,
  approveInspection,
  rejectInspection,
  getDistresses,
  getLastApproved,
  saveNonStructural,
  getNonStructural,
  updateNonStructural,
  deleteNonStructural,
  getBridgeDetails,
  getStructureDataDetails,
  getComponentRatings,
  getComponentRating,
  saveComponentRating,
  getOverallBridgeRating,
  saveOverallBridgeRating,
  getRatingDescriptions
} from '../controllers/inspection.controller.js';
import { authenticateToken } from '../middleware/auth.middleware.js';

const router = express.Router();

// All routes require authentication
router.use(authenticateToken);

// Get inspection lists
router.get('/scheduled', getScheduledInspections);
router.get('/schedule-inspection-list', getScheduledInspections); // Legacy

router.get('/ongoing', getOngoingInspections);
router.get('/ongoing-inspection-list', getOngoingInspections); // Legacy

router.get('/approved', getApprovedInspections);
router.get('/approved-inspection-list', getApprovedInspections); // Legacy

router.get('/rejected', getRejectedInspections);
router.get('/rejected-inspection-list', getRejectedInspections); // Legacy

router.get('/pending-approval', getPendingApprovalInspections);
router.get('/pending-approval-inspection-list', getPendingApprovalInspections); // Legacy

// CRUD operations
router.get('/:id', getInspectionById);
router.post('/', createInspection);
router.put('/:id', updateInspection);

// Inspection actions
router.post('/:id/approve', approveInspection);
router.post('/reject/:id', rejectInspection); // Legacy PHP style
router.post('/:id/reject', rejectInspection);

// Distress management
router.get('/distress/:id', getDistresses);
router.get('/last_approved/:bridgeId', getLastApproved);

// Non-structural elements
router.post('/save_non_structural', saveNonStructural);
router.get('/non_structural/:id', getNonStructural);
router.put('/non_structural/:id', updateNonStructural);
router.delete('/non_structural/:id', deleteNonStructural);

// Bridge details for inspection
router.get('/bridge_details/:bridgeId', getBridgeDetails);
router.get('/structure_data/:bridgeId', getStructureDataDetails);

// Component ratings
router.get('/:id/ratings', getComponentRatings);
router.get('/:id/rating/:componentType', getComponentRating);
router.post('/:id/rating', saveComponentRating);

// Overall bridge rating
router.get('/:id/overall_rating', getOverallBridgeRating);
router.post('/:id/overall_rating', saveOverallBridgeRating);

// Rating descriptions
router.get('/rating_descriptions/:ratingType', getRatingDescriptions);

export default router;

