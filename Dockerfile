FROM php:8.0-fpm
RUN mkdir /app
RUN docker-php-ext-install mysqli
COPY EmployeesDetails/* /app/
