import {Route} from "@/domain/Route";
import {RouteRepository} from "@/domain/RouteRepository";

export class ApiRouteRepository implements RouteRepository {
  private readonly apiRoute: string;

  constructor(apiRoute: string) {
    this.apiRoute = apiRoute;
  }

  async search(): Promise<Route[]> {
    try {
      let response = await fetch(`${this.apiRoute}/routes`);

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();
      if (!data.data) {
        throw new Error('No data in response');
      }

      return data.data;
    } catch (error) {
      console.error('An error occurred:', error);
      throw error;
    }
  }
}
