import { defineConfig } from 'vite';
import reactRefresh from '@vitejs/plugin-react-refresh';

const env = process.env.NODE_ENV;
console.log('env:', env);

// https://vitejs.dev/config/
export default defineConfig({
  base: env === 'production' ? '/' : '/g/',
  build: {
    manifest: true,
    rollupOptions: {
      input: './src/main.tsx'
    }
  },
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost:4000',
        changeOrigin: true
      }
    }
  },
  plugins: [reactRefresh()]
});

