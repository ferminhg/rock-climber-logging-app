import {Dashboard} from "@/components/dashboard/Dashboard";

import {routes_responses} from "../../../utils/routes_responses";
import {InMemoryRouteRepository} from "@/infrastructure/InMemoryRouteRepository";

const routes_data :typeof routes_responses = routes_responses
const inMemoryRepository = new InMemoryRouteRepository(routes_data.data)
export class DashboardFactory {
    static create(): React.ReactElement {
        return <Dashboard repository={inMemoryRepository}/>
    }
}
