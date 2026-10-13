if type -q mise
    if status is-interactive
        mise activate fish | source
    else
        # Non-interactive shells (IDEs, agents) use shims instead of prompt hooks
        mise activate fish --shims | source
    end
end
