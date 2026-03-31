# 🚀 SETUP GUIDE - Error-Free Installation

## ⚠️ Important: Avoiding Common Errors

This guide will help you set up the Cricket Trading Platform without any errors.

---

## 📋 Prerequisites

Before starting, make sure you have:

1. **Node.js** (v14 or higher)
   - Download: https://nodejs.org/
   - Check version: `node --version`

2. **npm** (comes with Node.js)
   - Check version: `npm --version`

3. **Internet Connection** (for installing packages and database)

---

## 🔧 Step-by-Step Setup

### Step 1: Extract the Project

Extract `cricket-trading-platform-clean` folder to your desired location.

Example locations:
- Windows: `C:\Users\YourName\Projects\cricket-trading-platform`
- Mac/Linux: `~/Projects/cricket-trading-platform`

### Step 2: Open Terminal/Command Prompt

**Windows:**
- Press `Win + R`
- Type `cmd` and press Enter
- Navigate: `cd C:\Users\YourName\Projects\cricket-trading-platform`

**Mac:**
- Press `Cmd + Space`
- Type `terminal` and press Enter
- Navigate: `cd ~/Projects/cricket-trading-platform`

**Linux:**
- Open Terminal
- Navigate: `cd ~/Projects/cricket-trading-platform`

### Step 3: Install Dependencies

```bash
npm install
```

**This will install:**
- express (Backend server)
- pg (PostgreSQL database)
- bcryptjs (Password security)
- jsonwebtoken (Authentication)
- cors (Cross-origin requests)
- axios (HTTP requests)
- node-cron (Scheduled tasks)
- dotenv (Environment variables)

**Wait 1-2 minutes** for installation to complete.

### Step 4: Verify Installation

Check if all packages installed correctly:

```bash
npm list --depth=0
```

You should see:
```
cricket-trading-platform@1.0.0
├── axios@1.14.0
├── bcryptjs@3.0.3
├── cors@2.8.6
├── dotenv@17.3.1
├── express@5.2.1
├── jsonwebtoken@9.0.3
├── node-cron@4.2.1
└── pg@8.20.0
```

### Step 5: Configure Environment (Already Done!)

The `.env` file is already configured with your Neon database:

```
DATABASE_URL=postgresql://neondb_owner:npg_GMmcinsdE30L@ep-rapid-dream-an87i8ks-pooler.c-6.us-east-1.aws.neon.tech/neondb?sslmode=require
JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
PORT=3001
NODE_ENV=development
```

**✅ No changes needed!**

### Step 6: Start the Backend

Open **Terminal/Command Prompt #1**:

```bash
npm start
```

You should see:
```
✅ Database connected successfully
✅ Database schema initialized
✅ Default admin user created
🚀 Server running on port 3001
📊 Environment: development
🔗 API Base URL: http://localhost:3001/api
✅ Live match updates scheduled every 10 seconds
```

**✅ Backend is running!** Leave this terminal open.

### Step 7: Start the Frontend

Open **NEW Terminal/Command Prompt #2** (keep backend running):

Navigate to same folder:
```bash
cd C:\Users\YourName\Projects\cricket-trading-platform
# OR
cd ~/Projects/cricket-trading-platform
```

Start frontend:
```bash
npm run frontend
```

You should see:
```
🎨 Frontend server running on http://localhost:3000
📱 Open http://localhost:3000 in your browser
```

**✅ Frontend is running!**

### Step 8: Access the Platform

Open your web browser and go to:

- **User Interface**: http://localhost:3000
- **Admin Panel**: http://localhost:3000/admin

---

## 🔐 First Login

### Admin Account (Pre-created)
- **Email**: `admin@crickettrading.com`
- **Password**: `admin123`

### Create User Account
1. Go to http://localhost:3000
2. Click "Sign up"
3. Fill in:
   - Username: `testuser`
   - Email: `test@example.com`
   - Password: `test123`
4. Click "Sign Up"
5. You're in!

---

## ✅ Testing the Platform

### Quick Test Flow:

