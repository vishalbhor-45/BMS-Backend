import express from 'express';
import { 
  getAllUsers, 
  getUserById, 
  createUser, 
  updateUser, 
  deleteUser,
  uploadSignature,
  downloadSignature,
  getAllStates
} from '../controllers/user.controller.js';
import { authenticateToken } from '../middleware/auth.middleware.js';
import { uploadSingle } from '../middleware/upload.middleware.js';

const router = express.Router();

// All routes require authentication
router.use(authenticateToken);

// Get all users
router.get('/', getAllUsers);

// Get user by ID
router.get('/:id', getUserById);

// Create user
router.post('/', createUser);

// Update user
router.put('/:id', updateUser);

// Delete user
router.delete('/:id', deleteUser);

// Upload signature
router.post('/:id/signature', uploadSingle('sign'), uploadSignature);

// Download signature
router.get('/:id/signature/download', downloadSignature);

// Get all states
router.get('/states/list', getAllStates);

export default router;

