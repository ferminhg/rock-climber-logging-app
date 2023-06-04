import { Inter } from 'next/font/google'
import * as Sentry from "@sentry/nextjs";

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: '🧗‍Rock Climber Login App',
  description: 'Da best! 🤘 Rock Climber Login App 📈',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en" suppressHydrationWarning={true}>
      <body className={inter.className}>
      {children}
      </body>
    </html>
  )
}
