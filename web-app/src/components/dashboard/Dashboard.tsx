import styles from './dashboard.module.css'

export function Dashboard({ repository }: { repository: any }) {
    const isLoading = false
    const repositoryData = repository.data

    return (
        <>
            {isLoading && (
                <section className={styles.container}>Loading ...</section>
            )}
            {!isLoading && repositoryData.length === 0 ? (
                <div className={styles.empty}>
                    <span>Not routes climbed 😡 Go to the rock 🤘</span>
                </div>
            ) : (
                <section className={styles.container}>
                    {repositoryData.map((route: any) => (
                        <div key={route.id} className={styles.widget}>
                            <span className={styles.difficult}>{route.difficult_level}</span>
                            <span className={styles.time}>{ClimbingTime(route.climbing_time)}</span>
                            <p className={styles.comments}>{route.comments}</p>
                        </div>
                    ))}
                </section>
            )}
        </>
    )
}

function ClimbingTime(climbing_time: any) {
    const date = new Date(climbing_time * 1000);
    return <span className={styles.time}>{date.toLocaleDateString()}</span>;

}
