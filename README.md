Basic vagrant and chef configuration for Symfony projects
=========================================================

**Abandoned**. If I really had to use vagrant, I'd rather use Ansible then chef these days. Anyway, I've moved on to docker. 

Quick Start
-----------

1. Intstall vagrant and virutalbox.

2. Install vagrant plugins:

```bash
vagrant plugin install vagrant-librarian-chef
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostsupdater
```

3. Tune the Vagrantfile (optional).

4. Tune the chef configuration (optional).

5. Start vagrant:

```bash
vagrant up
```

