# Sonatype Nexus3 Docker: colorcoding/nexus

A Dockerfile for Sonatype Nexus Repository Manager 3, based on Debain.

* [Notes](#notes)
  * [Persistent Data](#persistent-data)
  * [Build Args](#build-args)
* [Getting Help](#getting-help)

To run, binding the exposed port 8877 to the host.

```
$ docker run -d -p 8877:8877 --name nexus colorcoding/nexus
```

To test:

```
$ curl -u admin:admin123 http://localhost:8877/service/metrics/ping
```

To (re)build the image:

Copy the Dockerfile and do the build-

```
$ docker build --rm=true --tag=colorcoding/nexus .
```

## Notes

* Default credentials are: `admin` / `admin123`

* It can take some time (2-3 minutes) for the service to launch in a
new container.  You can tail the log to determine once Nexus is ready:

```
$ docker logs -f nexus
```

* Installation of Nexus is to `/opt/sonatype/nexus`.  

* A persistent directory, `/nexus-data`, is used for configuration,
logs, and storage. This directory needs to be writable by the Nexus
process, which runs as UID 200.

### Persistent Data

There are two general approaches to handling persistent storage requirements
with Docker. See [Managing Data in Containers](https://docs.docker.com/engine/tutorials/dockervolumes/)
for additional information.

  1. *Use a data volume*.  Since data volumes are persistent
  until no containers use them, a volume can be created specifically for
  this purpose.  This is the recommended approach.  

  ```
  $ docker volume create --name nexus-data
  $ docker run -d -p 8877:8877 --name nexus -v nexus-data:/nexus-data colorcoding/nexus
  ```

  2. *Mount a host directory as the volume*.  This is not portable, as it
  relies on the directory existing with correct permissions on the host.
  However it can be useful in certain situations where this volume needs
  to be assigned to certain specific underlying storage.  

  ```
  $ mkdir /some/dir/nexus-data && chown -R 200 /some/dir/nexus-data
  $ docker run -d -p 8877:8877 --name nexus -v /some/dir/nexus-data:/nexus-data colorcoding/nexus
  ```

### Build Args

The Dockerfile contains two build arguments (`NEXUS_VERSION` & `NEXUS_DOWNLOAD_URL`) that can be used to customize what
version of, and from where, Nexus Repository Manager is downloaded. This is useful mostly for testing purposes as the
Dockerfile may be dependent on a very specific version of Nexus Repository Manager.

```
docker build --rm --tag nexus-custom --build-arg NEXUS_VERSION=3.x.y --build-arg NEXUS_DOWNLOAD_URL=http://.../nexus-3.x.y-unix.tar.gz .
```

## Getting Help

Looking to contribute to our Docker image but need some help? There's a few ways to get information or our attention:

* File a public issue [here on GitHub](https://github.com/sonatype/docker-nexus3/issues)
* Check out the [Nexus3](http://stackoverflow.com/questions/tagged/nexus3) tag on Stack Overflow
* Check out the [Nexus Repository User List](https://groups.google.com/a/glists.sonatype.com/forum/?hl=en#!forum/nexus-users)
