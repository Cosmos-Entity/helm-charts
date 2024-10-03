{{- define "deployment.spec.template.spec.containers.volume-mounts.empty-dir" }}
{{- if .Values.application.ephemeralVolumeMountPath }}
#
# ephemeral
#
- name: ephemeral
  mountPath: {{ .Values.application.ephemeralVolumeMountPath | quote }}
{{- end -}}
{{- end -}}