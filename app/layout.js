export const metadata = {
  title: 'Hello World - Railway',
  description: 'Next.js + Docker + GitHub Actions + Railway Demo',
}

export default function RootLayout({ children }) {
  return (
    <html lang="zh-TW">
      <body>{children}</body>
    </html>
  )
}
