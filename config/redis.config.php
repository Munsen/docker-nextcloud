<?php
$CONFIG = array(
    'filelocking.enabled' => true,
    'memcache.locking' => '\OC\Memcache\Redis',
    'redis' => array(
        'host' => '172.17.0.1',
        'port' => 6379,
        'timeout' => 3,
    ),
);
