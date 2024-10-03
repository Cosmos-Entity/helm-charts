{{- define "deployment.spec.template.spec.containers.readiness-probe.dotnet-grpc" -}}
{{- if (and (eq .Values.application.language "dotnet") (eq .Values.application.serviceProtocol "grpc")) -}}
readinessProbe:
  #
  # dotnet grpc
  #
  exec:
    command:
    - "/bin/grpc_health_probe"
    - "-addr=:{{ required ".Values.application.port is required" .Values.application.port }}"
    - "-service"
    - "Ready"
    - "-connect-timeout"
    - "{{ .Values.readinessProbeGrpcConnectTimeoutSeconds | default 5 }}s"
    - "-rpc-timeout"
    - "{{ .Values.readinessProbeGrpcRpcTimeoutSeconds | default 30 }}s"
  initialDelaySeconds: {{ .Values.readinessProbeInitialDelaySeconds | default 10 }}
  periodSeconds: {{ .Values.readinessProbePeriodSeconds | default 10 }}
  timeoutSeconds: {{ .Values.readinessProbeGrpcRpcTimeoutSeconds | default 30 }}
{{- end -}}
{{- end }}