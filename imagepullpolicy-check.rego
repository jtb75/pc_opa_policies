# Ensure Pod object has imagePullPolicy set Always for containers
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.kind.kind == "Pod"
	input.request.object.spec.containers[_].imagePullPolicy != "Always"
	msg := "Pod created does not have imagePullPolicy set to always"
}

# Ensure Pod object has imagePullPolicy set Always for initContainers
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.kind.kind == "Pod"
	input.request.object.spec.initContainers[_].imagePullPolicy != "Always"
	msg := "Pod created does not have imagePullPolicy set to always"
}

# Ensure all objects such as Deployments, DaemonSets, StatefulSets, Job, CronJob, etc have imagePullPolicy set Always for containers
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.object.spec.template.spec.containers[_].imagePullPolicy != "Always"
	msg := "The object you tried to create does not have imagePullPolicy set to always"
}

# Ensure all objects such as Deployments, DaemonSets, StatefulSets, Job, CronJob, etc have imagePullPolicy set Always for initContainers
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.object.spec.template.spec.initContainers[_].imagePullPolicy != "Always"
	msg := "The object you tried to create does not have imagePullPolicy set to always"
}