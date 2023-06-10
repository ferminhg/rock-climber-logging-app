import Head from 'next/head';
import Layout from "@/components/layout/Layout";
import { Inter } from 'next/font/google';
import { AppProps } from 'next/app';
import '@/app/globals.css';


import '@fontsource/roboto/300.css';
import '@fontsource/roboto/400.css';
import '@fontsource/roboto/500.css';
import '@fontsource/roboto/700.css';
import React from "react";


const primaryFont = Inter({
    subsets: ['latin'],
    variable: '--primary-font',
});

export const metadata = {
    title: '🧗‍Rock Climber Login App',
    description: 'Da best! 🤘 Rock Climber Login App 📈',
};


export default function App({ Component, pageProps }: AppProps) {
    return (
        <main className={`${primaryFont.variable} font-sans`}>
            <Head>
                <title>{metadata.title}</title>
                <meta name="description" content={metadata.description} />
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com" />
            </Head>
            <Layout>
                <Component {...pageProps} />
            </Layout>
        </main>
    );
};
