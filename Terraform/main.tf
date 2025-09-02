provider "proxmox" {
  endpoint = "https://proxmox.iruma.arc/"
  insecure = true # Only needed if your Proxmox server is using a self-signed certificate
}
