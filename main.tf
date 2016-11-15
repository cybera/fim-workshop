resource "openstack_compute_keypair_v2" "workshop" {
  name = "fim-workshop"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "openstack_compute_secgroup_v2" "workshop" {
  name = "fim-workshop"
  description = "Rules for workshop"

  rule {
    ip_protocol = "icmp"
    from_port = -1
    to_port = -1
    cidr = "0.0.0.0/0"
  }

   rule {
    ip_protocol = "icmp"
    from_port = -1
    to_port = -1
    cidr = "::/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr = "0.0.0.0/0"
  }
  rule {
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr = "::/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr = "0.0.0.0/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr = "::/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr = "0.0.0.0/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr = "::/0"
  }
}

resource "openstack_compute_instance_v2" "idp" {
  name = "fim-workshop-idp"
  image_name = "Ubuntu 16.04"
  flavor_name = "m1.medium"
  key_pair = "${openstack_compute_keypair_v2.workshop.name}"
  security_groups = ["${openstack_compute_secgroup_v2.workshop.name}"]
  user_data = "#cloud-config\nfqdn: idp.example.com\nhostname: idp.example.com"
}

resource "openstack_compute_instance_v2" "dokuwiki" {
  name = "fim-workshop-dokuwiki"
  image_name = "Ubuntu 14.04"
  flavor_name = "m1.medium"
  key_pair = "${openstack_compute_keypair_v2.workshop.name}"
  security_groups = ["${openstack_compute_secgroup_v2.workshop.name}"]
  user_data = "#cloud-config\nfqdn: dokuwiki.example.com\nhostname: dokuwiki.example.com"
}

resource "null_resource" "idp" {
  connection {
    user = "ubuntu"
    host = "${element(openstack_compute_instance_v2.idp.*.access_ip_v6, count.index)}"
    private_key = "~/.ssh/id_rsa"
  }
}

resource "null_resource" "dokuwiki" {
  connection {
    user = "ubuntu"
    host = "${element(openstack_compute_instance_v2.idp.*.access_ip_v6, count.index)}"
    private_key = "~/.ssh/id_rsa"
  }
}

