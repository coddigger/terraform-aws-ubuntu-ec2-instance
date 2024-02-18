# resource "time_sleep" "wait_180_seconds" {
#   create_duration = "180s"
# }

resource "terraform_data" "copyscripts" {

    connection {
        type = "ssh"
        host = "${aws_eip.linux-eip.public_ip}"
        user = "ubuntu"
        private_key = file("${aws_key_pair.key_pair.key_name}.pem")
    }

        provisioner "file" {
            source      = "./scripts"
            destination = "."
        }

        # provisioner "file" {
        #     source      = "./scripts/install_reqs.sh"
        #     destination = "./install_reqs.sh"
        # }

        # provisioner "file" {
        #     source      = "./scripts/create_desktop_shortcuts.sh"
        #     destination = "./create_desktop_shortcuts.sh"
        # }

        # provisioner "file" {
        #     source      = "./scripts/create_users.sh"
        #     destination = "./create_users.sh"
        # }

        provisioner "remote-exec" {
            inline = [
            "chmod u+x ./scripts/*.sh",
            # "chmod u+x ./install_reqs.sh",
            # "chmod u+x ./create_users.sh",
            # "chmod u+x ./desktop_shortcuts.sh",
            "./scripts/install_reqs.sh",
            "./scripts/create_users.sh ${random_string.password.result}",
            "./scripts/create_desktop_shortcuts.sh"
            ]
        }

#    depends_on = [ aws_instance.linux-server, aws_key_pair.key_pair, time_sleep.wait_180_seconds ]
    depends_on = [ aws_eip_association.linux-eip-association, aws_security_group.aws-linux-sg, aws_instance.linux-server, aws_key_pair.key_pair ]

}