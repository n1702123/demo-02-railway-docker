# ---- Stage 1: 安裝相依套件 ----
FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

# ---- Stage 2: Build ----
FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

# ---- Stage 3: 執行（最小化 image）----
FROM node:20-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production

# 只複製執行需要的檔案
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

# Railway 會自動設定 PORT 環境變數
EXPOSE 3000
ENV PORT=3000

CMD ["node", "server.js"]
