#!/usr/bin/env bash
set -euo pipefail

# =========================
# Config (edit if desired)
# =========================
EMAIL="${1:-reibell.theo@gmail.com}"
KEY_PATH="${HOME}/.ssh/id_ed25519_github"
SSH_CONFIG="${HOME}/.ssh/config"

echo "[INFO] Using email comment: ${EMAIL}"
echo "[INFO] SSH key path: ${KEY_PATH}"

# Ensure ~/.ssh exists with correct permissions
mkdir -p "${HOME}/.ssh"
chmod 700 "${HOME}/.ssh"

# 1) Generate key if missing
if [[ -f "${KEY_PATH}" ]]; then
  echo "[INFO] SSH private key already exists at ${KEY_PATH} (skipping generation)"
else
  echo "[INFO] Generating new ed25519 key..."
  ssh-keygen -t ed25519 -C "${EMAIL}" -f "${KEY_PATH}" -N ""
fi

# 2) Ensure ssh-agent is running
if [[ -z "${SSH_AUTH_SOCK:-}" ]]; then
  echo "[INFO] Starting ssh-agent..."
  eval "$(ssh-agent -s)"
else
  echo "[INFO] ssh-agent already available."
fi

# 3) Add key to agent
echo "[INFO] Adding key to ssh-agent..."
ssh-add "${KEY_PATH}"

# 4) Ensure SSH config has a github.com host entry that uses this key
touch "${SSH_CONFIG}"
chmod 600 "${SSH_CONFIG}"

if grep -qE '^[[:space:]]*Host[[:space:]]+github\.com([[:space:]]|$)' "${SSH_CONFIG}"; then
  echo "[INFO] Existing github.com entry found in ${SSH_CONFIG}."
  echo "[INFO] Please ensure it contains IdentityFile ${KEY_PATH} and IdentitiesOnly yes."
else
  cat >> "${SSH_CONFIG}" <<EOF

Host github.com
  HostName github.com
  User git
  IdentityFile ${KEY_PATH}
  IdentitiesOnly yes
  AddKeysToAgent yes
EOF
  echo "[INFO] Added github.com SSH config entry."
fi

# 5) Display public key for GitHub UI
echo
echo "========== PUBLIC KEY (add this to GitHub) =========="
cat "${KEY_PATH}.pub"
echo "====================================================="
echo

echo "[NEXT STEP] Add the above key to: GitHub > Settings > SSH and GPG keys > New SSH key"
echo

# 6) Test raw SSH auth to GitHub (will succeed only after key is added on GitHub)
echo "[INFO] Testing SSH authentication to github.com..."
set +e
ssh -T git@github.com
SSH_TEST_RC=$?
set -e

# GitHub commonly returns 1 for "successfully authenticated, but no shell access"
if [[ ${SSH_TEST_RC} -eq 1 || ${SSH_TEST_RC} -eq 0 ]]; then
  echo "[INFO] SSH test command executed. Check message above:"
  echo "       Expected success message contains: 'successfully authenticated'"
else
  echo "[WARN] SSH test failed (exit ${SSH_TEST_RC})."
  echo "       If key not yet added to GitHub, add it first and re-run:"
  echo "       ssh -T git@github.com"
fi
