match[{"msg": msg}] {
	input.request.operation == "CREATE"
	hostPath := input.request.object.spec.template.spec.volumes[_].hostPath.path
	res := [startswith(hostPath, "/var/run/docker.sock")]
	res[_]
	msg := "Pod attempted to mount the docker subsystem!"
}

match[{"msg": msg}] {
	input.request.operation == "CREATE"
	hostPath := input.request.object.spec.volumes[_].hostPath.path
	res := [startswith(hostPath, "/var/run/docker.sock")]
	res[_]
	msg := "Pod attempted to mount the docker subsystem!"
}