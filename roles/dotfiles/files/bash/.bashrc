PATH="$HOME"/.local/bin:"$PATH"

# Append Homebrew tools at the end of PATH to prevent conflicts with system
# tools. See https://github.com/ublue-os/bluefin/issues/687 for details.
if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
    PATH="$PATH":/home/linuxbrew/.linuxbrew/bin
fi

export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"

# HACK: Homebrew version of dvisvgm does not work without these variables set.
export TEXMFCNF="$(dirname "$(kpsewhich texmf.cnf)")"
export TEXMFROOT="$(kpsewhich --var-value=TEXMFROOT)"

# Defensive export for child processes (should be unnecessary).
export PATH
