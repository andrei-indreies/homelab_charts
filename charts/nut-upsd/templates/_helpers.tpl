# templates/_helpers.tpl

{{- define "nut-upsd.fullname" -}}
{{- .Release.Name }}-nut-upsd
{{- end -}}

{{- define "nut-upsd.secretName" -}}
{{- .Values.secret.name | default "nut-upsd-secret" -}}
{{- end -}}

{{- define "nut-upsd.apiPasswordKey" -}}
{{- .Values.secret.apiPasswordKey | default "apiPassword" -}}
{{- end -}}

{{- define "nut-upsd.serviceName" -}}
{{- .Values.service.name | default "nut-upsd" -}}
{{- end -}}
