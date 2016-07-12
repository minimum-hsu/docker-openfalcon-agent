# docker-openfalcon-agent

## Build

Enter the following command in the repo directory.

```
$ docker build -t openfalcon-agent -f docker/ubuntu/Dockerfile .
```

## Run

### Basic Run

Use default configuration and falcon-agent package.

```
$ docker run -d --name agent -p 1988:1988 openfalcon-agent
```

### Advanced Run

+ Self-defined configuration

    Replace file **cfg.json** in the volume */config*.  
    For more detail about **cfg.json**, see [Agent](http://book.open-falcon.com/zh/install/agent.html).

For example, **cfg.json** in /tmp/config,

```
$ docker run -d --name agent -v /tmp/config/cfg.json:/config/cfg.json -p 1988:1988 openfalcon-agent
```
