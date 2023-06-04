import {Header} from "@/components/layout/Header";

// @ts-ignore
export default function Layout({ children }) {
    return (
        <>
            <Header />
            <main>{children}</main>
            wop wop®️
        </>
    );
}