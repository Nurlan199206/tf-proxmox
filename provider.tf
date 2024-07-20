terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://192.168.1.75:8006/api2/json"
    pm_api_token_id = "root@pam!terraform"
    pm_api_token_secret = "6d0124fd-1528-42b2-836c-ccfd56e72169"
}
