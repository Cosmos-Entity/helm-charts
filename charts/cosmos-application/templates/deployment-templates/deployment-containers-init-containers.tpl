{{- define "deployment.spec.template.spec.init-containers" }}
#
# init containers
#
initContainers:
- name: disable-ec2-metadata-access
  image: radial/busyboxplus:git
  command: ['/bin/sh', '-c', 'route add -host 169.254.169.254 reject']
  securityContext:
    privileged: true
{{- end }}
