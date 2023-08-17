################################################################################
#   Copyright (c) 2019 AT&T Intellectual Property.                             #
#                                                                              #
#   Licensed under the Apache License, Version 2.0 (the "License");            #
#   you may not use this file except in compliance with the License.           #
#   You may obtain a copy of the License at                                    #
#                                                                              #
#       http://www.apache.org/licenses/LICENSE-2.0                             #
#                                                                              #
#   Unless required by applicable law or agreed to in writing, software        #
#   distributed under the License is distributed on an "AS IS" BASIS,          #
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   #
#   See the License for the specific language governing permissions and        #
#   limitations under the License.                                             #
################################################################################

# Either value from common.namespace.platform or default 'nonrtric-platform'
{{- define "common.namespace.platform" -}}
  {{- $keylist := list "common" "namespace" "platform" -}}
  {{- $ctx := dict "ctx" $.Values "keylist" $keylist -}}
  {{- $namespace := include "locate" $ctx -}}
  {{- if not (empty $namespace) -}}
    {{- $namespace -}}
  {{- else -}}
    {{- .Release.Namespace }}
  {{- end -}}
{{- end -}}

# WARNING: This is deprecated do not use it. We are deploying everything in the
# same namespace. This is kept right now for the cases where it's just too much
# of an effort right now to actually not use it from any of the charts from
# ORAN-SC or ONAP
{{- define "common.namespace.infra" -}}
  {{- $keylist := list "common" "namespace" "infra" -}}
  {{- $ctx := dict "ctx" $.Values "keylist" $keylist -}}
  {{- $namespace := include "locate" $ctx -}}
  {{- if not (empty $namespace) -}}
    {{- $namespace -}}
  {{- else -}}
    {{- printf "ricinfra" -}}
  {{- end -}}
{{- end -}}

# WARNING: # This may be deprecated do not use it. Either the 'Apps' can come
# from the same namespace as that of the platform. (For example Apps that are
# built-in with platform) or The Apps may be running completely externally
# (anywhere on the Internet and will avail platform services through well
# defined API end points).
{{- define "common.namespace.xapp" -}}
  {{- $keylist := list "common" "namespace" "xapp" -}}
  {{- $ctx := dict "ctx" $.Values "keylist" $keylist -}}
  {{- $namespace := include "locate" $ctx -}}
  {{- if not (empty $namespace) -}}
    {{- $namespace -}}
  {{- else -}}
    {{- printf "ricxapp" -}}
  {{- end -}}
{{- end -}}


# WARNING: This is deprecated do not use it. We are deploying everything in the
# same namespace. This is kept right now for the cases where it's just too much
# of an effort right now to actually not use it from any of the charts from
# ORAN-SC or ONAP
{{- define "common.namespace.aux" -}}
  {{- $keylist := list "common" "namespace" "aux" -}}
  {{- $ctx := dict "ctx" $.Values "keylist" $keylist -}}
  {{- $namespace := include "locate" $ctx -}}
  {{- if not (empty $namespace) -}}
    {{- $namespace -}}
  {{- else -}}
    {{- printf "ricaux" -}}
  {{- end -}}
{{- end -}}
