import styles from '@/components/dashboard/dashboard.module.css'

import {ClimbingTime} from "@/components/dashboard/ClimingTime";
import {RouteRepository} from "@/domain/RouteRepository";
import {useEffect, useState} from "react";
import {useRouteRepository} from "@/components/dashboard/useRouteRepository";

export function Dashboard({ repository }: { repository: RouteRepository }) {
    const {isLoading, repositoryData} = useRouteRepository(repository)

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
                            <span className={styles.time}><ClimbingTime climbing_time={route.climbing_time}/></span>
                            <p className={styles.comments}>{route.comments}</p>
                        </div>
                    ))}
                </section>
            )}
        </>
    )
}
