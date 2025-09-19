# Tauri + SvelteKit + TypeScript

This template should help get you started developing with Tauri, SvelteKit and TypeScript in Vite.

## Recommended IDE Setup

[VS Code](https://code.visualstudio.com/) + [Svelte](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode) + [Tauri](https://marketplace.visualstudio.com/items?itemName=tauri-apps.tauri-vscode) + [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer).

progress
15/09/2025: ![Alt text](./progress_screenshots/CleanShot%202025-09-19%20at%2017.59.21@2x.png)

# Visual Songbook Development

## Quick Start (Recommended)

### Using GitHub Codespaces (Easiest)

1. Click "Code" → "Codespaces" → "Create codespace"
2. Wait for setup to complete
3. Run: `./setup-dev.sh && npm run tauri dev`

### Using VS Code Dev Containers

1. Install [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. Open project in VS Code
3. Click "Reopen in Container" when prompted
4. Run: `npm run tauri dev`

### Local Development

```bash
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install system dependencies (Ubuntu/Debian)
sudo apt-get install libgtk-3-dev libwebkit2gtk-4.1-dev libayatana-appindicator3-dev librsvg2-dev

# Install Node dependencies
npm install

# Start development server
npm run tauri dev
```

## Troubleshooting

### "GTK initialization failed" in containers

This is normal in containerized environments. The setup script handles this automatically.

### "Locale not supported" warnings

These are harmless warnings and don't affect functionality.

## Architecture

- **Frontend**: SvelteKit + Vite
- **Backend**: Rust + Tauri
- **Development**: Docker containers with virtual display support
