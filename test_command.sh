#
#  Copyright (C) 2018 Joumen Harzli
#
#  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
#  in compliance with the License. You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software distributed under the License
#  is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
#  or implied. See the License for the specific language governing permissions and limitations under
#  the License.
#

#!/usr/bin/env bash
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8081/actuator/health)" != "200" ]]; do sleep 5; done

curl -X POST -H "Content-Type: application/json" localhost:8081/api/v1/users -d @- << EOF 

{
  "name": "Joumen",
  "jobs":[{"name":"Software Architect","startDate":"2010-06-03T09:14:56.284Z","endDate":"2018-06-03T09:14:56.284Z","description":"just a test"}],
  "addresses":[{"name":"tunisia"}]
}

EOF
