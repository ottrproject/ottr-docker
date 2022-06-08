# ottr_docker

This repository stores the Dockerfiles and associated files for images that can be used by OTTR for rendering (or other items underneath the hood). 

## How to use

In your OTTR repositories, you can specify a different docker image for rendering in the `config_automation.yml` file. 

Currently the only supported docker images for rendering purposes are `base_ottr` and `bioconductor`. 

Read more about docker customization on [ottrproject.org](https://www.ottrproject.org/customize-docker.html). 
