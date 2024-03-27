# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

function retcode() {}

python_info() {
    if [ -v CONDA_DEFAULT_ENV ]; then
        echo "%{$fg[magenta]%}(${CONDA_DEFAULT_ENV})%{$reset_color%}"
    elif [ -v VIRTUAL_ENV ]; then
        local parent=$(dirname ${VIRTUAL_ENV})
        if [[ "${PWD/#$parent/}" != "$PWD" ]]; then
            # PWD is under the parent
            echo "%{$fg[magenta]%}($(basename ${VIRTUAL_ENV}))%{$reset_color%}"
        else
            # PWD is not under the parent
            echo "%{$fg[magenta]%}(${VIRTUAL_ENV/#$HOME/~})%{$reset_color%}"
        fi
    fi
}

# Modified from https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/rkj.zsh-theme

PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;30m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%{\e[1;35m%}$(python_info)%{\e[0;34m%}%B]%{\e[0m%}%b - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[0;33m%}'%D{"%Y-%m-%d %I:%M:%S"}%b$'%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}%?$(retcode)%{\e[0;34m%}%B]%{\e[0m%}%b '
