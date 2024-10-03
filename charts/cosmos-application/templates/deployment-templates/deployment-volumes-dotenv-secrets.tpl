{{- define "deployment.spec.template.spec.volumes.dotenv-secrets" -}}
{{- if .Values.application.dotenvMountPath -}}
- name: secrets-volume
  secret:
    items:
    - key: env
      path: .env
    secretName: {{ required "serviceId is required" .Values.application.serviceId }}-secret
{{- end -}}
{{- end -}}