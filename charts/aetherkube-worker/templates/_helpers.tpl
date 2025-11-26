{{- define "aetherkube-worker.fullname" -}}
{{ include "aetherkube-worker.name" . }}-{{ .Release.Name }}
{{- end }}

{{- define "aetherkube-worker.name" -}}
{{ .Chart.Name }}
{{- end }}
