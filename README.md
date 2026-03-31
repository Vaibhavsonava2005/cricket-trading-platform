# Cricket Trading Platform

A comprehensive cricket trading platform with real-time match updates, betting functionality, and admin panel.

## Features

### User Features
- 🔐 User Authentication (Signup/Login)
- 🏏 Live Cricket Matches with real-time score updates
- ⚡ Real-time odds for Match Odds, Bookmaker, and Fancy markets
- 💰 Betting/Trading functionality
- 💳 Deposit and Withdrawal system
- 📊 Personal betting history
- 📱 Beautiful, responsive UI with cricket theme

### Admin Features
- 👥 User management
- 💵 Approve/Reject deposits
- 💸 Approve/Reject withdrawals
- 📈 Dashboard with statistics
- 🎯 Bet settlement

## Tech Stack

### Backend
- Node.js + Express
- PostgreSQL (Neon DB)
- JWT Authentication
- Cron jobs for live updates

### Frontend
- React (via CDN)
- Tailwind CSS
- Modern glassmorphism design

## Installation

### 1. Install Dependencies
```bash
npm install
```

### 2. Database Setup
The database is already configured to use Neon PostgreSQL. The schema will be automatically initialized on first run.

### 3. Environment Variables
Check `.env` file - it's already configured with your Neon DB connection string.

## Running the Application

### Start Both Backend and Frontend
```bash
npm run start-all
```

This will start:
- Backend API on http://localhost:3001
- Frontend on http://localhost:3000

### Or Start Separately

**Backend Only:**
```bash
npm start
```

**Frontend Only:**
```bash
node frontend-server.js
```

## Default Admin Credentials

- Email: admin@crickettrading.com
- Password: admin123

## API Endpoints

### Authentication
- POST `/api/auth/signup` - Register new user
- POST `/api/auth/login` - Login

### Matches
- GET `/api/matches/live` - Get live matches
- GET `/api/matches/upcoming` - Get upcoming matches
- GET `/api/matches/:matchId` - Get match details

### Betting
- POST `/api/bets/place` - Place a bet
- GET `/api/bets/my-bets` - Get user's bets

### Wallet
- GET `/api/wallet/balance` - Get balance
- POST `/api/wallet/deposit` - Request deposit
- POST `/api/wallet/withdraw` - Request withdrawal
- GET `/api/wallet/transactions` - Get transaction history

### Admin (Admin Only)
- GET `/api/admin/users` - Get all users
- GET `/api/admin/stats` - Get dashboard stats
- GET `/api/admin/deposits/pending` - Get pending deposits
- PUT `/api/admin/deposits/:id/approve` - Approve deposit
- PUT `/api/admin/deposits/:id/reject` - Reject deposit
- GET `/api/admin/withdrawals/pending` - Get pending withdrawals
- PUT `/api/admin/withdrawals/:id/approve` - Approve withdrawal
- PUT `/api/admin/withdrawals/:id/reject` - Reject withdrawal

## Features in Detail

### Real-time Match Updates
- Matches are updated every 10 seconds via cron job
- Live scores, odds, and match status
- Cached in database for performance

### Trading/Betting
- Match Odds (Back/Lay)
- Bookmaker markets
- Fancy markets (6 over runs, 10 over runs, etc.)
- Real-time odds calculation

### Deposit/Withdrawal System
1. User requests deposit/withdrawal
2. Request goes to pending state
3. Admin approves/rejects from admin panel
4. Balance is updated accordingly

### Admin Dashboard
- View all users and their balances
- Approve/reject financial transactions
- View platform statistics
- Manage bets

## Database Schema

### Users
- id, username, email, password, balance, is_admin, created_at

### Deposits
- id, user_id, amount, status, transaction_id, created_at

### Withdrawals
- id, user_id, amount, status, bank_details, transaction_id, created_at

### Bets
- id, user_id, match_id, match_name, bet_type, selection, odds, stake, potential_win, status, created_at

### Matches Cache
- id, match_id, sport_type, match_data, last_updated

## Live Data Integration

The platform uses Cricket API for live match data. For production:
1. Sign up at https://www.cricapi.com/
2. Get your API key
3. Update CRICKET_API_KEY in `.env`

Currently using mock data for testing.

## Security Features

- JWT authentication
- Password hashing with bcrypt
- SQL injection protection
- CORS enabled
- Admin-only routes protected

## Future Enhancements

- [ ] Add Football and Tennis markets
- [ ] Real-time websocket updates
- [ ] Live streaming integration
- [ ] Mobile app
- [ ] Advanced analytics
- [ ] Multi-currency support
- [ ] Payment gateway integration

## Support

For issues or questions, please contact the development team.

## License

MIT License
