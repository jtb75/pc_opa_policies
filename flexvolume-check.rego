# Ensure Pod object does not use flexVolume
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.kind.kind == "Pod"
	input.request.object.spec.volumes[_].flexVolume
	msg := "Pod created with flexVolume!"
}

# Ensure all objects such as Deployments, DaemonSets, StatefulSets, Job, CronJob, etc do not use flexVolume
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.object.spec.template.spec.volumes[_].flexVolume
	msg := "Object created with flexVolume!"
}
