#______________________________________________
#
# kube_config output
#______________________________________________

output "kube_config" {
  description = "The Intersight Kubernetes Service kube_config output."
  value       = base64decode(data.intersight_kubernetes_cluster.kube_config.results[0].kube_config)
}
