{{- if .Values.application.exposedPort -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ (coalesce .Values.application.appLabelOverride .Values.application.serviceId) | quote }}
  namespace: {{ coalesce .Values.application.namespace .defaults.namespace | quote }}
spec:
  ports:
  - name: {{ required "app.portName is required" .Values.application.portName | quote }}
    port: {{ .Values.application.exposedPort | int }}
    targetPort: {{ required "app.portName is required" .Values.application.portName | quote }}
    protocol: TCP
  type: NodePort
  selector:
    app: {{ (coalesce .Values.application.appLabelOverride .Values.application.serviceId) | quote }}
{{- end }}
