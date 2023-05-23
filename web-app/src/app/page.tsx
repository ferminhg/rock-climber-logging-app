import styles from './page.module.css'

export default function Home() {
  return (
    <main className={styles.main}>
      <div className={styles.description}>
        <h1>
          🧗‍♀ Rocking with you
        </h1>
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
