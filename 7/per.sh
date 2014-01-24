datadir=/var/lib/gitlab
homedir=/usr/lib/gitlab

fix_perms() {
        chown -R gitlab:gitlab $datadir $homedir
        chmod -R go-rwx $homedir/.ssh
        chmod g+s $datadir/repositories
}

post_install() {
        groupadd gitlab &>/dev/null
        useradd -g gitlab -d $homedir -s /bin/false gitlab &>/dev/null
        fix_perms
}

post_upgrade() {
        getent group gitlab >/dev/null 2>&1 || groupadd gitlab &>/dev/null
        getent passwd gitlab >/dev/null 2>&1 || useradd -g gitlab -d $homedir -s 
/bin/false gitlab &>/dev/null
        fix_perms
}

post_remove() {
        if getent passwd gitlab >/dev/null 2>&1; then
                userdel gitlab
        fi
        if getent group gitlab >/dev/null 2>&1; then
                groupdel gitlab
        fi
}