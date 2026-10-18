# AGENTS.md

Personal dotfiles for Linux, packaged as Ansible roles, plus a `deploy` script
that applies one role to one host (`./deploy HOST ROLE`, run from the repo
root). On a fresh workstation, `./bootstrap.sh` first installs Homebrew and
Ansible from it; it duplicates `roles/homebrew`, so keep the two in sync.

## Layout

- `private/` — a separate private git repo checked out here and gitignored. It
  holds the real inventory (`private/inventory/hosts.ini` and private
  `host_vars`), private playbooks and private roles. `ansible.cfg` reads it
  alongside the public `inventory/` and `roles/`; private `host_vars` override
  public ones for the same variable. `private.example/` shows its layout. Never
  copy anything from `private/` into the public repo.
- `inventory/` — public inventory: `hosts.ini` (the workstation, `localhost`)
  and public `host_vars`.
- `playbooks/` — `deploy.yml`, used by `deploy`, and `pass.sh`, the sudo
  askpass helper.
- `roles/common/` — dotfiles for every host (bash, fish, git, ssh, tmux,
  readline, environment, go, julia, tex).
- `roles/desktop/` — additions for graphical workstations (xkb layouts, recoll,
  gopass, rclone, ptyxis, emacs, desktop-only git/fish bits) plus Homebrew
  fonts.
- `roles/server/` — additions for remote hosts (SSH agent forwarding fix for
  tmux/screen).
- `roles/homebrew/` — installs Homebrew at `homebrew_prefix` (privileged default
  prefix, or a user-writable one under `$HOME`), writes its environment, and
  adds a personal tap.

## Deployment

- Deployments only ever run from the main workstation, so `localhost` is always
  the workstation. Local-only mechanisms (e.g. `SUDO_ASKPASS`) are fine.
- sudo on the workstation uses a YubiKey, so Ansible's become password handling
  (`--become-password-file`, `become_password_file`) does not work; see
  <https://github.com/sudo-project/sudo/issues/112>. Do not suggest it.

## Conventions

- `roles/<role>/files/<package>/` mirrors `$HOME`. Each package directory is
  copied verbatim into the home directory, so paths inside it are real paths
  relative to `~`. Adding a package means creating the directory *and* adding
  its name to the role's task loop.
- Keep configs split by drop-in fragments rather than duplicating files across
  roles: environment variables go in `~/.config/environment.d/*.conf`, bash
  snippets in `~/.bashrc.d/*.sh`, fish snippets in `~/.config/fish/conf.d/`,
  desktop-only git settings in `~/.config/git/local` (included by the common
  git config). Two roles must never ship the same file path.
- `.bashrc` sources `environment.d` itself when `ENVIRONMENT_D_LOADED` is unset
  (e.g. SSH logins), so environment files must be valid POSIX shell assignments.
- Tasks use fully qualified module names (`ansible.builtin.*`,
  `community.general.*`) and short lowercase quoted task names.
- Commits follow Conventional Commits (`feat:`, `fix:`, `refactor:`, `style:`).
