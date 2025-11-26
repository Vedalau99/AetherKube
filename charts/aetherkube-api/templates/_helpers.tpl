{{- define "aetherkube-api.fullname" -}}
{{ include "aetherkube-api.name" . }}-{{ .Release.Name }}
{{- end }}

{{- define "aetherkube-api.name" -}}
{{ .Chart.Name }}
{{- end }}
