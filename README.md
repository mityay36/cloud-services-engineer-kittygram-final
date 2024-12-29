# KITTYGRAM

Kittygram is a delightful web application that serves as a centralized database for all cat enthusiasts. Whether you're a proud cat owner or simply a fan of these furry friends, Kittygram allows users to create and share personalized "cat cards" showcasing the unique details of their feline companions.

Used libraries:  
- [Django                        3.2.3](https://docs.djangoproject.com/en/3.2/)  
- [djangorestframework           3.12.4](https://www.django-rest-framework.org/)  
- [djangorestframework-simplejwt 4.8.0](https://django-rest-framework-simplejwt.readthedocs.io/)

## Features

### Cat Cards
- Photo: Upload a charming photo of your cat to showcase their adorable face.
- Name: Provide your cat's name, because every feline deserves to be recognized.
- Date of Birth: Record your cat's birthday to celebrate and track their age.
- Color: Share the distinctive coat color of your cat, highlighting their individuality.
- Achievements: Brag about your cat's accomplishments or funny quirks by adding achievements to their card.

### Community Achievements
- Contribute: Users can add new achievements to the community pool, creating a growing list of feline accomplishments.
- Explore: Discover and add community achievements to your cat's card to showcase their unique talents.

## Installation of the project:
Clone the repository and change into it on the command line:

  git clone https://github.com/mityay36/infra_sprint1/

Make your own .env file in main directory. All required variables are listed in .env.example
 
Perform Docker images

    cd frontend
    docker build -t YOUR_USERNAME/kittygram_frontend .
    cd ../backend
    docker build -t YOUR_USERNAME/kittygram_backend .
    cd ../nginx
    docker build -t YOUR_USERNAME/kittygram_gateway . 

Push your images to Docker Hub

    docker push YOUR_USERNAME/kittygram_frontend
    docker push YOUR_USERNAME/kittygram_backend
    docker push YOUR_USERNAME/kittygram_gateway

Connect to our remote server

    ssh -i PATH_TO_SSH_KEY/SSH_KEY_NAME YOUR_USERNAME@SERVER_IP_ADDRESS 

Make an "kittygram" directory

    mkdir kittygram

Download DockerCompose on the server

    sudo apt update
    sudo apt install curl
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo apt install docker-compose

Copy docker-compose.production.yml and .env files to your server

    scp -i PATH_TO_SSH_KEY/SSH_KEY_NAME docker-compose.production.yml YOUR_USERNAME@SERVER_IP_ADDRESS:/home/YOUR_USERNAME/kittygram/docker-compose.production.yml

Start Docker Compose in daemon mode

    sudo docker-compose -f /home/YOUR_USERNAME/kittygram/docker-compose.production.yml up -d

Make migrations and collect static of your project

    sudo docker-compose -f /home/YOUR_USERNAME/kittygram/docker-compose.production.yml exec backend python manage.py migrate
    sudo docker-compose -f /home/YOUR_USERNAME/kittygram/docker-compose.production.yml exec backend python manage.py collectstatic
    sudo docker-compose -f /home/YOUR_USERNAME/kittygram/docker-compose.production.yml exec backend cp -r /app/collected_static/. /backend_static/static/

Open nginx configuration file

    sudo nano /etc/nginx/sites-enabled/default

Update your server location section

    location / {
        proxy_set_header Host $http_host;
        proxy_pass http://127.0.0.1:9000;
    }

Make sure the cof file is ok

    sudo nginx -t

Reload nginx

    sudo service nginx reload
  

## Author
[Dmitry Pokrovsky](https://github.com/mityay36)