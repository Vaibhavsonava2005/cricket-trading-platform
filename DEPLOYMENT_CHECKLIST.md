# ✅ Vercel Deployment Checklist

## Pre-Deployment

- [ ] All files ready in `cricket-trading-platform-clean` folder
- [ ] GitHub account created
- [ ] Vercel account created
- [ ] Database URL ready (Neon PostgreSQL)

## GitHub Setup

- [ ] Create new repository on GitHub
- [ ] Upload all project files OR use git push
- [ ] Verify all files are visible on GitHub
- [ ] Check that `.env` is NOT uploaded (it's in .gitignore)

## Vercel Setup

- [ ] Log in to Vercel
- [ ] Import project from GitHub
- [ ] Configure project settings

## Environment Variables (CRITICAL!)

Add these in Vercel:

- [ ] `DATABASE_URL` = `postgresql://neondb_owner:npg_GMmcinsdE30L@ep-rapid-dream-an87i8ks-pooler.c-6.us-east-1.aws.neon.tech/neondb?sslmode=require`
- [ ] `JWT_SECRET` = `your_super_secret_random_string_change_this`
- [ ] `PORT` = `3001`
- [ ] `NODE_ENV` = `production`

## Deploy

- [ ] Click "Deploy" button
- [ ] Wait for build to complete (2-3 minutes)
- [ ] Check for build errors
- [ ] If errors, check logs and fix

## Testing

- [ ] Visit your Vercel URL
- [ ] Homepage loads correctly
- [ ] Login page works
- [ ] Can login as admin (`admin@crickettrading.com` / `admin123`)
- [ ] Admin panel accessible at `/admin`
- [ ] Can see live matches
- [ ] Can create user account
- [ ] Can request deposit
- [ ] Admin can approve deposit
- [ ] Can place bet
- [ ] API endpoints working (check Network tab in browser)

## Post-Deployment

- [ ] Change admin password
- [ ] Test all features
- [ ] Monitor error logs on Vercel
- [ ] Set up custom domain (optional)
- [ ] Share URL with users

## Troubleshooting

If something doesn't work:

1. Check Vercel logs: Dashboard → Logs
2. Check browser console: F12 → Console tab
3. Verify environment variables are set
4. Check DATABASE_URL is correct
5. Try redeploying: Click "Redeploy"

## Success Criteria

✅ Homepage loads
✅ Can login
✅ Can see matches
✅ Can place bets
✅ Admin panel works
✅ Database connected

---

**Your Vercel URL:** `https://________.vercel.app`

**Admin Login:**
- Email: admin@crickettrading.com
- Password: admin123

**IMPORTANT:** Change admin password after first login!

---

## Quick Deploy Commands (Alternative - Using Vercel CLI)

If you prefer command line:

```bash
# Install Vercel CLI
npm i -g vercel

# Navigate to project
cd cricket-trading-platform-clean

# Login to Vercel
vercel login

# Deploy
vercel

# Follow prompts and add environment variables when asked

# Deploy to production
vercel --prod
```

---

**Need Help?** Read DEPLOY_TO_VERCEL.md for detailed guide!
