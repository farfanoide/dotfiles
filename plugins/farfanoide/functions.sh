
md()
{
    local dir=$1
    mkdir -p $dir && cd $dir
}
current_shell()
{
    ps | grep $(echo $$) | grep -v grep | awk '{ print $4 }'
}

reloadshell()
{
    exec $SHELL -l
}
alias shellreload=reloadshell

stream()
{
  peerflix $(pbpaste) "$*"
}

piprequire()
{
    local package="$*"
    local reqs_file="$(repo_root)/requirements.txt"

    \pip install -U "${package}"

    if ! grep -q "${package}" "${reqs_file}"; then
        \pip freeze | \grep -i "${package}" >> "${reqs_file}"
    fi
}

fixapp()
{
    xattr -cr $*
}

fixdropbox()
{
    gsed -i 's/3655/3655000/g' ~/Library/LaunchAgents/com.dropbox.DropboxMacUpdate.agent.plist
}

# test this:
# remote_gzip() {
#     parallel -S $1 --cleanup --return {/}.gz "gzip --best {} -c &gt; {/}.gz" ::: $2
# }