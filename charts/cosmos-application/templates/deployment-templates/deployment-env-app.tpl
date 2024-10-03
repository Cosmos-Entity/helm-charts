{{- define "deployment.spec.template.spec.containers.env.app" -}}
{{- if .Values.application.env -}}
#
# app env vars
#
{{ toYaml .Values.application.env }}
{{- end }}
{{- end -}}