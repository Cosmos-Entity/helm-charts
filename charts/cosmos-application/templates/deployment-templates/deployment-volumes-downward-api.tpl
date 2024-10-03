{{- define "deployment.spec.template.spec.volumes.downward-api" -}}
- name: podinfo
  downwardAPI:
    items:
    - path: "labels"
      fieldRef:
        fieldPath: metadata.labels
    - path: "annotations"
      fieldRef:
        fieldPath: metadata.annotations
{{- end -}}