{{/*
Expand the name of the chart.
*/}}
{{- define "headscale.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name for Headscale.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "headscale.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Headplane component name.
*/}}
{{- define "headplane.name" -}}
{{- printf "%s-headplane" (include "headscale.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Headplane fully qualified name.
*/}}
{{- define "headplane.fullname" -}}
{{- printf "%s-headplane" (include "headscale.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "headscale.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels for Headscale component.
*/}}
{{- define "headscale.labels" -}}
helm.sh/chart: {{ include "headscale.chart" . }}
{{ include "headscale.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for Headscale component.
*/}}
{{- define "headscale.selectorLabels" -}}
app.kubernetes.io/name: {{ include "headscale.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: headscale
{{- end }}

{{/*
Common labels for Headplane component.
*/}}
{{- define "headplane.labels" -}}
helm.sh/chart: {{ include "headscale.chart" . }}
{{ include "headplane.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for Headplane component.
*/}}
{{- define "headplane.selectorLabels" -}}
app.kubernetes.io/name: {{ include "headplane.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: headplane
{{- end }}

{{/*
Create the name of the service account to use.
*/}}
{{- define "headscale.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "headscale.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Resolve the StorageClass for the PVC.
Resolution order: headscale.persistence.storageClass → global.storageClass → cluster default ("")
*/}}
{{- define "headscale.storageClass" -}}
{{- if .Values.headscale.persistence.storageClass }}
{{- .Values.headscale.persistence.storageClass }}
{{- else if .Values.global.storageClass }}
{{- .Values.global.storageClass }}
{{- else }}
{{- "" }}
{{- end }}
{{- end }}

{{/*
imagePullSecrets conditional helper.
Merges global and component-level imagePullSecrets.
*/}}
{{- define "headscale.imagePullSecrets" -}}
{{- $secrets := list }}
{{- if .Values.global.imagePullSecrets }}
{{- $secrets = concat $secrets .Values.global.imagePullSecrets }}
{{- end }}
{{- if .component }}
{{- if (index .Values .component).imagePullSecrets }}
{{- $secrets = concat $secrets (index .Values .component).imagePullSecrets }}
{{- end }}
{{- end }}
{{- if $secrets }}
imagePullSecrets:
  {{- toYaml $secrets | nindent 2 }}
{{- end }}
{{- end }}
