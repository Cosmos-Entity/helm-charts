{{- define "deployment.spec.template.spec.containers.env.default" -}}
#
# common env vars
#
- name: COSMOS_ENVIRONMENT
  value: {{ required "env is required" .Values.env | quote }}
- name: DD_ENV
  value: {{ required "env is required" .Values.env | quote }}
- name: DD_APM_ENABLED
  value: "true"
- name: DD_APM_ENV
  value: {{ required "env is required" .Values.env | quote }}
- name: DD_SERVICE
  value: {{ required "application.serviceId is required" .Values.application.serviceId }}
- name: DD_SERVICE_TYPE
  value: {{ required "application.serviceType is required" .Values.application.serviceType }}
- name: DD_LANGUAGE
  value: {{ required "application.language is required" .Values.application.language }}
- name: DD_CONTAINER_ENV_AS_TAGS
  value: '{"DD_SERVICE_TYPE": "service_type","DD_LANGUAGE": "language"}'
- name: MY_NODE_IP
  valueFrom:
    fieldRef:
      fieldPath: status.hostIP
- name: MY_NODE_NAME
  valueFrom:
    fieldRef:
      fieldPath: spec.nodeName
- name: MY_POD_NAME
  valueFrom:
    fieldRef:
      fieldPath: metadata.name
- name: MY_POD_NAMESPACE
  valueFrom:
    fieldRef:
      fieldPath: metadata.namespace
- name: MY_UID
  valueFrom:
    fieldRef:
      fieldPath: metadata.uid
- name: MY_POD_IP
  valueFrom:
    fieldRef:
      fieldPath: status.podIP
- name: MY_CPU_REQUEST
  valueFrom:
    resourceFieldRef:
      resource: requests.cpu
- name: MY_CPU_LIMIT
  valueFrom:
    resourceFieldRef:
      resource: limits.cpu
- name: MY_MEM_REQUEST
  valueFrom:
    resourceFieldRef:
      resource: requests.memory
- name: MY_MEM_LIMIT
  valueFrom:
    resourceFieldRef:
      resource: limits.memory
- name: MY_EPHEMERAL_STORAGE_REQUEST
  valueFrom:
    resourceFieldRef:
      resource: requests.ephemeral-storage
- name: MY_EPHEMERAL_STORAGE_LIMIT
  valueFrom:
    resourceFieldRef:
      resource: limits.ephemeral-storage
{{- if (not (coalesce .Values.application.suppressServiceAccountName false)) }}
- name: MY_POD_SERVICE_ACCOUNT
  valueFrom:
    fieldRef:
      fieldPath: spec.serviceAccountName
{{- end }}
{{- end -}}