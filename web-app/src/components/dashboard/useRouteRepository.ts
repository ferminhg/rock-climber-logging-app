import {useEffect, useState} from "react";

import {RouteRepository} from "@/domain/RouteRepository";
import {Route} from "@/domain/Route";

export function useRouteRepository(
    repository: RouteRepository
): { repositoryData: Route[]; isLoading: boolean } {
    const [repositoryData, setRepositoryData] = useState<Route[]>([])
    const [isLoading, setIsLoading] = useState(true)

    useEffect(() => {
        repository.search().then((routes) => {
            setRepositoryData(routes)
            setIsLoading(false)
        })
    }, [repository])

    return { repositoryData, isLoading }
}
