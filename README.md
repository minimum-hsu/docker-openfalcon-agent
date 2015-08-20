# docker-openfalcon-agent

## Build

Enter the following command in the repo directory.

```
$sudo docker build --force-rm=true -t openfalcon-agent .
```

## Run

### Basic Run

Use default configuration and falcon-agent package.

```
$sudo docker run -dti --name agent -p 1988:1988 openfalcon-agent
```

### Advanced Run

+ Self-defined configuration

    Replace file **cfg.json** in the volume */config*.  
    For more detail about **cfg.json**, see [Agent](http://book.open-falcon.com/zh/install/agent.html).

+ New falcon-agent package

    Replace file **falcon-agent.tar.gz** in the volume */package*.
    
For example, **cfg.json** in /tmp/config and **falcon-agent.tar.gz** in /tmp/pack,

```
$sudo docker run -dti --name agent -v /tmp/pack:/package -v /tmp/config/cfg.json:/config/cfg.json -p 1988:1988 openfalcon-agent
```
