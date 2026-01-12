// Database helper functions for PostgreSQL

/**
 * Execute a query and return results
 * @param {string} query - SQL query string
 * @param {Array} params - Query parameters
 * @returns {Promise<Array>} Query results
 */
export const query = async (queryText, params = []) => {
  const pool = (await import('../config/database.js')).default;
  try {
    const result = await pool.query(queryText, params);
    return result.rows;
  } catch (error) {
    console.error('Database query error:', error);
    throw error;
  }
};

/**
 * Execute a query and return single row
 * @param {string} query - SQL query string
 * @param {Array} params - Query parameters
 * @returns {Promise<Object|null>} Single row or null
 */
export const queryOne = async (queryText, params = []) => {
  const rows = await query(queryText, params);
  return rows.length > 0 ? rows[0] : null;
};

/**
 * Execute a query and return the first column of the first row
 * @param {string} query - SQL query string
 * @param {Array} params - Query parameters
 * @returns {Promise<any>} First column value
 */
export const queryValue = async (queryText, params = []) => {
  const row = await queryOne(queryText, params);
  return row ? Object.values(row)[0] : null;
};

/**
 * Execute an INSERT query and return the inserted row
 * @param {string} query - SQL query string with RETURNING clause
 * @param {Array} params - Query parameters
 * @returns {Promise<Object>} Inserted row
 */
export const insert = async (queryText, params = []) => {
  const rows = await query(queryText, params);
  return rows[0];
};

/**
 * Execute an UPDATE query and return the updated row
 * @param {string} query - SQL query string with RETURNING clause
 * @param {Array} params - Query parameters
 * @returns {Promise<Object>} Updated row
 */
export const update = async (queryText, params = []) => {
  const rows = await query(queryText, params);
  return rows[0];
};

/**
 * Execute a DELETE query
 * @param {string} query - SQL query string
 * @param {Array} params - Query parameters
 * @returns {Promise<number>} Number of affected rows
 */
export const deleteRows = async (queryText, params = []) => {
  const pool = (await import('../config/database.js')).default;
  try {
    const result = await pool.query(queryText, params);
    return result.rowCount;
  } catch (error) {
    console.error('Database delete error:', error);
    throw error;
  }
};

