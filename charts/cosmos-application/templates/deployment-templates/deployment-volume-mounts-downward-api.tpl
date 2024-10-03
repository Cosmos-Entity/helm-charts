{{- define "deployment.spec.template.spec.containers.volume-mounts.downward-api" }}
#
# downward api
#
- name: podinfo
  mountPath: /etc/podinfo
{{- end }}