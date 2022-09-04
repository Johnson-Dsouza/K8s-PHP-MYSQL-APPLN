# Kubernetes PHP-MySQL Application with Nginx

To setup the application:

1. Start minikube: `minikube start`
2. Use Docker daemon inside minikube: `eval $(minikube docker-env)`
3. Build the Docker image: `docker build -t johnson:latest .`
    Once the Docker image is built, check if it is available in the local Docker cache with `docker image ls`
    In recent versions of Docker, BuildKit is used by default so to build the image use: `docker buildx build -t johnson:latest --load .`
4. Apply the `ConfigMap`: `kubectl apply -f configmap.yaml`
5. Apply the `Deployment`: `kubectl apply -f deployment.yaml`
6. Apply the `Service`: `kubectl apply -f service.yaml`
7. Expose the PHP Application Service with `minikube service php-service`.
    In recent versions of minikube, you may need to use `kubectl port-forward php-app 8080:80` instead.
8. Expose the PHP Application Service outside the minikube with `kubectl port-forward pod/php-service 8080:80 --address='0.0.0.0'`
9. If all the steps ran successfully, the application should now be available on http://127.0.0.1:8080
