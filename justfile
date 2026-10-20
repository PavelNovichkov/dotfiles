set shell := ["bash", "-euo", "pipefail", "-c"]
set positional-arguments

# List recipes
default:
    @just --list

# Apply one role to one host
deploy host role *args:
    SUDO_ASKPASS="$PWD/bin/askpass" ansible-playbook playbooks/deploy.yml -e target_host="$1" -e target_role="$2" "${@:3}"
