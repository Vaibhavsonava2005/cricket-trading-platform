# 🏏 Cricket Trading Platform - Quick Start Guide

## What You've Got

A complete, production-ready cricket trading platform with:

✅ **User System**: Signup, Login, Profile Management
✅ **Live Cricket Matches**: Real-time scores and odds updates every 10 seconds
✅ **Trading Markets**: Match Odds, Bookmaker, Fancy bets
✅ **Wallet System**: Deposits and Withdrawals with admin approval
✅ **Admin Panel**: Complete control over users, bets, and transactions
✅ **Beautiful UI**: Modern cricket-themed design with glassmorphism
✅ **Database**: PostgreSQL (Neon) - Already configured!

## 🚀 Get Started in 3 Steps

### Step 1: Install Node.js
Download and install from: https://nodejs.org/
(Choose LTS version - currently v20.x)

### Step 2: Install Dependencies
Open terminal/command prompt in the project folder:
```bash
npm install
```

### Step 3: Run the Platform
```bash
# Linux/Mac:
./start.sh

# Windows:
npm start
# Then in another terminal:
npm run frontend
```

## 🌐 Access Your Platform

Once running:
- **User Interface**: http://localhost:3000
- **Admin Panel**: http://localhost:3000/admin
- **API Backend**: http://localhost:3001/api

## 🔐 First Login

**Admin Account** (Pre-created):
- Email: `admin@crickettrading.com`
- Password: `admin123`

**Create User Account**:
- Click "Sign Up" on the homepage
- Fill in details
- Start trading!

## 📋 How It Works

### For Users:
1. **Sign Up** → Create account
2. **Deposit** → Request funds (admin approves)
3. **Browse Matches** → View live/upcoming matches
4. **Place Bets** → Trade on various markets
5. **Withdraw** → Request withdrawals (admin approves)

### For Admins:
1. **Login** → Use admin credentials
2. **Go to Admin Panel** → Click "Admin" button
3. **Manage**:
   - Approve/reject deposits
   - Approve/reject withdrawals
   - View all users and bets
   - Monitor platform statistics

## 🎯 Key Features Explained

### Real-Time Updates
- Matches update every 10 seconds automatically
- Odds change based on match situation
- Live scores displayed for ongoing matches

### Trading Markets

**1. Match Odds (Back/Lay)**
- Back: Bet ON a team to win
- Lay: Bet AGAINST a team
- Example: RR at 2.10 means bet ₹100 to win ₹210

**2. Bookmaker**
- Fixed odds betting
- Higher odds than match odds
- Example: RR at 111 means bet ₹100 to win ₹111

**3. Fancy Markets**
- Over-by-over betting
- Total runs, wickets, etc.
- Yes/No format

### Wallet System

**Deposits**:
1. User requests deposit
2. Admin sees request in panel
3. Admin approves → Money added to user balance

**Withdrawals**:
1. User requests withdrawal
2. Money on hold
3. Admin approves → Transaction complete
4. Admin rejects → Money returned

## 📱 Platform Tour

### User Dashboard
```
┌─────────────────────────────────────┐
│ Balance: ₹1000.00        [Wallet]  │
├─────────────────────────────────────┤
│ [Cricket] [Football] [Tennis]       │
├─────────────────────────────────────┤
│ Live | Upcoming | My Bets           │
├─────────────────────────────────────┤
│ ┌───────────────────────────────┐  │
│ │ RR vs CSK          [LIVE]     │  │
│ │ RR: 165/4 (18.2)              │  │
│ │ CSK: 142/6 (15.3)             │  │
│ │ [2.10] [1.82]                 │  │
│ └───────────────────────────────┘  │
└─────────────────────────────────────┘
```

### Admin Panel
```
┌─────────────────────────────────────┐
│ ADMIN PANEL                         │
├─────────────────────────────────────┤
│ Users: 25 | Bets: 150 | Revenue: ₹5K│
├─────────────────────────────────────┤
│ Pending Deposits (3)                │
│ User: john@example.com - ₹500       │
│ [Approve] [Reject]                  │
├─────────────────────────────────────┤
│ Pending Withdrawals (1)             │
│ User: jane@example.com - ₹200       │
│ [Approve] [Reject]                  │
└─────────────────────────────────────┘
```

## 🔧 Customization

### Change Match Data Source
Edit `services/cricketData.js`:
- Add real Cricket API key
- Modify odds calculation
- Add new sports

### Modify UI Theme
Edit `public/index.html`:
- Change color gradients
- Update card styles
- Customize fonts

### Add Features
- WebSocket for real-time updates
- Payment gateway integration
- SMS/Email notifications
- Mobile responsive improvements

## 🐛 Common Issues & Fixes

### "Port already in use"
```bash
# Kill the process
lsof -ti:3000 | xargs kill -9
lsof -ti:3001 | xargs kill -9
```

### "Cannot connect to database"
- Check internet connection
- Verify .env file has correct DATABASE_URL
- Ensure Neon database is active

### "Module not found"
```bash
rm -rf node_modules
npm install
```

### API calls failing
- Make sure backend is running (port 3001)
- Check browser console for errors
- Verify CORS settings

## 📊 Database Structure

Your Neon database automatically creates these tables:

1. **users** → All user accounts
2. **deposits** → Deposit requests
3. **withdrawals** → Withdrawal requests
4. **bets** → All placed bets
5. **matches_cache** → Cached match data
6. **admin_actions** → Admin activity log

## 🌟 Pro Tips

1. **Testing**: Use admin account to add funds to test user
2. **Performance**: Clear matches_cache table occasionally
3. **Security**: Change JWT_SECRET before production
4. **Scaling**: Use Redis for caching in production
5. **Monitoring**: Add error tracking (Sentry)

## 📈 Going to Production

### Deploy Backend (Railway/Render)
1. Push code to GitHub
2. Connect to Railway/Render
3. Set environment variables
4. Deploy!

### Deploy Frontend (Vercel/Netlify)
1. Upload `public` folder
2. Configure build settings
3. Update API_BASE_URL to your backend URL
4. Deploy!

### Update API URL
In `public/index.html` and `public/admin.html`, change:
```javascript
const API_BASE_URL = 'https://your-backend.railway.app/api';
```

## 🎓 Learning Resources

- **Node.js**: https://nodejs.org/docs
- **Express.js**: https://expressjs.com
- **PostgreSQL**: https://www.postgresql.org/docs
- **React**: https://react.dev
- **Tailwind CSS**: https://tailwindcss.com

## ⚠️ Important Notes

1. **Legal**: Check local laws regarding online betting/trading
2. **Security**: Change all default passwords
3. **Testing**: Test thoroughly before real money
4. **Backups**: Regular database backups essential
5. **Compliance**: Implement KYC if required

## 🤝 Need Help?

1. Check `DEPLOYMENT.md` for detailed docs
2. Review `README.md` for technical details
3. Inspect code comments
4. Test with mock data first

## 🎉 You're Ready!

Your cricket trading platform is complete and ready to use. Start by:
1. Running the platform
2. Creating a test user account
3. Exploring the features
4. Customizing to your needs

Happy Trading! 🏏💰

---

**Version**: 1.0.0
**Last Updated**: March 2026
**License**: MIT
