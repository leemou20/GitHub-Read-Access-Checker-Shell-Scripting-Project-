#!/bin/bash

##########
# About  : Shell script to list GitHub repository users with READ access using GitHub REST API
# Input  : <repo_owner> <repo_name>
# Owner  : Mouli S
# Usage  : ./list_read_access.sh <repo_owner> <repo_name>
##########

# ---------------- Helper Function ----------------
helper() {
  expected_cmd_args=2

  if [ $# -ne $expected_cmd_args ]; then
    echo "ERROR: Invalid number of arguments"
    echo "Usage: ./list_read_access.sh <repo_owner> <repo_name>"
    exit 1
  fi
}

# Call helper to validate arguments
helper "$@"

# ---------------- Configuration ----------------

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
# Export these before running the script
USERNAME="$GITHUB_USERNAME"
TOKEN="$GITHUB_TOKEN"

# Repository information from command-line arguments
REPO_OWNER="$1"
REPO_NAME="$2"

# ---------------- Functions ----------------

# Function to make a GET request to the GitHub API
github_api_get() {
  local endpoint="$1"
  local url="${API_URL}/${endpoint}"

  curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with READ access
list_users_with_read_access() {
  local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

  collaborators=$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')

  if [[ -z "$collaborators" ]]; then
    echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
  else
    echo "Users with READ access to ${REPO_OWNER}/${REPO_NAME}:"
    echo "$collaborators"
  fi
}

# ---------------- Main ----------------

echo "Listing users with READ access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
