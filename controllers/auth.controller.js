import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import pool from '../config/database.js';

// Login controller
export const login = async (req, res) => {
  try {
    // Support both JSON and form-data
    const username = req.body.username || req.body.user_name;
    const password = req.body.password || req.body.pwd;
    const remember = req.body.remember || req.body.remember_me;

    // Validate input
    if (!username || !password) {
      return res.status(400).json({
        success: false,
        error: 'Username and password are required'
      });
    }

    // Database query (PostgreSQL syntax)
    // Example query:
    // const users = await pool.query(
    //   'SELECT * FROM users WHERE username = $1',
    //   [username]
    // );
    // const user = users.rows[0];

    // Mock user for now (replace with database query)
    const mockUser = {
      userid: 1,
      username: username,
      userrole: 'siteengg', // or 'bmcuser'
      first_name: 'John',
      last_name: 'Doe'
    };

    // TODO: Verify password with bcrypt
    // const isValidPassword = await bcrypt.compare(password, user.password);
    // if (!isValidPassword) {
    //   return res.status(401).json({
    //     success: false,
    //     error: 'Invalid credentials'
    //   });
    // }

    // Generate JWT token
    const token = jwt.sign(
      { 
        userId: mockUser.userid,
        username: mockUser.username,
        role: mockUser.userrole
      },
      process.env.JWT_SECRET || 'your-secret-key',
      { expiresIn: remember ? '30d' : '7d' }
    );

    // Return user data (PHP CodeIgniter style response)
    res.json({
      success: true,
      userid: mockUser.userid,
      uid: mockUser.userid,
      username: mockUser.username,
      userrole: mockUser.userrole,
      user_role: mockUser.userrole,
      first_name: mockUser.first_name,
      last_name: mockUser.last_name,
      token: token
    });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({
      success: false,
      error: 'Login failed. Please try again.'
    });
  }
};

// Logout controller
export const logout = async (req, res) => {
  try {
    // In a real app, you might want to blacklist the token
    res.json({
      success: true,
      message: 'Logged out successfully'
    });
  } catch (error) {
    console.error('Logout error:', error);
    res.status(500).json({
      success: false,
      error: 'Logout failed'
    });
  }
};

// Change password controller
export const changePassword = async (req, res) => {
  try {
    const { old_pwd, new_pwd, confirm_pwd } = req.body;
    const userId = req.user.userId;

    // Validate input
    if (!old_pwd || !new_pwd || !confirm_pwd) {
      return res.status(400).json({
        success: false,
        error: 'All password fields are required'
      });
    }

    if (new_pwd !== confirm_pwd) {
      return res.status(400).json({
        success: false,
        error: 'New password and confirm password do not match'
      });
    }

    // TODO: Implement password change logic
    // 1. Get user from database
    // 2. Verify old password
    // 3. Hash new password
    // 4. Update password in database

    res.json({
      success: true,
      message: 'Password changed successfully'
    });
  } catch (error) {
    console.error('Change password error:', error);
    res.status(500).json({
      success: false,
      error: 'Failed to change password'
    });
  }
};

