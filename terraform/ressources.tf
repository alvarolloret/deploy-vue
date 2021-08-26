
resource "hcloud_ssh_key" "default" {
    name = "KEY TERRAFORM"
    public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "hcloud_server" "test" {
  name = "test"
  image = "debian-9"
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