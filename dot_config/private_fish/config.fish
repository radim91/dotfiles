if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -f ~/.env
    source ~/.env
end

set -gx PATH $PATH ~/go/bin/
