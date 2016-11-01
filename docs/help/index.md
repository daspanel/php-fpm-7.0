
# Usage


### Get
```shell
$ docker pull daspanel/php-fpm-7.0:latest
```

### Run
```shell
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-php-fpm-7.0 daspanel/php-fpm-7.0:latest
```

### Stop
```shell
$ docker stop my-php-fpm-7.0
```

### Update image
```shell
$ docker stop my-php-fpm-7.0
$ docker pull daspanel/php-fpm-7.0:latest
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-php-fpm-7.0 daspanel/php-fpm-7.0:latest
```

# Tips
