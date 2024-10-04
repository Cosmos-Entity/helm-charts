{{- define "deployment.spec.template.spec.volumes.empty-dir" -}}
{{- if .Values.application.ephemeralVolumeMountPath -}}
- name: ephemeral
  emptyDir: {}
{{- end -}}
{{- end -}}