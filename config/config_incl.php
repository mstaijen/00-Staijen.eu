<?php

return [
    'app_name' => 'FamiliePortaal',

    'env' => (isset($_SERVER['HTTP_HOST']) && $_SERVER['HTTP_HOST'] !== 'localhost') ? 'live' : 'local',

    'db' => [
        'host_local' => 'localhost',
        'host_live'  => 'database-5020358906.webspace-host.com',
        'name'       => 'dbs15627653',
        'user_local' => 'root',
        'pass_local' => '',
        'user_live'  => 'dbu4681924',
        'pass_live'  => 'CCG6a4o201905!'
    ]
];