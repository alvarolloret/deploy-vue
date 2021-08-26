
resource "hcloud_ssh_key" "default" {
    name = "KEY TERRAFORM"
    public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "hcloud_server" "test" {
  name = "test"
  image = "ubuntu-20.04"
  server_type = "cx11"
  ssh_keys = ["${hcloud_ssh_key.default.name}"]
  
}


resource "godaddy_domain_record" "gd-developertoentrepreneur" {
  domain   = "developertoentrepreneur.com"


  record {
    name = "@"
    type = "A"
    data = "${hcloud_server.test.ipv4_address}"
    ttl = 600
    priority = 1
  }

}

resource "local_file" "foo" {
    content     = <<-EOT
      [ubuntu]
      ${hcloud_server.test.ipv4_address} ansible_user=root
    EOT
    filename = "${path.module}/../ansible/hosts"
}