{{- define "deployment.spec.template.spec.containers.ports.service" -}}
- containerPort: {{ required ".application.port is required" .Values.application.port }}
  name: {{ required ".application.portName is required" .Values.application.portName }}
  protocol: TCP
{{- end }}