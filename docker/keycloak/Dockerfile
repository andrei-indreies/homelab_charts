FROM quay.io/keycloak/keycloak:25.0 as builder

USER root
WORKDIR /opt/keycloak

# Copy your custom provider
COPY providers /opt/keycloak/providers

# Build Keycloak with the provider
RUN /opt/keycloak/bin/kc.sh build

# Final image
FROM quay.io/keycloak/keycloak:25.0

COPY --from=builder /opt/keycloak /opt/keycloak