# 🧗‍Rock Climber Loggin App [RCLA]

## Description

Climbing Route Registration and Tracking Application.
An application that allows users to register and visualize the climbing routes they have completed. 

Each route should have information such as: location, difficulty level, date climbed, comments. 

Users should be able to view statistics and averages of their ascents.

Project board: https://github.com/users/ferminhg/projects/1/views/1 

### 🔥 Application README's

- 🦋 Web-app (TS + Reactjs): [README](/web-app/README.md)
- 🚂 API-REST (Ruby on Rails): [README](/api/README.md)

## 🚀 Environment Setup

### 🐳 Needed tools

- Ruby: https://www.ruby-lang.org/en/documentation/installation/
- Rails: https://guides.rubyonrails.org/v5.0/getting_started.html
- node: https://nodejs.org/en/download
- npm: https://docs.npmjs.com/downloading-and-installing-node-js-and-npm


## 👩‍💻 Project explanation

This project is a web application that allows users to register and visualize the climbing routes they have completed.
It should apply the hexagonal architecture and the SOLID principles. 

The application uses the following technologies:
- Web-app:
  - React
  - Next.js
  - Typescript
- Backend:
  - RoR
  - SQLite
  - Docker

### 🎯 Hexagonal Architecture

```bash
$ tree -L 4 api

api/
├── Dockerfile
├── Gemfile
├── app
│   ├── application // the aplication layer contains all the uses cases of the application. They use ports, are agnostic to the infra implementation
│   │   ├── create_route_handler.rb
│   │   ├── populate_data_storage_on_route_created.rb
│   │   └── search_all_routes_query_handler.rb
│   ├── controllers // the controllers layer contains the entry points of the application. They use the application layer and define the infra implementation
│   │   ├── application_controller.rb
│   ├── domain
│   │   ├── create_route_dto.rb //DTOs are used to pass data between layers
│   │   ├── difficult_level.rb // Value object that contains their logic
│   │   ├── params_route_sanitizer.rb // Sanitizes the params from the controller
│   │   ├── route.rb // Entity that contains their logic
│   │   ├── route_created_event.rb // Event that is used to notify the application layer
│   │   └── route_error.rb // Domin Error, add semantic to the errors
│   ├── infrastructure
│   │   ├── in_memory_event_store.rb // Memory implementation of the event store, used for testing
│   │   ├── in_memory_route_repository.rb // Memory implementation of the route repository, used for testing
│   │   └── sqlite_route_repository.rb // SQLite implementation of the route repository
│   └── models
│       └── route_model.rb // Not used
├── config
│   ├── database.yml
│   ├── initializers
│   │   ├── rails_event_store.rb // Configures the event store. Connect events and subscribers
│   │   └── sentry.rb // Observability tool
│   ├── routes.rb
├── db
│   ├── migrate // Migrations
│   │   ├── 20230529185421_create_route_models.rb
│   │   ├── 20230529191822_change_climbing_time_to_integer.rb
│   │   └── 20230607075003_create_event_store_events.rb
├── docker-compose.yml
├── spec // Tests
│   ├── application
│   │   ├── create_route_handler_spec.rb
│   │   └── search_all_routes_query_handler_spec.rb
│   ├── controllers // Integration tests
│   │   └── application_controller_spec.rb
│   ├── domain
│   │   ├── calculator_spec.rb
│   │   ├── create_route_dto_mother.rb
│   │   ├── params_route_sanitizer_spec.rb
│   │   ├── route_object_mother.rb
│   │   └── route_spec.rb
├──

```


```bash
$ tree -L 4 web-app

web-app/
├── README.md
├── jest.config.mjs
├── next-env.d.ts
├── next.config.js
├── package.json
├── pages // Entry points of the application
│   ├── _app.tsx
│   ├── index.tsx // Dashboard
│   └── route
│       └── new.tsx // New route form
├── pnpm-lock.yaml
├── public
├── sentry.client.config.ts // Observability tool
├── src
│   ├── app
│   │   ├── globals.css
│   │   └── layout.tsx
│   ├── components
│   │   ├── dashboard
│   │   │   ├── ClimingTime.tsx
│   │   │   ├── Dashboard.tsx // Dashboard component
│   │   │   ├── DashboardFactory.tsx // Factory that creates the dashboard
│   │   │   ├── dashboard.module.css
│   │   │   └── useRouteRepository.ts // Hook that uses the route repository
│   │   ├── layout
│   │   │   ├── Header.tsx
│   │   │   ├── Layout.tsx
│   │   │   └── header.module.css
│   │   └── newRouteForm
│   │       ├── NewRouteForm.tsx // New route form component
│   │       └── newrouteform.module.css
│   ├── domain
│   │   ├── Route.ts // Entity that contains their logic
│   │   └── RouteRepository.ts // Port that defines the repository
│   ├── infrastructure
│   │   ├── ApiRouteRepository.ts // API implementation of the route repository
│   │   └── InMemoryRouteRepository.ts // Memory implementation of the route repository, used for testing
│   └── tests
│       ├── dummy.test.ts
│       └── index.test.tsx
├── tsconfig.json
└── utils
    └── routes_responses.ts // Contains the responses of the API for testing purposes

```

#### 📚 Resources
- https://medium.com/@vsavkin/hexagonal-architecture-for-rails-developers-8b1fee64a613

💡 Some inspiration:

- https://github.com/CodelyTV/typescript-ddd-example
- https://github.com/CodelyTV/typescript-ddd-skeleton


## 📱 Monitoring

The app is monitored using sentry.io:
- https://sentry.io/organizations/ferminhg/XY
- https://sentry.io/organizations/ferminhg/ZY


# 📓 Changelog

**2023-05-25**
- Doing the refinement of https://github.com/ferminhg/rock-climber-logging-app/issues/4 I decided to know use activeRecord model on Rails and try to use the repository pattern. The goals is create layers between domain models and infra persistence. 

