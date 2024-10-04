{{- define "deployment.spec.template.spec.volumes.shm" -}}
{{- if .Values.application.shmVolumeSize -}}
- name: shm-volume
  emptyDir:
    medium: Memory
    sizeLimit: {{ .Values.application.shmVolumeSize }}
{{- end -}}
{{- end -}}