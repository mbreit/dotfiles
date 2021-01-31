if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'matchai/spacefish'
fundle plugin 'evanlucas/fish-kubectl-completions'
fundle plugin 'brgmnn/fish-docker-compose'

fundle init
