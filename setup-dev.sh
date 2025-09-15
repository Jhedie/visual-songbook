#!/bin/bash

echo "🔧 Setting up Tauri development environment..."

# Check if we're in a container/codespace
if [ -n "$CODESPACES" ] || [ -n "$GITPOD_WORKSPACE_ID" ] || [ -f /.dockerenv ]; then
    echo "📦 Container environment detected"
    
    # Install system dependencies if needed
    if ! command -v pkg-config &> /dev/null; then
        echo "📥 Installing system dependencies..."
        sudo apt-get update > /dev/null 2>&1
        sudo apt-get install -y libgtk-3-dev libwebkit2gtk-4.1-dev libayatana-appindicator3-dev librsvg2-dev pkg-config xvfb > /dev/null 2>&1
    fi
    
    # Set up virtual display
    export DISPLAY=:99
    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8
    
    # Start virtual display if not running
    if ! pgrep -f "Xvfb :99" > /dev/null; then
        echo "🖥️  Starting virtual display..."
        Xvfb :99 -screen 0 1024x768x24 -ac +extension GLX +render -noreset > /dev/null 2>&1 &
        sleep 2
    fi
    
    echo "✅ Container setup complete!"
else
    echo "💻 Local development detected - no special setup needed"
fi

# Install npm dependencies if needed
if [ ! -d "node_modules" ]; then
    echo "📦 Installing npm dependencies..."
    npm install
fi

echo "🚀 Ready to develop! Run 'npm run tauri dev' to start"
