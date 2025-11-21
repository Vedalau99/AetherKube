{{- define \"aetherkube-api.name\" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix \"-\" -}}
{{- end -}}

{{- define \"aetherkube-api.fullname\" -}}
{{- printf \"%s-%s\" .Release.Name (include \"aetherkube-api.name\" .) | trunc 63 | trimSuffix \"-\" -}}
{{- end -}}
