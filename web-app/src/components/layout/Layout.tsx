import {Header} from "@/components/layout/Header";

// @ts-ignore
export default function Layout({ children }) {
    return (
        <>
            <Header />
            <div>{children}</div>
            <footer>wop wop®️</footer>
        </>
    );
}