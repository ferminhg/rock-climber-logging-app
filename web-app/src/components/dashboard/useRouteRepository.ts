import {useEffect, useState} from "react";

import {RouteRepository} from "@/domain/RouteRepository";
import {Route} from "@/domain/Route";

export function useRouteRepository(
    repository: RouteRepository
): { repositoryData: Route[]; isLoading: boolean, error?: Error} {
    const [repositoryData, setRepositoryData] = useState<Route[]>([])
    const [isLoading, setIsLoading] = useState(true)
    const [error, setError] = useState<Error>()

    useEffect(() => {
        setIsLoading(true)
        repository.search()
            .then((routes) => {
                setRepositoryData(routes)
                setIsLoading(false)
            })
            .catch((error) => {
                setError(error as Error)
                setIsLoading(false)
            })
    }, [repository])

    return { repositoryData, isLoading, error}
}
