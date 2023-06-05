import {Route} from "@/domain/Route";
import {RouteRepository} from "@/domain/RouteRepository";

export class InMemoryRouteRepository implements RouteRepository {
  private readonly routes: Route[];

  constructor(routes: any[] = []) {
    this.routes = routes;
  }

  async save(route: Route): Promise<void> {
    this.routes.push(route);
  }

  async search(): Promise<Route[]> {
    return this.routes;
  }
}
