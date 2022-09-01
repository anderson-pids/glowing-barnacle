# glowing-barnacle
Terraform and Terragrunt executable based on docker image containers.

## Requirements
- GNU Make 4.3
- Docker

## Install

1. Generate executables
```sh
make init
```

2. Install with root permission
```sh
sudo make install
```

After install with success, you could execute:
- `terraform-sh`
- `terragrunt-sh`

> All configuration can be done in docker-compose file to set wanted version or adjust environment variables

## How to execute

When execute `terraform-sh` or `terrafrunt-sh`, you enter in a container with the tools and the actual path folder mapped into de container.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)