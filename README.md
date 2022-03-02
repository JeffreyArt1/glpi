# Docker GLPI

![GLPI Logo](https://raw.githubusercontent.com/glpi-project/glpi/master/pics/logos/logo-GLPI-250-black.png)

## About GLPI

GLPI stands for **Gestionnaire Libre de Parc Informatique** is a Free Asset and IT Management Software package, that provides ITIL Service Desk features, licenses tracking and software auditing.

## How to use it

```BASH
# install from the command line
docker pull ghcr.io/jeffreyart1/glpi:<tag>

# run the image
docker run -p 80:80 ghcr.io/jeffreyart1/glpi:<tag> --name glpi
```

<!--
```PHP
## config_db.php
<?php
class DB extends DBmysql {
   public $dbhost     = 'db host';
   public $dbuser     = 'user';
   public $dbpassword = 'pass';
   public $dbdefault  = 'default db name';
}
```

local_php:/var/www/html/config/config_db.php

 -->
 
