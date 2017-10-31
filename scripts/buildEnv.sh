set -a
source .env

echo "Building \"gitlab.rb\" via envsubst"
envsubst < templates/gitlab.rb > "volumes/config/gitlab.rb"
