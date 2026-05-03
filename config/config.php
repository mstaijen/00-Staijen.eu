<?php
define('APP_NAME', 'FamiliePortaal');
return [
    'app_name' => 'FamiliePortaal',

    // automatische detectie
    'env' => (strpos($_SERVER['HTTP_HOST'], 'localhost') !== false 
           || strpos($_SERVER['HTTP_HOST'], '127.0.0.1') !== false)
           ? 'local'
           : 'live',

    'db' => [
        'local' => [
            'host' => 'localhost',
            'name' => 'dbs15627653',   // of jouw lokale db (bijv. gezinsdb)
            'user' => 'root',
            'pass' => ''
        ],

        'live' => [
            'host' => 'database-5020358906.webspace-host.com',
            'name' => 'dbs15627653',
            'user' => 'dbu4681924',
            'pass' => 'CCG6a4o201905!'
        ]
    ]
];