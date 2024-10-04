{{- define "deployment.spec.template.spec.containers.volume-mounts.ssm-parameters" -}}
{{- if .Values.application.ssmParameterMounts }}
{{- range $item := .Values.application.ssmParameterMounts }}
- mountPath: {{ $item.mountPath | quote }}
  subPath: {{ $item.path | quote }}
  name: {{ $item.name | quote }}
  readOnly: true
{{- end -}}
{{- end -}}
{{- end -}}