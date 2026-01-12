import express from 'express';
import {
  getLastApproved,
  getDistresses,
  exportExcel,
  generatePDF
} from '../controllers/boq.controller.js';
import { authenticateToken } from '../middleware/auth.middleware.js';

const router = express.Router();

// All routes require authentication
router.use(authenticateToken);

// Get last approved inspection
router.get('/last_approved/:bridgeId', getLastApproved);

// Get distress data
router.get('/distress/:inspectionId', getDistresses);

// Export Excel
router.get('/export/:bridgeId', exportExcel);

// Generate PDF
router.post('/generate-pdf', generatePDF);
router.post('/generate_boq_pdf', generatePDF); // Legacy PHP style

export default router;

