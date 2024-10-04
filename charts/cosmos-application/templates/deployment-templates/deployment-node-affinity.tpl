{{- define "deployment.spec.template.spec.node-affinity" -}}
#
# node affinity
#
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: "group"
          operator: "In"
          values: [{{ coalesce .Values.application.appNodeGroupNameOverride "app" | quote }}]
        {{- if .Values.application.requiredNodeClass }}
        - key: "class"
          operator: "In"
          values: [{{ .Values.application.requiredNodeClass | quote }}]
        {{- end }}
    {{- if .Values.application.preferredNodeClass }}
    preferredDuringSchedulingIgnoredDuringExecution:
    - weight: 1
      preference:
        matchExpressions:
        - key: "class"
          operator: "In"
          values: [{{ .Values.application.preferredNodeClass | quote }}]
    {{- end }}
{{- end }}
