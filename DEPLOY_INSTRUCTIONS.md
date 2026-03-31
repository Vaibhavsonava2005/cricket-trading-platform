# 🚀 Deploy to Vercel in 5 Minutes

## Step 1: Push to GitHub

```bash
# Create repo on GitHub: https://github.com/new
# Name it: cricket-trading-platform

# Then run these commands:
cd cricket-trading-platform-clean
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/cricket-trading-platform.git
git branch -M main
git push -u origin main
```

## Step 2: Deploy on Vercel

1. Go to https://vercel.com
2. Click "Add New Project"
3. Import your GitHub repository
4. Add Environment Variables:
   ```
   DATABASE_URL = postgresql://neondb_owner:npg_GMmcinsdE30L@ep-rapid-dream-an87i8ks-pooler.c-6.us-east-1.aws.neon.tech/neondb?sslmode=require
   JWT_SECRET = your_random_secret_string_12345
   PORT = 3001
   NODE_ENV = production
   ```
5. Click "Deploy"

## Step 3: Done! 🎉

Your app will be live at: `https://your-app.vercel.app`

**Login:**
- Admin: admin@crickettrading.com / admin123

---

**Need detailed instructions?** Read `DEPLOY_TO_VERCEL.md`

**Checklist:** See `DEPLOYMENT_CHECKLIST.md`
