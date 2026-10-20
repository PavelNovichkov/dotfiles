set shell := ["bash", "-euo", "pipefail", "-c"]
set positional-arguments

# Read the sudo password with bin/askpass, which needs gopass and the YubiKey;
# run `just yubikey=false ...` to be prompted for it instead (e.g. right after
# bootstrap).
yubikey := "true"
ansible_playbook := if yubikey == "true" {
    'SUDO_ASKPASS="$PWD/bin/askpass" ansible-playbook'
} else {
    "ansible-playbook --ask-become-pass"
}

# List recipes
default:
    @just --list

# Apply one role to one host
deploy host role *args:
    {{ ansible_playbook }} playbooks/deploy.yml -e target_host="$1" -e target_role="$2" "${@:3}"
