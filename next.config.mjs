/** @type {import('next').NextConfig} */
const nextConfig = {
  // Railway 跑真正的 Node.js Server，不需要靜態輸出
  // standalone 模式讓 Docker image 更小（只打包執行需要的檔案）
  output: 'standalone',
}

export default nextConfig
