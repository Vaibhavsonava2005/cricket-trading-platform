const express = require('express');
const cors = require('cors');
const cron = require('node-cron');
require('dotenv').config();

const db = require('./config/database');
const cricketData = require('./services/cricketData');

// Routes
const authRoutes = require('./routes/auth');
const matchesRoutes = require('./routes/matches');
const betsRoutes = require('./routes/bets');
const walletRoutes = require('./routes/wallet');
const adminRoutes = require('./routes/admin');

const app = express();
const PORT = process.env.PORT || 3001;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Request logging
app.use((req, res, next) => {
    console.log(`${new Date().toISOString()} - ${req.method} ${req.path}`);
    next();
});

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/matches', matchesRoutes);
app.use('/api/bets', betsRoutes);
app.use('/api/wallet', walletRoutes);
app.use('/api/admin', adminRoutes);

// Health check
app.get('/api/health', (req, res) => {
    res.json({ status: 'OK', message: 'Server is running' });
});

// Error handling middleware
app.use((err, req, res, next) => {
    console.error('Error:', err);
    res.status(500).json({ error: 'Internal server error' });
});

// 404 handler
app.use((req, res) => {
    res.status(404).json({ error: 'Route not found' });
});

// Schedule live match updates every 10 seconds
cron.schedule('*/10 * * * * *', async () => {
    try {
        const matches = await cricketData.getLiveMatches();
        
        // Cache each match
        for (const match of matches) {
            await cricketData.cacheMatchData(match.id, match);
        }
        
        console.log(`Updated ${matches.length} live matches`);
    } catch (error) {
        console.error('Error in scheduled match update:', error.message);
    }
});

// Initialize database and start server
const startServer = async () => {
    try {
        // Initialize database
        await db.initializeDatabase();
        
        // Start server
        app.listen(PORT, () => {
            console.log(`\n🚀 Server running on port ${PORT}`);
            console.log(`📊 Environment: ${process.env.NODE_ENV}`);
            console.log(`🔗 API Base URL: http://localhost:${PORT}/api`);
            console.log(`\n✅ Live match updates scheduled every 10 seconds\n`);
        });
    } catch (error) {
        console.error('Failed to start server:', error);
        process.exit(1);
    }
};

startServer();

module.exports = app;
