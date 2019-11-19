# Docker image of Atlassian Jira

Production ready, up to date builds of Atlassian Jira - right from the original binary download based on adoptjdk openjdk 11

This project is build by concourse.ci, see [our oss pipelines here](https://github.com/EugenMayer/concourse-our-open-pipelines)
 
[![Docker Stars](https://img.shields.io/docker/stars/eugenmayer/jira.svg)](https://hub.docker.com/r/eugenmayer/jira/) [![Docker Pulls](https://img.shields.io/docker/pulls/eugenmayer/jira.svg)](https://hub.docker.com/r/eugenmayer/jira/)

## Supported tags and respective Dockerfile links

| Product |Version | Tags  | Dockerfile |
|---------|--------|-------|------------|
| Jira Software - EN | 7.0 - 8.x(latest) | [see tags](https://hub.docker.com/r/eugenmayer/jira/tags/) | [Dockerfile](https://github.com/eugenmayer/jira/blob/master/Dockerfile) |

> On every release, the oldest and the newest tags are rebuild. 

# You may also like

* [confluence](https://github.com/EugenMayer/docker-image-atlassian-confluence)
* [bitbucket](https://github.com/EugenMayer/docker-image-atlassian-bitbucket)
* [rancher catalog - corresponding catalog for jira](https://github.com/EugenMayer/docker-rancher-extra-catalogs/tree/master/templates/jira)
* [development - running this image for development including a debugger](https://github.com/EugenMayer/docker-image-atlassian-jira/tree/master/examples/debug)

# In short

Docker-Compose:

~~~~
curl -O https://raw.githubusercontent.com/eugenmayer/jira/master/docker-compose.yml
docker-compose up -d
~~~~

> Jira will be available at http://yourdockerhost

Docker-CLI:

~~~~
docker run -d -p 80:8080 -v jiravolume:/var/atlassian/jira --name jira eugenmayer/jira
~~~~

> Jira will be available at http://yourdockerhost. Data will be persisted inside docker volume `jiravolume`.

## Configuration

See the `docker-compose.yml` file

# Build the image

You can build the image yourself. You might want to adjust the desired jira version in `.env`

```
docker-compose build jira
```

# Run in debug mode

If you want to run JIRA with a debug port, please see `examples/debug` - esentially what we do is
 - we add the debug port as an env parameter
 - we overwrite the start-jira.sh script so we do not user `catalina.sh run` as startup bun rater `catalina.sh jpda run` .. that is about anything we changed in there
 - we expose the port 5005 to the host so we can connect