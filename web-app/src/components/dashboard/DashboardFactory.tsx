import {Dashboard} from "@/components/dashboard/Dashboard";

import {routes_responses} from "../../../utils/routes_responses";
import {InMemoryRouteRepository} from "@/infrastructure/InMemoryRouteRepository";
import {ApiRouteRepository} from "@/infrastructure/ApiRouteRepository";

const routes_data :typeof routes_responses = routes_responses
const inMemoryRepository = new InMemoryRouteRepository(routes_data.data)

const API_URL_ROUTE: string = process.env.NEXT_PUBLIC_API_ROUTE_URL || 'http://localhost:8080'
const apiRepository = new ApiRouteRepository(API_URL_ROUTE)

export class DashboardFactory {
    static create(): React.ReactElement {
        return <Dashboard repository={apiRepository}/>
    }
}
