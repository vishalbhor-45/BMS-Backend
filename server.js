import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import helmet from 'helmet';
import morgan from 'morgan';
import path from 'path';
import { fileURLToPath } from 'url';

// Import routes
import authRoutes from './routes/auth.routes.js';
import userRoutes from './routes/user.routes.js';
import bridgeRoutes from './routes/bridge.routes.js';
import inspectionRoutes from './routes/inspection.routes.js';
import dashboardRoutes from './routes/dashboard.routes.js';
import boqRoutes from './routes/boq.routes.js';

// Load environment variables
dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(helmet());
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:5173',
  credentials: true
}));
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files (uploads, images, etc.)
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok', message: 'BMS Backend API is running' });
});

// API Routes
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/bridges', bridgeRoutes);
app.use('/api/inspections', inspectionRoutes);
app.use('/api/dashboard', dashboardRoutes);
app.use('/api/boq', boqRoutes);

// Legacy PHP-style routes (for compatibility)
app.use('/login_con', authRoutes);
app.use('/bridge', bridgeRoutes);
app.use('/bmc', inspectionRoutes);
app.use('/inspection', inspectionRoutes);
app.use('/schedule-inspection-list', inspectionRoutes);
app.use('/ongoing-inspection-list', inspectionRoutes);
app.use('/approved-inspection-list', inspectionRoutes);
app.use('/rejected-inspection-list', inspectionRoutes);
app.use('/pending-approval-inspection-list', inspectionRoutes);
app.use('/bridge-list', bridgeRoutes);

// Error handling middleware
app.use((err, req, res, next) => {
  console.error('Error:', err);
  res.status(err.status || 500).json({
    success: false,
    error: err.message || 'Internal server error',
    ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
  });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    error: 'Route not found'
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 BMS Backend Server running on port ${PORT}`);
  console.log(`📡 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`🌐 Health check: http://localhost:${PORT}/health`);
});

export default app;

