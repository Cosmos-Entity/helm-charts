{{- define "deployment.spec.template.spec.volumes.ssm-parameters" -}}
{{- if .Values.application.ssmParameterMounts -}}
{{- range $item := .Values.application.ssmParameterMounts }}
- name: {{ $item.name | quote }}
  secret:
    items:
    - key: {{ $item.key | quote }}
      path: {{ $item.path | quote }}
    secretName: {{ $item.name | quote }}
{{- end -}}
{{- end -}}
{{- end -}}