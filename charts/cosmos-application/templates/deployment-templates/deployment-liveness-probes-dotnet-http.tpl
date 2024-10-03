{{- define "deployment.spec.template.spec.containers.liveness-probe.dotnet-http" }}
{{- if eq .Values.livenessProbe.enabled true -}}
{{- if (and (eq .Values.application.language "dotnet") (eq .Values.application.serviceProtocol "http")) -}}
livenessProbe:
  #
  # dotnet http
  #
  httpGet:
    path: /healthz/live
    port: {{ required ".application.port is required" .Values.application.port }}
  initialDelaySeconds: {{ .Values.livenessProbe.initialDelaySeconds | default 15 }}
  periodSeconds: {{ .Values.livenessProbe.periodSeconds | default 20 }}
  timeoutSeconds: {{ .Values.livenessProbe.timeoutSeconds | default 10 }}
  terminationGracePeriodSeconds: {{ .Values.livenessProbe.terminationGracePeriodSeconds | default 120 }}
{{- end -}}
{{- end -}}
{{- end }}