{{- define "deployment.spec.template.spec.volumes.dotnet-secrets" -}}
{{- if (and (eq .Values.application.language "dotnet") (not (coalesce .Values.application.suppressAppSettingsMount false))) -}}
- name: secrets
  secret:
    items:
    - key: appsettings
      path: appsettings.json
    secretName: {{ required "app.serviceId is required" .Values.application.serviceId }}-secret
{{- end -}}
{{- end -}}