# System Architecture

## Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                     Cricket Trading Platform                     │
└─────────────────────────────────────────────────────────────────┘

┌──────────────┐      ┌──────────────┐      ┌──────────────┐
│   Frontend   │ ←──→ │   Backend    │ ←──→ │   Database   │
│  (Port 3000) │      │  (Port 3001) │      │  (Neon PG)   │
└──────────────┘      └──────────────┘      └──────────────┘
       │                      │                     │
       │                      │                     │
       ↓                      ↓                     ↓
   React UI           Express.js API        PostgreSQL
   Tailwind           JWT Auth              Tables:
   HTML/CSS           REST APIs             - users
                      Cron Jobs             - bets
                                            - deposits
                                            - withdrawals
                                            - matches_cache
```

## Data Flow

### User Registration & Login
```
User → Frontend → POST /api/auth/signup
                ↓
            Backend validates
                ↓
            Hash password (bcrypt)
                ↓
            Store in database
                ↓
            Generate JWT token
                ↓
            Return token to user
```

### Placing a Bet
```
User selects match → Views odds → Enters stake
                ↓
            POST /api/bets/place
                ↓
            Backend checks:
            - Valid token?
            - Sufficient balance?
                ↓
            Deduct stake from balance
                ↓
            Create bet record
                ↓
            Return confirmation
```

### Deposit Flow
```
User → Request deposit → POST /api/wallet/deposit
                        ↓
                Create pending deposit
                        ↓
                Admin sees in panel
                        ↓
                Admin approves
                        ↓
                PUT /api/admin/deposits/:id/approve
                        ↓
                Add amount to user balance
                        ↓
                Update deposit status
```

### Real-Time Match Updates
```
Cron Job (every 10 seconds)
        ↓
    Fetch from Cricket API
        ↓
    Update matches_cache table
        ↓
    Frontend polls /api/matches/live
        ↓
    Receive updated data
        ↓
    Display to users
```

## Component Architecture

### Frontend (React)
```
App
├── LoginForm
├── SignupForm
└── Dashboard
    ├── Header
    │   ├── Balance Display
    │   ├── Wallet Button
    │   └── Logout Button
    ├── SportNavigation
    │   ├── Cricket
    │   ├── Football
    │   └── Tennis
    ├── MatchTabs
    │   ├── Live Matches
    │   ├── Upcoming
    │   └── My Bets
    ├── MatchesGrid
    │   └── MatchCard[]
    ├── MatchDetailModal
    │   ├── Odds Display
    │   ├── Bet Form
    │   └── Place Bet Button
    └── WalletModal
        ├── Deposit Tab
        ├── Withdraw Tab
        └── History Tab
```

### Backend (Express.js)
```
server.js
├── Middleware
│   ├── CORS
│   ├── JSON Parser
│   └── Request Logger
├── Routes
│   ├── /api/auth
│   │   ├── POST /signup
│   │   └── POST /login
│   ├── /api/matches
│   │   ├── GET /live
│   │   ├── GET /upcoming
│   │   └── GET /:matchId
│   ├── /api/bets
│   │   ├── POST /place
│   │   └── GET /my-bets
│   ├── /api/wallet
│   │   ├── GET /balance
│   │   ├── POST /deposit
│   │   ├── POST /withdraw
│   │   └── GET /transactions
│   └── /api/admin
│       ├── GET /users
│       ├── GET /stats
│       ├── PUT /deposits/:id/approve
│       └── PUT /withdrawals/:id/approve
└── Services
    └── cricketData.js
        ├── getLiveMatches()
        ├── getMatchDetails()
        └── generateOdds()
```

### Database Schema
```
users
├── id (PRIMARY KEY)
├── username (UNIQUE)
├── email (UNIQUE)
├── password (HASHED)
├── balance (DECIMAL)
├── is_admin (BOOLEAN)
└── created_at (TIMESTAMP)

bets
├── id (PRIMARY KEY)
├── user_id (FOREIGN KEY → users)
├── match_id
├── match_name
├── bet_type
├── selection
├── odds (DECIMAL)
├── stake (DECIMAL)
├── potential_win (DECIMAL)
├── status (pending/won/lost/void)
└── created_at (TIMESTAMP)

