{{- define "deployment.spec.template.spec.containers.volume-mounts.dotenv-secrets" -}}
{{- if .Values.application.dotenvMountPath }}
#
# .env secrets from ssm parameter store
#
- name: secrets-volume
  subPath: .env
  mountPath: /app/.env
  readOnly: true
{{- end -}}
{{- end -}}