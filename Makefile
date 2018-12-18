build:
	source version && docker build -t eugenmayer/jira:"$${VERSION}" -f Dockerfile --build-arg JIRA_VERSION="$${VERSION}" .

push:
	source version && docker push eugenmayer/jira:"$${VERSION}"