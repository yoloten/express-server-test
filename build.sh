
IMAGE_NAME=sample-app

build() {

  target=$1
  shift 1

  extra="$@"

  echo "Building $target"
  docker build --target $target -t $IMAGE_NAME:$target $extra .
}

case $1 in
  dev|builder|release)
    build "$@"
    ;;
  *)
    echo "Usage: $0 <dev|release> [extra]"
    ;;
esac