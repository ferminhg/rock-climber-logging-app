import {Dashboard} from "@/components/dashboard/Dashboard";

import {routes_responses} from "../../../utils/routes_responses";

const repository :typeof routes_responses = routes_responses
export class DashboardFactory {
    static create(): React.ReactElement {
        return <Dashboard repository={repository}/>
    }
}
