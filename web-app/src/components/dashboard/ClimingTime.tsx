import styles from "@/components/dashboard/dashboard.module.css";


export function ClimbingTime({climbing_time}: {climbing_time: number}) {
    const climbingDate = new Date(climbing_time * 1000);
    return <span className={styles.time}>{climbingDate.toLocaleDateString()}</span>;
}