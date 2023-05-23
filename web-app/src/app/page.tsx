import Image from 'next/image'
import styles from './page.module.css'

export default function Home() {
  return (
    <main className={styles.main}>
      <div className={styles.description}>
        <p>
          🧗‍♀ Rocking with you
        </p>
      </div>

      <div className={styles.grid}>
        <div
          className={styles.card}
        >
            👋 Build with ❤️
        </div>
      </div>
    </main>
  )
}
