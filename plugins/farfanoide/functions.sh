CRYFS_MOUNTDIR=~/cryfs

mount_private()
{
  [ ! -d $CRYFS_MOUNTDIR ] && mkdir $CRYFS_MOUNTDIR
  cryfs ~/Dropbox/fs $CRYFS_MOUNTDIR
}

unmount_private()
{
  umount $CRYFS_MOUNTDIR && rm -r $CRYFS_MOUNTDIR
}

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

    [ ! -e "${reqs_file}" ] && touch $reqs_file

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
    local dropbox_config=~/Library/LaunchAgents/com.dropbox.DropboxMacUpdate.agent.plist

    launchctl unload $dropbox_config \
        && gsed -i  's/<integer>[[:digit:]][[:digit:]]*<\/integer>/<integer>386666666666484<\/integer>/g' $dropbox_config \
        && launchctl load -w $dropbox_config
}

# Execute `pyton manage.py` from anywhere in the repo tree
pm()
{
    ( cd -q $(repo_root) && python ./manage.py $* )
}

# test this:
# remote_gzip() {
#     parallel -S $1 --cleanup --return {/}.gz "gzip --best {} -c &gt; {/}.gz" ::: $2
# }
