version: '2'
services:
  de-ondics-minio:
    image: registry.app-pool.scaleit-i40.de/r16/enterprise/de-ondics-minio:1.0
    restart: always
    labels:
      rap.host: ${DOMAINPREFIX}-api=>http:9000
      rap.host: ${DOMAINPREFIX}=>http:9001
      rap.sso_disabled: "true"
{{- if eq .Values.ssoproxy "false"}}
    ports:
      - "${APP_DOMAIN_PORT}:9000
      - "${APP_CONSOLE_PORT}:9001
{{- end}}
    volumes:
      - de-ondics-minio:/data
    environment:
      MINIO_ROOT_USER: scaleit
      MINIO_ROOT_PASSWORD: scaleitscaleit
      MINIO_BROWSER_REDIRECT_URL: ${DOMAINPREFIX}.${IPADDR}
    command: server /data --console-address ":9001"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:9000/minio/health/live"]
      interval: 30s
      timeout: 20s
      retries: 3


  de-ondics-minio-registration:
    image: registry.app-pool.scaleit-i40.de/r16/enterprise/de-ondics-minio-registration:1.0
    restart: always
    environment:
      - APP_ID=de-ondics-minio
      - APP_NAME=Objectstorage-Minio
      - APP_TITLE=Objectstorage-Minio
      - APP_SHORT_DESCRIPTION=Objectstorage-Minio
      - APP_DESCRIPTION=Objectstorage-Minio
      - APP_CATEGORY=objectstorage
      - APP_DOMAIN_PORT=${APP_PA_PORT}
      - APP_DOMAIN_PATH=
      - APP_DOMAIN_SERVICENAME=
      - APP_ICON_PORT=${APP_SIDECAR_WEBCONTENT_PORT}
      - APP_ICON_PATH=/icon.png
      - APP_ICON_SERVICENAME=wc
      - HOST_IP=${HOST_IPADDR}
      - SSO_ACTIVATED=${ssoproxy}
      - SSO_APP_PREFIX=${DOMAINPREFIX}
      - STACK_NAME={{ .Stack.Name }}

  de-ondics-minio-webcontent:
    image: registry.app-pool.scaleit-i40.de/r16/enterprise/de-ondics-minio-webcontent:1.0
{{- if eq .Values.ssoproxy "false"}}
    ports:
      - "${APP_SIDECAR_WEBCONTENT_PORT}:8000"
{{- else}}
    labels:
      rap.sso_disabled: "true"
      rap.host: wc-${DOMAINPREFIX}
      rap.port: "8000"
{{- end}}

volumes:
  de-ondics-minio:
