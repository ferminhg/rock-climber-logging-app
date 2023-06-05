import Layout from "@/components/layout/Layout";
import { Inter } from 'next/font/google';
import { AppProps } from 'next/app';
import '@/app/globals.css';

const primaryFont = Inter({
    subsets: ['latin'],
    variable: '--primary-font',
});

export const metadata = {
    title: '🧗‍Rock Climber Login App',
    description: 'Da best! 🤘 Rock Climber Login App 📈',
}


export default function App({ Component, pageProps }: AppProps) {
    return (
        <main className={`${primaryFont.variable} font-sans`}>
            <Layout>
                <Component {...pageProps} />
            </Layout>
        </main>
    );
}
