# Ensure Pod object does not use sysctls
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.kind.kind == "Pod"
	input.request.object.spec.securityContext.sysctls[_].name
	msg := "Pod created with sysctls capabilities!"
}

# Ensure all objects such as Deployments, DaemonSets, StatefulSets, Job, CronJob, etc do not use sysctls
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.object.spec.template.spec.securityContext.sysctls[_].name
	msg := "Object created with sysctls capabilities!"
}
