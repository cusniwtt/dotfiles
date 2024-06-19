paru -S thorium-browser vesktop arch-gaming-meta spotify-launcher docker docker-compose visual-studio-code-bin forticlient-vpn

sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

