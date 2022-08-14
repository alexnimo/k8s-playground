#! /bin/bash
sudo yum update -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
sudo unzip awscliv2.zip
sudo ./aws/install
sudo curl -Lo kubectl "https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo amazon-linux-extras install mate-desktop1.x -y
sudo bash -c 'echo PREFERRED=/usr/bin/mate-session > /etc/sysconfig/desktop'
sudo yum install tigervnc-server -y
myuser="ec2-user"
export mypasswd=${ec2_password}
mkdir /home/$myuser/.vnc
echo $mypasswd | vncpasswd -f > /home/$myuser/.vnc/passwd
chown -R $myuser:$myuser /home/$myuser/.vnc
chmod 0600 /home/$myuser/.vnc/passwd
sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
sudo sed -i 's/<USER>/ec2-user/' /etc/systemd/system/vncserver@.service
sudo systemctl daemon-reload
sudo systemctl enable vncserver@:1
sudo systemctl start vncserver@:1
sudo amazon-linux-extras install epel -y
sudo yum install chromium -y

export aws_region=${region}
export eks_cluster_name=${cluster_name}

aws eks --region $aws_region update-kubeconfig --name $eks_cluster_name
cp -r ~/.kube /home/ec2-user
chown -R ec2-user:ec2-user /home/ec2-user/.kube
