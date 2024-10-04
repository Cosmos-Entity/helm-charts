{{- define "deployment.spec.template.spec.containers.env.dotnet" -}}
{{- if (eq .Values.application.language "dotnet") -}}
#
# dotnet common env vars
#
- name: DOTNET_ENVIRONMENT
  value: {{ template "dotnetEnvironment" . }}
- name: ASPNETCORE_ENVIRONMENT
  value: {{ template "dotnetEnvironment" . }}
- name: OpenTelemetry__OtlpExporter__Endpoint
  value: http://$(MY_NODE_IP):4317
- name: DD_RUNTIME_METRICS_ENABLED
  value: "true"
{{- end }}
{{- end -}}