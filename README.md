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
  - Postgres
  - Redis
  - Docker

### 🎯 Hexagonal Architecture

```bash
$ tree -L 4 web-app
```


```bash
$ tree -L 4 be
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

