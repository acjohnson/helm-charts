{{/* vim: set filetype=mustache: */}}

{{/*
osp home
*/}}
{{- define "osp.home" -}}
{{- print "/osp" -}}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "osp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the namespace of the chart.
*/}}
{{- define "osp.namespace" -}}
{{- default .Release.Namespace .Values.namespace  -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "osp.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Define cluster's name
*/}}
{{- define "osp.cluster.name" -}}
{{- if .Values.clusterName }}
{{- .Values.clusterName }}
{{- else -}}
{{- template "osp.fullname" .}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "osp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the common labels.
*/}}
{{- define "osp.standardLabels" -}}
app: {{ template "osp.name" . }}
chart: {{ template "osp.chart" . }}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
cluster: {{ template "osp.cluster.name" . }}
{{- end }}

{{/*
Create the template labels.
*/}}
{{- define "osp.template.labels" -}}
app: {{ template "osp.name" . }}
release: {{ .Release.Name }}
cluster: {{ template "osp.cluster.name" . }}
{{- end }}

{{/*
Create the match labels.
*/}}
{{- define "osp.matchLabels" -}}
app: {{ template "osp.name" . }}
release: {{ .Release.Name }}
{{- end }}
