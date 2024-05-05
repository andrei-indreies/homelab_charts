# Installing Traefik as Your Default Ingress Controller

This guide provides instructions for installing Traefik as your default ingress controller in a Kubernetes cluster.

## Prerequisites

- You must have a running Kubernetes cluster with `kubectl` installed and configured.
- Ensure you have the necessary permissions to apply configurations and change the context.

## Installation Steps

1. Apply the necessary credentials to your Kubernetes cluster:

    ```bash
    kubectl apply -f credentials.yaml
    ```

    Make sure `credentials.yaml` contains the appropriate authentication and authorization settings required by Traefik.

2. Set the current context to the `traefik` namespace:

    ```bash
    kubectl config set-context --current --namespace=trawfik
    ```

    This step sets the default namespace to `main`, where you intend to deploy Traefik.

3. Install Traefik as your ingress controller using Helm:

    ```bash
    helm install traefik traefik/traefik --values traefik-values.yaml
    ```

    This command uses Helm to install Traefik with the specified values file (`traefik-values.yaml`). Adjust the values in `traefik-values.yaml` to customize Traefik according to your requirements.

Once these steps are completed, you can proceed with deploying Traefik as your ingress controller. For more information on deploying and configuring Traefik, please refer to the [Traefik documentation](https://doc.traefik.io/traefik/).

## Further Configuration

After installing Traefik, you may want to configure it further according to your requirements. Some common configurations include:

- [Creating Ingress routes](https://doc.traefik.io/traefik/routing/routers/)
- [Setting up TLS](https://doc.traefik.io/traefik/https/tls/)
- [Customizing middlewares](https://doc.traefik.io/traefik/middlewares/)

Refer to the [Traefik documentation](https://doc.traefik.io/traefik/) for more detailed information and examples.

## Troubleshooting

If you encounter any issues during the installation or configuration of Traefik, check the Kubernetes logs for more details:

```bash
kubectl logs -n traefik -l app=traefik
