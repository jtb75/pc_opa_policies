# Ensure Pod object does not use procMount
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.kind.kind == "Pod"
	input.request.object.spec.securityContext.procMount
	msg := "Pod created with explicit procMount set in spec!"
}

# Ensure all objects such as Deployments, DaemonSets, StatefulSets, Job, CronJob, etc do not use sysctls
match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.object.spec.template.spec.securityContext.procMount
	msg := "Object created with explicit procMount set in spec!"
}
