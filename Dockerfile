# use an old python image for security testing
FROM python:3.9-slim-buster

# set some basic metadata
LABEL author="Dimitris"
LABEL env="test"

# custom folder name - avoid using /usr/src/app
WORKDIR /my_dev_folder

# install old libraries to trigger the scanner (vulnerable versions)
RUN pip install --no-cache-dir flask==1.0.2 jinja2==2.10 requests==2.23.0

# create a simple version file
RUN echo "v1.2.3-build" > project_version.txt

# bring the exploit script into the container
COPY exploit.py .

# standard start command
CMD ["python", "-c", "print('Container is running...')"]