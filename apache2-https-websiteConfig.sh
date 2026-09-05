how to install and deply a simple website on apache2 https port

sudo apt update
sudo apt install apache2 -y









----------

gemini answer and working fine


To deploy a default HTTPS webpage on an , you can quickly set up the built-in Apache2 web server alongside a self-signed "snakeoil" SSL certificate. This provides an instant, default sample site running over HTTPS without needing to buy a domain name yet. [1, 2] 
Here is the step-by-step process:
## Step 1: Install Apache
First, update your server's package index and install the :

sudo apt update
sudo apt install apache2 -y

## Step 2: Open Firewall Ports
If you have the UFW firewall active, you must allow incoming traffic on both HTTP (Port 80) and HTTPS (Port 443): [3, 4] 

sudo ufw allow 'Apache Full'

(Alternatively, you can manually open just the secure port using sudo ufw allow 443/tcp). [5] 
## Step 3: Enable the SSL Module and Default HTTPS Site
Ubuntu's Apache installation includes a pre-configured default HTTPS site that uses a built-in self-signed certificate. You just need to turn it on: [2] 

   1. Enable the SSL module:
   
   sudo a2enmod ssl
   
   2. Enable the default HTTPS configuration file:
   
   sudo a2ensite default-ssl.conf
   
   3. Restart Apache to apply the changes:
   
   sudo systemctl restart apache2
   
   [4, 6] 

## Step 4: Verify the Setup
Open your web browser and navigate to your server's IP address using the https:// prefix:

https://your_server_ip

⚠️ Note on the security warning: Because you are using a self-signed certificate, your browser will display a warning saying "Your connection is not private" or "Potential Security Risk Ahead". This is completely normal for a default setup. Click Advanced and choose Proceed / Accept Risk to view your default sample site. [1] 
------------------------------
## How to Modify the Sample Webpage
The default HTML file served by Apache is located at /var/www/html/index.html. You can edit this file to create your own custom webpage: [7] 

sudo nano /var/www/html/index.html

Replace the code inside with a basic custom sample, like:

<!DOCTYPE html>
<html>
<head>
    <title>My Secure Ubuntu Server</title>
</head>
<body>
    <h1>Success! My Ubuntu HTTPS server is working.</h1>
</body>
</html>

Save and close the file (Ctrl + O, Enter, then Ctrl + X). Refresh your browser to see your changes instantly.
If you plan on taking this website live for the general public, would you like help setting up a free, production-ready Let's Encrypt SSL certificate using a domain name? [5, 8] 

[1] [https://discourse.ubuntu.com](https://discourse.ubuntu.com/t/local-area-webserver-ubuntu-24-04-3-get-from-http-to-https-staying-inside-lan/74471)
[2] [https://www.linkedin.com](https://www.linkedin.com/learning/ubuntu-linux-providing-services/enable-https)
[3] [https://medium.com](https://medium.com/@thomas.vidori/how-to-host-your-own-website-on-your-ubuntu-server-with-nginx-46f34afc15df)
[4] [https://askubuntu.com](https://askubuntu.com/questions/1452161/enable-https-on-my-server)
[5] [https://www.youtube.com](https://www.youtube.com/watch?v=ikBodcNQkbw)
[6] [https://www.youtube.com](https://www.youtube.com/watch?v=Mlcde4fH-Gg)
[7] [https://askubuntu.com](https://askubuntu.com/questions/1102594/how-do-i-set-up-the-simplest-http-local-server)
[8] [https://www.youtube.com](https://www.youtube.com/watch?v=VXSgEvZKp-8&t=159)
