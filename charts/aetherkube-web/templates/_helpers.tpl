{{- define "aetherkube-web.fullname" -}}
{{ include "aetherkube-web.name" . }}-{{ .Release.Name }}
{{- end }}

{{- define "aetherkube-web.name" -}}
{{ .Chart.Name }}
{{- end }}
