# GitHub Read Access Checker (Shell Scripting Project)

## About
This project is a **real-time shell scripting example** that uses the **GitHub REST API**
to list users who have **READ (pull) access** to a GitHub repository.

This project is designed so that **even beginners can understand it just by reading this README**.

---

## Technologies Used
- Bash (Shell Scripting)
- GitHub REST API
- curl
- jq (JSON parser)

---

## Prerequisites

### 1. Install Required Tools
```bash
sudo apt update
sudo apt install -y curl jq
```

### 2. Create GitHub Personal Access Token
1. Go to GitHub → Settings → Developer Settings
2. Personal Access Tokens → Tokens (classic)
3. Generate new token
4. Select scope:
   - repo
5. Copy and save the token

---

## Project Files

```
.
├── list_read_access.sh
└── README.md
```

---

## Script Explanation (Line by Line)

### Shebang
```bash
#!/bin/bash
```
Tells the system to execute the script using Bash shell.

---

### Helper Function
```bash
helper() {
  expected_cmd_args=2
  if [ $# -ne $expected_cmd_args ]; then
    echo "Usage: ./list_read_access.sh <repo_owner> <repo_name>"
    exit 1
  fi
}
```
- Ensures exactly **2 arguments** are passed
- Prevents runtime errors
- Makes the script production-ready

---

### Environment Variables
```bash
export GITHUB_USERNAME="your_username"
export GITHUB_TOKEN="your_token"
```
- Keeps credentials secure
- Avoids hardcoding secrets

---

### GitHub API Call
```bash
curl -s -u "${USERNAME}:${TOKEN}" "$url"
```
- `-s` → silent mode
- `-u` → basic authentication
- Calls GitHub REST API

---

### jq Filter
```bash
select(.permissions.pull == true)
```
Filters users who have **READ access**.

---

## Execution Steps

### Step 1: Clone or Download Repo
```bash
git clone <your-repo-url>
cd github-read-access-shell-project
```

### Step 2: Give Execute Permission
```bash
chmod +x list_read_access.sh
```

### Step 3: Export Credentials
```bash
export GITHUB_USERNAME="your_github_username"
export GITHUB_TOKEN="your_personal_access_token"
```

### Step 4: Run Script
```bash
./list_read_access.sh repo_owner repo_name
```

---

## Sample Output
```
Listing users with READ access to user/repo...
Users with READ access:
user1
user2
```

---

## Learning Outcomes
- Real-world GitHub API usage
- Secure credential handling
- Bash functions & arguments
- JSON parsing using jq

---

## Owner
**Mouli S**  
Cloud & DevOps Engineer

---

## License
Free to use for learning and portfolio projects.
