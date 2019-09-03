#!/bin/bash
#
# This script sets the variables in Composer. The variables are needed for the
# data processing DAGs to properly execute, such as project-id, GCP region and
#zone. It also sets Cloud Storage buckets where test files are stored.
#
# Copyright 2019 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This stages the Variables file in GCS in the data directory which
# gets synced to /home/airflow/gcs/data/ so that an airflow command
# can reference the file locally to the worker it is running on.
source ./set_env.sh
source ./get_composer_properties.sh

cat ../config/Variables.json | envsubst > ../config/Variables.json.processed
mv ../config/Variables.json.processed ../config/Variables.json