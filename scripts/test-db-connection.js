// Test database connection script
import dotenv from 'dotenv';
import pkg from 'pg';

const { Pool } = pkg;
dotenv.config();

// Extract hostname from URL if provided
const getHostname = (host) => {
  if (!host) return 'localhost';
  return host.replace(/^https?:\/\//, '').split('/')[0];
};

const pool = new Pool({
  host: getHostname(process.env.DB_HOST) || 'localhost',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'bms_database',
  port: parseInt(process.env.DB_PORT) || 5432,
  ssl: process.env.DB_HOST?.includes('https://') ? {
    rejectUnauthorized: false
  } : false
});

console.log('Testing database connection...');
console.log(`Host: ${getHostname(process.env.DB_HOST)}`);
console.log(`Database: ${process.env.DB_NAME}`);
console.log(`User: ${process.env.DB_USER}`);
console.log(`Port: ${process.env.DB_PORT}\n`);

pool.query('SELECT NOW() as current_time, version() as version', (err, res) => {
  if (err) {
    console.error('❌ Database connection failed!');
    console.error('Error:', err.message);
    process.exit(1);
  } else {
    console.log('✅ Database connection successful!');
    console.log('Current time:', res.rows[0].current_time);
    console.log('PostgreSQL version:', res.rows[0].version.split(',')[0]);
    
    // Test a simple query
    pool.query('SELECT current_database() as database_name', (err, res) => {
      if (!err) {
        console.log('Connected to database:', res.rows[0].database_name);
      }
      pool.end();
      process.exit(0);
    });
  }
});

