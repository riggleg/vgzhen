echo "Running Apt Get Update"
apt-get update -y
echo "Install Curl"
apt-get install curl -y

echo "Install imagemagick imagemagic-dev"
apt-get install imagemagick libmagickwand-dev -y

echo "Installing git"
apt-get install git -y

echo "Install libs needed for nokogiri"
apt-get install libxslt-dev libxml2-dev -y

