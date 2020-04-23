# docker-cfs-quota

docker container to test cfs quota fixes in the linux kernel. infos:

* <https://github.com/kubernetes/kubernetes/issues/67577>
* <https://github.com/zalando-incubator/kubernetes-on-aws/pull/923>
* <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=de53fd7aedb100f03e5d2231cfce0e4993282425>

go code borrowed from (see readme there for more info):

* <https://gist.github.com/bobrik/2030ff040fad360327a5fab7a09c4ff1>

run on your docker host with 200 millicpu via:

```bash
docker run -it --rm --env CFS_SLEEP=100ms --env CFS_ITERATIONS=50 --cpus 0.2 monotek/docker-cfs-quota
```

or in kubernetes:

```bash
kubectl run --generator=run-pod/v1 -it --rm cfs-quota-test --image=monotek/docker-cfs-quota --env=CFS_SLEEP=100ms --env=CFS_ITERATIONS=50 --limits=cpu=0.2 --requests=cpu=0.2
```

Default values of the go app can be changed via env vars:

* CFS_SLEEP
  * defaults to 100ms
* CFS_ITERATIONS
  * defaults to 25

**If burn time is much above 5ms your kernel is throttling!**
