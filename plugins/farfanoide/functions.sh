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
    local dir="$*"
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

pip()
{
    local cmd="$1"
    if [ $cmd = 'install' ]; then
        ctags_for_pip "$*"
    else
        `rtx which pip` $*
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

# get_branch()
# {
#     [ $# -eq 0 ] && echo Need a branch name && return
#     branch_name="${1}"
#     git branch --list "*${branch_name}*" | tr -d ' \n'
# }
#
# go_branch()
# {
#     [ $# -eq 0 ] && echo Need a branch name && return
#     branch_name="${1}"
#     git checkout "$(git branch --list "*${branch_name}*" | tr -d '\n ')"
# }

# test this:
# remote_gzip() {
#     parallel -S $1 --cleanup --return {/}.gz "gzip --best {} -c &gt; {/}.gz" ::: $2
# }

track_pdf ()
{
    local project="$1"
    # local date="$2"
    #
    # if [[ -z $date ]]; then
        tracklr pdf -d $(date "+%Y-%m") -k "${project}" -s "$(date '+%B %Y')" -f ivank_"${project}"-$(date "+%Y-%m").pdf
    # fi
    #
    #
    # tracklr pdf -d $date -k "${project}" -s "${date}" -f ivank_"${project}-${date}".pdf

}

digitalocean_speedtest ()
{
    {
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-nyc1.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-nyc2.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-nyc3.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-ams2.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-ams3.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-sfo1.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-sfo2.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-sgp1.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-lon1.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-fra1.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-tor1.digitalocean.com/
        curl -w "%{url_effective};%{time_connect}\n" -o /dev/null -s http://speedtest-blr1.digitalocean.com/
    } | sort -t';' -k2
}

fix_postgresql_pid ()
{
    brew services stop postgresql &&
        rm /usr/local/var/postgres/postmaster.pid &&
        brew services start postgresql
}

import_function ()
{
    local funcname="$1"
    pg_restore -l extras/vedas_prod_bkp | grep -i "${funcname}" > extras/function_list && pg_restore -d vedas -L extras/function_list extras/vedas_prod_bkp

}
