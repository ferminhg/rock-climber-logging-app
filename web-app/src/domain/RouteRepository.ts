import {Route} from "@/domain/Route";

export interface RouteRepository {
    search(): Promise<Route[]>
}
