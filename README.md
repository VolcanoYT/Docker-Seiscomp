# Docker Seiscomp

Run Seiscomp with easy steps (base ubuntu)

![Screenshot](show_me.jpg)

## How to Use!

Use docker to run it (VolcanoYT repo requires a password, please ask me first, we are also trying to move our image to hub.docker so that it can be accessed publicly soon)

```bash
# We no longer use mariadb server in container seiscomp because it's too much to take care of, so we tried linuxserver/mariadb image with docker compose.
git clone https://github.com/volcanoyt/Docker-Seiscomp.git
docker-compose up
```

- Web Remote: http://localhost:6080 with password "demo"

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

```bash
git clone https://github.com/volcanoyt/Docker-Seiscomp.git
docker build -t "repo.volcanoyt.com/docker-seiscomp:last" -f Dockerfile .
docker push repo.volcanoyt.com/docker-seiscomp:last
```

## License
Program based [AGPL](https://www.seiscomp.de/license/) but this project [MIT](https://choosealicense.com/licenses/mit/)