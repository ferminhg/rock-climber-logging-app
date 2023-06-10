import {Header} from "@/components/layout/Header";
import {Footer} from "@/components/layout/Footer";

// @ts-ignore
export default function Layout({ children }) {
    return (
        <>
            <Header />
            <div>{children}</div>
            <Footer />
        </>
    );
}