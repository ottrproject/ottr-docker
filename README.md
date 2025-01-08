# OTTR Docker library

This repository stores the Dockerfiles and associated files for images that can be used by OTTR for rendering (or other items underneath the hood). 

## How to use

In your OTTR repositories, you can specify a different docker image for rendering in the `config_automation.yml` file. 

Currently the only supported docker images for rendering purposes are `base_ottr` and `bioconductor`. 

Read more about docker customization on [ottrproject.org](https://www.ottrproject.org/customize-docker.html). 

## To rebuild an image: 

Go to Actions > Manual build of docker image > Run workflow

For directory, put the directory/docker image name that you'd like to rebuild. e.g. "base_ottr"

For tag, put the full name of the docker image as it is called on dockerhub. e.g. "jhudsl/base_ottr:main"

For "Push to Dockerhub" either put "true" if you'd like to push to dockerhub or "false" if you just want to test the build but not push it. 

Example of a docker image manual rebuild settings: 

<img width="314" alt="Screen Shot 2023-02-28 at 2 34 23 PM" src="https://user-images.githubusercontent.com/23458084/222026971-2113420f-5bd4-4bf4-90fe-65f1fd18bcc2.png">

