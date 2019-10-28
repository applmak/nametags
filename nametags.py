# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import sys

tplfile = sys.argv[1]
datafile = sys.argv[2]

with open(tplfile, "r") as file:
  tpl = file.read()

with open(datafile, "r") as file:
  data = file.readlines()

FIELDS = ['firstname', 'lastname', 'username', 'office', 'pronoun']

for d in data:
  data = dict(zip(FIELDS, d.split('\t')))
  with open(data['username'] + '.html', 'w+') as f:
    f.write(tpl % data)
