# What's diffrence

The original image is placed [here](https://github.com/nextcloud/docker/blob/master/.examples/dockerfiles/cron/apache/Dockerfile)

## Transmission Directory

create directory /mnt/transmission that's to mount `<download-dir>` of transmission which is outside of container. it can be used with External Storage Support on nextcloud.

Nextcloud runs with user(33)/group(33) `www-data`. transmission daemon is running with other user/group.
setup acl to download-dir of transmission to give RW permission nextcloud.

    setfacl -m g:33:rwx <download-dir>
    setfacl -d -m g:33:rwx <download-dir>

Now newly created sub-directories and files can be accssed by nextcloud.
if files, directories already exists in `<download-dir>`. run below to setup acl

    cd <download-dir>
    find -type f -exec setfacl -m g:33:rw {} \;
    find -type d -exec setfacl -m g:33:rwx {} \;

# Run

create volume nextcloud if first run

    docker volume create nextcloud

start container

    docker run --name <container-name> -d -v nextcloud:/var/www/html -v <download-dir>:/var/transmission munsen/nextcloud
