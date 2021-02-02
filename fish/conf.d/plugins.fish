if status --is-interactive
    if not functions -q fundle
        eval (curl -sfL https://git.io/fundle-install)
    end

    fundle plugin 'mbreit/spacefish' --url 'git@github.com:mbreit/spacefish.git#patch-1'
    fundle plugin 'evanlucas/fish-kubectl-completions'
    fundle plugin 'brgmnn/fish-docker-compose'
    fundle plugin 'jethrokuan/z'
    fundle plugin 'franciscolourenco/done'
    fundle plugin 'laughedelic/pisces'
    fundle plugin 'oh-my-fish/plugin-bang-bang'

    fundle init
end
