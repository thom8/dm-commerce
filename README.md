# Drupal Melbourne Commerce/Varnish Demo

  1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) & [Vagrant](https://www.vagrantup.com/downloads.html)

  2. Open terminal (or [git bash](https://msysgit.github.io/) for windows users) and run the following commands --

  ```
  git clone https://github.com/thom8/dm-commerce.git
  cd dm-commerce
  vagrant up
  ```

  3. Go to http://dm-commerce.ddns.net/

  ```
  username: drupal
  password: drupal
  ```
  
## Master branch

Varnish is running however it is effectively disabled as all requests are passed through to Apcache.

**Apache bench test**
```
ab -n 100 http://dm-commerce.ddns.net/
```

## Varnished branch

```
git checkout varnished
```

enable dm_commerce module which will configure varnish and install dependancies, retry apache bench test ..

```
ab -n 100 http://dm-commerce.ddns.net/
```

## Notes

**Never** add a SQL dump to a code repository -- this was only done for demo purposes.
You can remove the "Import database" block and uncomment the "Drush site install" in [config.yml](https://github.com/thom8/dm-commerce/blob/master/config.yml) to do a fresh install of commerce kickstart however your settings.php will be overridden from the repository.

If you make changes to [default.vcl](https://github.com/thom8/dm-commerce/blob/master/vagrant-includes/default.vcl) you will need to reprovision the box ```vagrant provision``` or rebuild ```vagrant destroy && vagrant up``` for changes to take affect.
