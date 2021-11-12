match[{"msg": msg}] {
  image := input_containers[_]	
  not startswith_allowed_registry(image)
	msg := "Container image comes from untrusted registry!"
}

# Ensure Pod object does not use procMount
input_containers[c] {
    c := input.request.object.spec.containers[_].image
}
input_containers[c] {
    c := input.request.object.spec.initContainers[_].image
}

# Ensure all objects such as Deployments, DaemonSets, StatefulSets, Job, CronJob, etc do not use sysctls
input_containers[c] {
    c := input.request.object.spec.template.spec.containers[_].image
}
input_containers[c] {
    c := input.request.object.spec.template.spec.initContainers[_].image
}

# ClaimsNextGen SRD AWS account, SBX AWS account, AWS Managed shared account for aws-node image
startswith_allowed_registry(image) {
  allowed_registries := ["255474220078.dkr.ecr.us-east-1.amazonaws.com", "004434582827.dkr.ecr.us-east-1.amazonaws.com", "602401143452.dkr.ecr.us-east-1.amazonaws.com"]
  startswith(image, allowed_registries[_])
}