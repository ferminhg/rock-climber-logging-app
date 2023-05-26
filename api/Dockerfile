FROM ruby:3.2

# Instalar dependencias del sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Copiar el archivo Gemfile y Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instalar las gemas
RUN bundle install

# Copiar todo el código fuente al contenedor
COPY . .

# Ejecutar los comandos de inicio del servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
