{{- define "deployment.spec.template.spec.containers.volume-mounts.shm" -}}
{{- if .Values.application.shmVolumeSize }}
#
# .env secrets from ssm parameter store
#
- name: shm-volume
  mountPath: /dev/shm
{{- end -}}
{{- end -}}