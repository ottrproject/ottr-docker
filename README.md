# OTTR Docker library

This repository stores the Dockerfiles and associated files for images that can be used by OTTR for rendering (or other items underneath the hood).

## How to use

In your OTTR repositories, you can specify a different docker image for rendering in the `config_automation.yml` file. For the purposes of rendering different courses, if you have code that needs to be run, you may require a custom Docker image so that you have the packages being called in the code.

Read more about docker customization on [ottrproject.org](https://www.ottrproject.org/customize-docker.html).

## To rebuild an image:

Go to Actions > Manual build of docker image > Run workflow

For directory, put the directory/docker image name that you'd like to rebuild. e.g. "base_ottr"

For tag, put the full name of the docker image as it is called on dockerhub. e.g. "jhudsl/base_ottr:main"

For "Push to Dockerhub" either put "true" if you'd like to push to dockerhub or "false" if you just want to test the build but not push it.

Example of a docker image manual rebuild settings:

<img width="314" alt="Screen Shot 2023-02-28 at 2 34 23 PM" src="https://user-images.githubusercontent.com/23458084/222026971-2113420f-5bd4-4bf4-90fe-65f1fd18bcc2.png">

## Adding a new image

1. Make a new directory  
2. Put your Dockerfile in this directory. Make sure it is named "Dockerfile" exactly.  
3. Open up `pull_request.yml` and find where there is a comment like this:  
```
# NEW IMAGES HERE: #
#######   - {dir: directory_path,   name: 'name its called on dockerhub'}
```
4. Follow the same format as the other images in this repository and add a line to this list underneath `matrix:`  
```
- {dir: directory_path,   name: 'name its called on dockerhub'}
```
For example it should look something like:  
```
- {dir: base_ottr,   name: 'jhudsl/base_ottr'}
```
Where `base_ottr` is the path to the directory where the Dockerfile is stored inside the folder named `base_ottr` and `jhudsl/base_ottr` is what it is called on Dockerhub.  
5. Repeat steps 3-4 for the file `merge.yml`.
6. Develop your Dockerfile as your normally would but with each push to your open pull request `pull_request.yml` will attempt to rebuild it to test it.  
7. When it successfully builds and it has what you want then you can have it reviewed and merged.  
8. Upon merging `merge.yml` will rebuild the image one more time and then push to Dockerhub (if it has proper credentials to do so). Dockerhub username and Dockerhub token stored in this repository as GitHub secrets needs to have push access to the image on Dockerhub.  

For more information on any of this ask @cansavvy.

## To make a new tagged version of an image 

1. Make a new directory with a similar name. For example, base_ottr_r4.4.0 as a tag of r4.4.0 for base_ottr. 
2. Put your Dockerfile in this directory. Make sure it is named "Dockerfile" exactly.  
3. After checking that the image runs without pushing to Dockerhub, push to Dockerhub
Go to Actions > Manual build of docker image > Run workflow

For directory, put the directory/docker image name that you'd like to rebuild. e.g. "base_ottr_r4.4.0".

For tag, put the full name of the docker image as it is called on dockerhub. e.g. "jhudsl/base_ottr:main-r4.4.0".

For "Push to Dockerhub"  put "true".
4. Add your new tagged version to .github/workflows/pull_request.yml like this: 
- {dir: base_ottr,   name: 'jhudsl/base_ottr:main-r4.4.0'}
