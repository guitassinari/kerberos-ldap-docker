# kerberos-ldap-docker

This is a small docker-compose application for setting up a learning and testing Kerberos authentication environment.

## How to run

1. clone this repository in your local machine

```
$ git clone git@github.com:guitassinari/kerberos-ldap-docker.git
```

2. Step into the project folder and build it's docker images (this might take some minutes)

```
hostmachine $ cd kerberos-ldap-docker
hostmachine $ docker-compose build
```

3. Run all docker compose containers in detacched mode

```
hostmachine $ docker-compose up -d
```

![docker compose up](https://github.com/guitassinari/kerberos-ldap-docker/blob/main/screenshots/docker-compose-up.png?raw=true)

This should start both containers (client and KDC). You can verify they're running by executing:

```
hostmachine $ docker-compose ps
```

Something like this should appear in your command line:

![docker compose ps](https://github.com/guitassinari/kerberos-ldap-docker/blob/main/screenshots/docker-compose-ps.png?raw=true)

> You can see the client container is not running (state = exit). This is expected! The client service is for interactive exection in the next step

4. Testing the KDC server usind client

Let's try to get a ticket with KDC using our client service.
First, run the client service with interactive bash:
```
hostmachine $ docker-compose run client
```

This should connect you to a bash inside the client container. Now, using this bash, execute the `/docker-entrypoint.sh` file. This is important to import the KDC server settings.

```
clientbash $ ./docker-entrypoin.sh
```

Now everything should be setup. Just try fetching a ticket with the following command:

```
clientbash $ kinit admin/admin@EXAMPLE.COM
```

This should ask you for a password. The default password is `password`. Type it and hit enter.
You can verify a ticket has been acquired by running the following command:

```
clientbash $ klist
```

Here's an image of this whole step:

![client](https://github.com/guitassinari/kerberos-ldap-docker/blob/main/screenshots/running-client.png?raw=true)



This should show the ticket you acquired.
That's it!
