# resource "aws_launch_template" "blogify_LT" {
#     name_prefix = "blogify-lt-"
#     image_id = "ami-04681163a08179f28"
#     instance_type = "t2.micro"
#     key_name      = "north-linux-key"
#     vpc_security_group_ids = [ module.vpc.blogify_sg_id ]
#     block_device_mappings {
#         device_name = "/dev/xvda"
#       ebs {
#         volume_size = 10
#         volume_type = "gp3"
#         delete_on_termination = true
#       }
#     }

#     network_interfaces {
#       associate_public_ip_address = true
#       security_groups = [ module.vpc.blogify_sg_id ]
#     }
#    # User Data Script (Nginx Installation + Welcome Page)
#   user_data = base64encode(<<EOF
# #!/bin/bash

# # Create directory with correct spacing
# sudo mkdir -p /etc/venkey

# # Update system
# yum update -y

# # Install Nginx
# amazon-linux-extras enable nginx1
# yum install -y nginx

# # Start and enable Nginx
# systemctl start nginx
# systemctl enable nginx

# # Write hostname and welcome message to index.html
# echo "<div style='text-align: center; font-family: Arial, sans-serif;'>
#         <h1>Welcome to the Server</h1>
#         <h2>Hostname: $(hostname)</h2>
#       </div>" > /usr/share/nginx/html/index.html

# # Restart Nginx to apply changes
# systemctl restart nginx
# EOF
#   )

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "Blogify-Instance"
#     }
#   }
# }