{{- define "deployment.spec.template.spec.containers.volume-mounts.dotnet-appsettings" -}}
{{- if (and (eq .Values.application.language "dotnet") (not (coalesce .Values.application.suppressAppSettingsMount false))) }}
#
# dotnet appsettings from ssm parameterstore
#
- mountPath: /app/appsettings.json
  subPath: appsettings.json
  name: secrets
  readOnly: true
{{- end -}}
{{- end -}}