1. **Sign up as user** (http://localhost:3000)
2. **Login** with your credentials
3. **See live match** (RR vs CSK)
4. **Request deposit** (₹1000)
5. **Open admin panel** in new tab (http://localhost:3000/admin)
6. **Login as admin**
7. **Approve deposit** (click Approve button)
8. **Go back to user tab**
9. **Refresh page** - balance should show ₹1000
10. **Click on match** - betting modal opens
11. **Select RR at 2.10** - odds auto-fill
12. **Enter stake** - ₹100
13. **Click "Place Bet"** - bet placed!
14. **Check "My Bets"** tab - see your bet

---

## 🐛 Troubleshooting Common Errors

### Error: "Port 3000 already in use"

**Solution:**
```bash
# Windows:
netstat -ano | findstr :3000
taskkill /PID <PID_NUMBER> /F

# Mac/Linux:
lsof -ti:3000 | xargs kill -9
```

### Error: "Port 3001 already in use"

**Solution:**
```bash
# Windows:
netstat -ano | findstr :3001
taskkill /PID <PID_NUMBER> /F

# Mac/Linux:
lsof -ti:3001 | xargs kill -9
```

### Error: "Cannot find module"

**Solution:**
```bash
# Delete node_modules and reinstall
rm -rf node_modules
npm install
```

### Error: "Database connection failed"

**Solution:**
1. Check internet connection
2. Verify `.env` file exists
3. Make sure DATABASE_URL is correct
4. Try restarting the server

### Error: "npm: command not found"

**Solution:**
- Node.js is not installed or not in PATH
- Download from https://nodejs.org/
- Restart terminal after installation

### Error: "Permission denied"

**Mac/Linux Solution:**
```bash
sudo npm install
# OR
sudo chmod +x start.sh
```

---

## 📁 Project Structure

```
cricket-trading-platform/
├── 📖 Documentation
│   ├── SETUP.md (this file)
│   ├── QUICKSTART.md
│   ├── WHAT_YOU_HAVE.md
│   ├── VISUAL_WALKTHROUGH.md
│   ├── DEPLOYMENT.md
│   └── ARCHITECTURE.md
│
├── 🖥️ Backend
│   ├── server.js (Main server)
│   ├── routes/ (API endpoints)
│   ├── services/ (Business logic)
│   ├── config/ (Database)
│   └── middleware/ (Auth)
│
├── 🎨 Frontend
│   ├── public/index.html (User UI)
│   └── public/admin.html (Admin panel)
│
├── ⚙️ Configuration
│   ├── .env (Database config)
│   ├── package.json (Dependencies)
│   └── schema.sql (Database schema)
│
└── 🚀 Scripts
    ├── start.sh (Linux/Mac)
    └── frontend-server.js
```

---

## 🎯 What Each Command Does

```bash
npm install          # Install all dependencies
npm start           # Start backend server (port 3001)
npm run frontend    # Start frontend server (port 3000)
node server.js      # Alternative to npm start
```

---

## 📊 Ports Used

| Service | Port | URL |
|---------|------|-----|
| Frontend | 3000 | http://localhost:3000 |
| Backend API | 3001 | http://localhost:3001/api |
| Database | 5432 | Neon Cloud (remote) |

---

## 🔒 Security Notes

**For Testing (Current):**
- JWT_SECRET is set to a demo value
- Admin password is simple
- CORS allows all origins

**For Production:**
1. Change JWT_SECRET in `.env` to a strong random string
2. Change admin password (see admin panel)
3. Update CORS settings in `server.js`
4. Enable HTTPS
5. Add rate limiting

---

## 📝 Next Steps

After successful setup:

1. ✅ Explore the user interface
2. ✅ Test deposit/withdrawal flow
3. ✅ Place test bets
4. ✅ Check admin panel
5. ✅ Read VISUAL_WALKTHROUGH.md
6. ✅ Customize for your needs

---

## 💡 Tips

1. **Keep both terminals open** while testing
2. **Refresh browser** after database changes
3. **Check console** for error messages
4. **Use Chrome DevTools** (F12) for debugging
5. **Read documentation files** for more details

---

## 🆘 Still Having Issues?

If you encounter errors not covered here:

1. Check the error message carefully
2. Look in browser console (F12)
3. Check backend terminal for errors
4. Verify all files are present
5. Try reinstalling: `rm -rf node_modules && npm install`

---

## ✅ Success Checklist

Before using the platform, verify:

- [ ] Node.js installed (v14+)
- [ ] npm install completed without errors
- [ ] Backend running on port 3001
- [ ] Frontend running on port 3000
- [ ] Can access http://localhost:3000
- [ ] Can login as admin
- [ ] Can create user account
- [ ] Database connected (check backend logs)

---

## 🎉 You're All Set!

If you see:
- ✅ Backend running
- ✅ Frontend accessible
- ✅ Can login
- ✅ Can see matches

**Congratulations! Your cricket trading platform is running!** 🏏💰

---

**Need help?** Check other documentation files:
- `QUICKSTART.md` - Quick reference
- `WHAT_YOU_HAVE.md` - Feature overview
- `VISUAL_WALKTHROUGH.md` - UI guide
- `DEPLOYMENT.md` - Production deployment
