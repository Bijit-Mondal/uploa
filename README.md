# NodeJS file uploader

Forked from https://github.com/coligo-io/file-uploader

Some modifications to make upload dir configurable and make the whole thing deployable with [Kontena](https://kontena.io)

Check out the related blog post at: http://blog.kontena.io/

## Deploy

>Prerequisites: You need to have working Kontena Container Platform installed. If you are new to Kontena, check quick start guide.

### Loadbalancer

Install Kontena Load Balancer stack if you do not yet have public facing LB set-up.
```
$ kontena stack install kontena/ingress-lb
```


### Volumes

The application uses volumes to store uploaded files. The who idea is to demonstrate volume usage and naturally the volumes should be such kind that allows sharing the data between many containers. Some thing like `rexray/s3fs` works nicely in this case as it allows to mount the same S3, or any S3 compatible storage, bucket on many containers running on many hosts.

Create the volume definition on Kontena:
```
kontena volume create --driver rexray/s3fs --scope stack uploads
```

### App


Install this sample app:
```
kontena stack install jussi/nodejs-file-upload
```

Alternatively, if you've cloned the repo locally, you can run:
```
kontena stack install
```
which will install the stack using the local `kontena.yml` file