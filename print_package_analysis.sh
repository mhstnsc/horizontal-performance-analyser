#!/bin/bash
# Copyright 2016 M. Isuru Tharanga Chrishantha Perera
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ----------------------------------------------------------------------------
# Create a Flame Graph
# ----------------------------------------------------------------------------
set -e

JFG_DIR=$(dirname "$0")

function help {
    echo ""
    echo "Usage: "
    echo "print_package_analysis.sh [some options supported by run_jar.sh]"
    echo ""
    echo "See: print_package_analysis.sh -h"
    echo ""
}

jfr_file=""

while getopts "df:airsx:y:e:" opts
do
  case $opts in
    f)
        jfr_file=${OPTARG}
        ;;
    \?)
        help
        exit 1
        ;;
  esac
done

if [[ ! -f $jfr_file ]]; then
    echo "Please specify the JFR file"
    help
    exit 1
fi

jfr_filename=$(basename $jfr_file)

# Use folded output type
${JFG_DIR}/run_jar.sh --type PACKAGE_ANALYSIS $*