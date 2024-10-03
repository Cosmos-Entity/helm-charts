{{- define "deployment.spec.template.spec.containers.readiness-probe.dotnet-http" -}}
{{- if (and (eq .Values.application.language "dotnet") (eq .Values.application.serviceProtocol "http")) -}}
readinessProbe:
  #
  # dotnet http readiness
  #
  httpGet:
    path: /healthz/ready
    port: {{ required "application.port is required" .Values.application.port }}
  initialDelaySeconds: {{ .Values.application.readinessProbeInitialDelaySeconds | default 10 }}
  periodSeconds: {{ .Values.application.readinessProbePeriodSeconds | default 10 }}
  timeoutSeconds: {{ .Values.application.readinessProbeTimeoutSeconds | default 10 }}
{{- end -}}
{{- end -}}