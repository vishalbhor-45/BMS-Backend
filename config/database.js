import pkg from 'pg';
import dotenv from 'dotenv';

const { Pool } = pkg;
dotenv.config();

// Extract hostname from URL if provided (remove https:// or http://)
const getHostname = (host) => {
  if (!host) return 'localhost';
  return host.replace(/^https?:\/\//, '').split('/')[0];
};

// Create PostgreSQL connection pool
const pool = new Pool({
  host: getHostname(process.env.DB_HOST) || 'localhost',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'bms_database',
  port: parseInt(process.env.DB_PORT) || 5432,
  max: 20, // Maximum number of clients in the pool
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 10000, // Increased timeout for remote connections
  // SSL configuration - only enable if explicitly required
  // Some hosted databases don't support SSL connections
  ssl: process.env.DB_SSL === 'true' ? {
    rejectUnauthorized: false // Set to true in production with proper certificates
  } : false
});

// Test connection
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('❌ Database connection error:', err.message);
    console.log('⚠️  Running without database connection. Please check your database configuration in .env');
  } else {
    console.log('✅ PostgreSQL database connected successfully');
    console.log(`📊 Connected to database: ${process.env.DB_NAME || 'bms_database'}`);
  }
});

// Handle pool errors
pool.on('error', (err) => {
  console.error('Unexpected error on idle client', err);
  process.exit(-1);
});

export default pool;

