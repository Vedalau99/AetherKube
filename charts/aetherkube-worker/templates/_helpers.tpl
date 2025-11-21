{{- define \"aetherkube-worker.name\" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix \"-\" -}}
{{- end -}}

{{- define \"aetherkube-worker.fullname\" -}}
{{- printf \"%s-%s\" .Release.Name (include \"aetherkube-worker.name\" .) | trunc 63 | trimSuffix \"-\" -}}
{{- end -}}
