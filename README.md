Install Jenkins using terraform to create computing instancing and remote setup


Steps
- Terraform order new ec2 instance from aws
  - AMI : Red Hat Enterprice
  - Security Group
    - ssh access on port 22
    - http access on port 8080
  - key name attached
- User data file will contain:
  // Install Java on the system
  - sudo yum -y install java-1.8.0-openjdk wget
  - java -version
  // Install Jenkins
  - sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  - cd /etc/yum.repos.d/
  - sudo curl -O https://pkg.jenkins.io/redhat-stable/jenkins.repo
  - sudo yum -y install jenkins
  // Start and Enable Jenkins server
  - sudo systemctl start jenkins
  - sudo systemctl enable jenkins
  - systemctl status jenkins
  // Install firewalld on the server
  - sudo dnf install firewalld
  - sudo systemctl enable firewalld --now
  - sudo firewall-cmd --state
  // Allow communication on port 8080
  - sudo firewall-cmd --permanent --add-port=8080/tcp
  - sudo firewall-cmd --reload
  // print out default password
  - sudo cat /var/lib/jenkins/secrets/initialAdminPassword



N.B : After running this once you can create an AMI and going forward create your ec2 instance with that AMI
