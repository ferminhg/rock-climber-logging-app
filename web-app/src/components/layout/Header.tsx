import styles from './header.module.css';
import Link from "next/link";

export function Header() {
    return (
        <header className={styles.header}>
            <Link href="/">
                <h1 className={styles.item}>You Rock 🤘 Climber 🧗‍</h1>
            </Link>
            <Link href="/route/new" className={styles.item}>
                <button>➕ Add route</button>
            </Link>
        </header>
    )
}