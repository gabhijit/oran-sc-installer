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

################################################################################
# 'locate': This function is used to locate 'keys' from a json or a yaml file
# For Example consider the following `test.yaml` file
# Used for testing
# ```yaml
# common:
#   namespace:
#    aux: "nonrtric-aux"
#    platform: "nonrtric-platform"
# ```
# locate "common.namespace.aux" would yield - "nonrtric-aux"
# This can come from the override file specified during building templates or
# It can be a `section` in `values.yaml` for a Chart.
###############################################################################

{{- define "locate" -}}
  {{- $ctx := .ctx }}
  {{- $keylist := .keylist }}
  {{- $currentkey := first $keylist -}}
  {{- $restkeys := rest $keylist -}}
  {{- if empty $restkeys -}}
    {{- $result := index $ctx $currentkey -}}
    {{- if not (empty $result) -}}
      {{- $result -}}
    {{- end -}}
  {{- else -}}
    {{- with index $ctx $currentkey }}
      {{- $newctx := dict "ctx" . "keylist" $restkeys -}}
      {{- include "locate" $newctx -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
