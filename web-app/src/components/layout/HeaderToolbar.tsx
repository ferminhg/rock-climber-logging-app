import Link from "next/link";
import styles from "@/components/layout/header.module.css";
import Button from "@mui/material/Button";
import SendIcon from "@mui/icons-material/Send";

export function HeaderToolbar() {
    return (
        <>
            <Link href="/">
                    <h1 className={styles.item}>You Rock 🤘 Climber 🧗‍</h1>
                </Link>
            <Link href="/route/new" className={styles.item}>
                <Button variant="contained" endIcon={<SendIcon />}>
                    Add route
                </Button>
            </Link>
        </>
    )
}