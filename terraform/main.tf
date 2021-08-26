

provider "hcloud" {
  token = "${var.hcloud_token}"
}

provider "godaddy" {
  key = "${var.GODADDY_API_KEY}"
  secret = "${var.GODADDY_API_SECRET}"
}