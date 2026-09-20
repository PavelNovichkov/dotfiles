# HACK: Homebrew version of dvisvgm does not work without these variables set.
export TEXMFCNF="$(dirname "$(kpsewhich texmf.cnf)")"
export TEXMFROOT="$(kpsewhich --var-value=TEXMFROOT)"
