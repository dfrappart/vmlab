
output "MyIp" {
  value       = data.http.myip.response_body
  description = "value of my IP address"
}

output "VNetFullOutput" {
  value       = { for k, v in module.vnet : k => v.VNetFullOutput }
  sensitive   = true
  description = "Full output of the virtual network"
}

