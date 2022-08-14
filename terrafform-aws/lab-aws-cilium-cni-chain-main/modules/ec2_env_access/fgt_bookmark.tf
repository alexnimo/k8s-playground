resource "fortios_vpnsslweb_userbookmark" "ec2_bookmark" {
  name = "${var.tags}@Digibank.co.il#${var.group}"

   bookmarks {
     name           = "ENV-VNC-Access-${var.tags}"
     apptype        = "vnc"
     host           = aws_instance.ec2_vnc.public_ip
     port           = "5901"
     logon_password = var.ec2_password_var
     width          = "1280"
     height         = "960"
    }  
  depends_on = [
    aws_instance.ec2_vnc
  ]
}
