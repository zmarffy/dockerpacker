# `dockerpacker`

`dockerpacker` is a tiny shell script that packs Docker images as tar files. It will only create a new tar file if the image changed since last pack. An example use case would be if you want to ship a client a fully packed, working image for their architecture.

## Usage

`dockerpacker [directory_containing_Dockerfile]`

It's exactly what it looks like. It will output a tar file to `${HOME}/dockerpacker/images` if there were changes since the last build.
