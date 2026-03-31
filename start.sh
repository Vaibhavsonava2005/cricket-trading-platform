#!/bin/bash

echo "🏏 Starting Cricket Trading Platform..."
echo ""

# Kill any existing processes on ports 3000 and 3001
echo "🔧 Cleaning up existing processes..."
lsof -ti:3000 | xargs kill -9 2>/dev/null
lsof -ti:3001 | xargs kill -9 2>/dev/null

echo ""
echo "🚀 Starting Backend Server (Port 3001)..."
node server.js &
BACKEND_PID=$!

echo "🎨 Starting Frontend Server (Port 3000)..."
node frontend-server.js &
FRONTEND_PID=$!

echo ""
echo "✅ All services started!"
echo ""
echo "📊 Backend API: http://localhost:3001/api"
echo "🌐 Frontend: http://localhost:3000"
echo "👮 Admin Panel: http://localhost:3000/admin"
echo ""
echo "🔑 Default Admin Login:"
echo "   Email: admin@crickettrading.com"
echo "   Password: admin123"
echo ""
echo "Press Ctrl+C to stop all services"
echo ""

# Wait for both processes
wait $BACKEND_PID $FRONTEND_PID
