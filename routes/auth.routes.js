import express from 'express';
import { login, logout, changePassword } from '../controllers/auth.controller.js';
import { authenticateToken } from '../middleware/auth.middleware.js';

const router = express.Router();

// Login endpoint (supports both JSON and form-data for PHP compatibility)
router.post('/login', login);
router.post('/check_login', login); // PHP CodeIgniter style

// Logout endpoint
router.post('/logout', authenticateToken, logout);

// Change password endpoint
router.post('/change-password', authenticateToken, changePassword);
router.post('/change_password', authenticateToken, changePassword); // PHP style

export default router;

