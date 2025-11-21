{{- define \"aetherkube-web.name\" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix \"-\" -}}
{{- end -}}

{{- define \"aetherkube-web.fullname\" -}}
{{- printf \"%s-%s\" .Release.Name (include \"aetherkube-web.name\" .) | trunc 63 | trimSuffix \"-\" -}}
{{- end -}}
