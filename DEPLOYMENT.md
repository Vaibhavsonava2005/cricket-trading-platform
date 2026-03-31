# 🏏 Cricket Trading Platform - Deployment Guide

## System Overview

This is a complete cricket trading platform with:
- ✅ User authentication and management
- ✅ Real-time cricket match updates
- ✅ Trading/Betting functionality
- ✅ Deposit/Withdrawal system
- ✅ Admin panel
- ✅ Beautiful cricket-themed UI

## Prerequisites

1. **Node.js** (v14 or higher) - [Download](https://nodejs.org/)
2. **PostgreSQL Database** (Neon DB already configured)
3. **Internet connection** (for initial setup and API calls)

## Quick Start (On Your Local Machine)

### Step 1: Extract Files
Extract the `cricket-trading-platform` folder to your desired location.

### Step 2: Install Dependencies
```bash
cd cricket-trading-platform
npm install
```

### Step 3: Configure Database
The `.env` file is already configured with your Neon PostgreSQL database:
```
DATABASE_URL=postgresql://neondb_owner:npg_GMmcinsdE30L@ep-rapid-dream-an87i8ks-pooler.c-6.us-east-1.aws.neon.tech/neondb?sslmode=require
```

**Note:** Make sure your Neon database is accessible from your machine.

### Step 4: Start the Application
```bash
# Option 1: Use the startup script (Linux/Mac)
./start.sh

# Option 2: Manual start
# Terminal 1 - Backend
npm start

# Terminal 2 - Frontend (in new terminal)
npm run frontend
```

### Step 5: Access the Application
- **Frontend**: http://localhost:3000
- **Admin Panel**: http://localhost:3000/admin
- **API**: http://localhost:3001/api

### Default Admin Login
- Email: `admin@crickettrading.com`
- Password: `admin123`

## Project Structure

```
cricket-trading-platform/
├── config/
│   └── database.js          # Database configuration
├── middleware/
│   └── auth.js              # JWT authentication
├── routes/
│   ├── auth.js              # Authentication routes
│   ├── matches.js           # Match routes
│   ├── bets.js              # Betting routes
│   ├── wallet.js            # Wallet routes
│   └── admin.js             # Admin routes
├── services/
│   └── cricketData.js       # Cricket data service
├── public/
│   ├── index.html           # Main frontend
│   └── admin.html           # Admin panel
├── server.js                # Backend server
├── frontend-server.js       # Frontend server
├── schema.sql               # Database schema
├── .env                     # Environment variables
└── README.md                # Documentation
```

## Features Breakdown

### 1. User Features
- **Authentication**: Secure signup/login with JWT
- **Live Matches**: Real-time cricket match data
- **Betting Markets**:
  - Match Odds (Back/Lay)
  - Bookmaker
  - Fancy markets
- **Wallet**: Deposit and withdrawal requests
- **Bet History**: Track all your bets

### 2. Admin Features
- **User Management**: View all users and balances
- **Financial Control**:
  - Approve/reject deposits
  - Approve/reject withdrawals
- **Statistics Dashboard**
- **Bet Settlement**

## API Documentation

### Authentication
```javascript
// Signup
POST /api/auth/signup
Body: { username, email, password }

// Login
POST /api/auth/login
Body: { email, password }
```

### Matches
```javascript
// Get live matches
GET /api/matches/live
Headers: { Authorization: "Bearer <token>" }

// Get match details
GET /api/matches/:matchId
Headers: { Authorization: "Bearer <token>" }
```

### Betting
```javascript
// Place bet
POST /api/bets/place
Headers: { Authorization: "Bearer <token>" }
Body: {
  matchId, matchName, betType, 
  selection, odds, stake
}

// Get my bets
GET /api/bets/my-bets
Headers: { Authorization: "Bearer <token>" }
```

### Wallet
```javascript
// Request deposit
POST /api/wallet/deposit
Headers: { Authorization: "Bearer <token>" }
Body: { amount }

// Request withdrawal
POST /api/wallet/withdraw
Headers: { Authorization: "Bearer <token>" }
Body: { amount, bankDetails }

// Get transactions
GET /api/wallet/transactions
Headers: { Authorization: "Bearer <token>" }
```

### Admin (Requires Admin Role)
```javascript
// Get all users
GET /api/admin/users

// Approve deposit
PUT /api/admin/deposits/:id/approve

// Approve withdrawal
PUT /api/admin/withdrawals/:id/approve
```

## Database Schema

### Tables Created Automatically:
1. **users** - User accounts
2. **deposits** - Deposit requests
3. **withdrawals** - Withdrawal requests
4. **bets** - All bets placed
5. **matches_cache** - Cached match data
6. **admin_actions** - Admin activity log

## Configuration

### Environment Variables (.env)
```
DATABASE_URL=<your-neon-db-url>
JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
PORT=3001
NODE_ENV=development
CRICKET_API_KEY=your_cricket_api_key_here
```

### Getting Cricket API Key (Optional)
1. Visit https://www.cricapi.com/
2. Sign up for free account
3. Get your API key
4. Add to `.env` file

**Note:** Currently using mock data for testing. Real API integration is ready.

## Real-Time Updates

The platform updates live matches every 10 seconds using Node-Cron:
- Fetches latest scores
- Updates odds
- Caches data in database

## Security Features

✅ JWT authentication
✅ Password hashing (bcrypt)
✅ SQL injection protection
✅ CORS enabled
✅ Admin-only routes
✅ Transaction isolation

## Troubleshooting

### Database Connection Issues
**Problem**: Cannot connect to Neon database
**Solution**: 
1. Check internet connection
2. Verify DATABASE_URL in `.env`
3. Ensure Neon database is active

### Port Already in Use
**Problem**: Error: Port 3000 or 3001 already in use
**Solution**:
```bash
# Kill existing processes
lsof -ti:3000 | xargs kill -9
lsof -ti:3001 | xargs kill -9
```

### Module Not Found
**Problem**: Error: Cannot find module
**Solution**:
```bash
rm -rf node_modules package-lock.json
npm install
```

## Production Deployment

### Recommended Hosting Platforms:
1. **Backend**: Railway, Render, Heroku
2. **Frontend**: Vercel, Netlify
3. **Database**: Neon (already configured)

### Steps for Production:
1. Update JWT_SECRET in `.env`
2. Set NODE_ENV=production
3. Configure CORS for your domain
4. Set up SSL certificates
5. Configure environment variables on hosting platform

### Environment Variables for Production:
```
DATABASE_URL=<neon-db-url>
JWT_SECRET=<strong-random-secret>
PORT=3001
NODE_ENV=production
CRICKET_API_KEY=<your-api-key>
FRONTEND_URL=https://your-domain.com
```

## Scaling Considerations

- Add Redis for caching
- Implement WebSocket for real-time updates
- Use CDN for static assets
- Add load balancer for multiple instances
- Implement rate limiting
- Add monitoring (Sentry, LogRocket)

## Support & Maintenance

### Logs Location
- Backend logs: Console output
- Database logs: Check Neon dashboard

### Backup Strategy
- Database: Automated by Neon
- Code: Git repository
- Regular exports recommended

## Future Enhancements

Planned features:
- [ ] Football and Tennis markets
- [ ] Live streaming integration
- [ ] Mobile app (React Native)
- [ ] Advanced analytics
- [ ] Payment gateway integration
- [ ] Cryptocurrency support
- [ ] Multi-language support
- [ ] WhatsApp notifications

## Contact & Support

For issues, questions, or contributions:
- Create an issue on GitHub
- Contact development team
- Check documentation

## License

MIT License - Free to use and modify

---

**Note**: This platform is for educational/testing purposes. Ensure compliance with local gambling laws before deploying for real money trading.