deposits
├── id (PRIMARY KEY)
├── user_id (FOREIGN KEY → users)
├── amount (DECIMAL)
├── status (pending/approved/rejected)
├── transaction_id
└── created_at (TIMESTAMP)

withdrawals
├── id (PRIMARY KEY)
├── user_id (FOREIGN KEY → users)
├── amount (DECIMAL)
├── status (pending/approved/rejected)
├── bank_details (TEXT)
├── transaction_id
└── created_at (TIMESTAMP)

matches_cache
├── id (PRIMARY KEY)
├── match_id (UNIQUE)
├── sport_type
├── match_data (JSONB)
└── last_updated (TIMESTAMP)
```

## Security Layers

1. **Authentication**
   - JWT tokens with expiration
   - Secure password hashing (bcrypt, 10 rounds)
   - Token validation on every request

2. **Authorization**
   - Role-based access control
   - Admin-only routes protected
   - User can only access own data

3. **Database**
   - Parameterized queries (SQL injection protection)
   - Transaction isolation
   - Connection pooling

4. **Network**
   - CORS configured
   - SSL/TLS for database connection
   - Rate limiting (can be added)

## Scalability Considerations

### Current Capacity
- Handles ~100 concurrent users
- ~1000 bets per minute
- Real-time updates every 10 seconds

### Scaling Strategy
```
Current → Phase 1 → Phase 2 → Phase 3
  │          │         │          │
  │          │         │          └→ Microservices
  │          │         └→ Load Balancer + Multiple Instances
  │          └→ Redis Cache + WebSocket
  └→ Single Server (Current)
```

### Optimization Points
1. Add Redis for caching match data
2. Implement WebSocket for real-time updates
3. Use CDN for static assets
4. Database read replicas
5. Horizontal scaling with load balancer

## API Response Times

| Endpoint | Expected | Optimized |
|----------|----------|-----------|
| GET /matches/live | 200ms | 50ms (with cache) |
| POST /bets/place | 300ms | 150ms |
| GET /wallet/balance | 100ms | 30ms |
| Admin operations | 500ms | 200ms |

## Monitoring & Logging

### What to Monitor
- API response times
- Database query performance
- Active user sessions
- Bet placement rate
- Error rates
- Server CPU/Memory usage

### Recommended Tools
- **APM**: New Relic, DataDog
- **Errors**: Sentry
- **Logs**: Logtail, Papertrail
- **Uptime**: UptimeRobot

## Deployment Architecture

```
Production Environment

┌─────────────────────────────────────────┐
│             CDN (Cloudflare)            │
│         Static Assets + SSL             │
└─────────────────────────────────────────┘
                    │
                    ↓
┌─────────────────────────────────────────┐
│         Frontend (Vercel/Netlify)       │
│            React Application            │
└─────────────────────────────────────────┘
                    │
                    ↓ HTTPS
┌─────────────────────────────────────────┐
│      Backend (Railway/Render/Heroku)    │
│         Express.js + Node.js            │
│         with Auto-scaling               │
└─────────────────────────────────────────┘
                    │
                    ↓ SSL
┌─────────────────────────────────────────┐
│        Database (Neon PostgreSQL)       │
│         with Automatic Backups          │
└─────────────────────────────────────────┘
```

## Development vs Production

| Feature | Development | Production |
|---------|-------------|------------|
| Database | Local/Neon | Neon with replicas |
| Logging | Console | Centralized logging |
| Caching | None | Redis |
| SSL | Optional | Required |
| Monitoring | None | Full APM |
| Error Tracking | None | Sentry |
| Rate Limiting | Disabled | Enabled |
| CORS | Allow all | Specific domains |

## Future Enhancements

### Phase 1 (Immediate)
- WebSocket for real-time updates
- Redis caching
- Rate limiting
- Better error handling

### Phase 2 (3-6 months)
- Mobile app (React Native)
- Payment gateway integration
- Live streaming
- Advanced analytics

### Phase 3 (6-12 months)
- Multiple sports (Football, Tennis)
- AI-powered odds
- Social features
- Cryptocurrency payments
