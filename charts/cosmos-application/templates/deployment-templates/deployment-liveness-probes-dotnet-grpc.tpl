{{- define "deployment.spec.template.spec.containers.liveness-probe.dotnet-grpc" }}
{{- if (and (eq .Values.application.language "dotnet") (eq .Values.application.serviceProtocol "grpc")) -}}
livenessProbe:
  #
  # dotnet grpc
  #
  exec:
    command:
    - "/bin/grpc_health_probe"
    - "-addr=:{{ required ".application.port is required" .Values.application.port }}"
    - "-service"
    - "Live"
    - "-connect-timeout"
    - "{{ .Values.application.livenessProbe.grpcConnectTimeoutSeconds | default 5 }}s"
    - "-rpc-timeout"
    - "{{ .Values.application.livenessProbe.grpcRpcTimeoutSeconds | default 30 }}s"
  initialDelaySeconds: {{ .Values.application.livenessProbe.initialDelaySeconds | default 15 }}
  periodSeconds: {{ .Values.application.livenessProbe.periodSeconds | default 20 }}
  timeoutSeconds: {{ .Values.application.livenessProbe.grpcRpcTimeoutSeconds | default 30 }}
  terminationGracePeriodSeconds: {{ .Values.application.livenessProbe.terminationGracePeriodSeconds | default 120 }}
{{- end }}
{{- end }}