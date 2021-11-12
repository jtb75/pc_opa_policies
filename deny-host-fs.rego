match[{"msg": msg}] {
	input.request.operation == "CREATE"
	hostPath := input.request.object.spec.template.spec.volumes[_].hostPath.path
	res := [startswith(hostPath, "/etc"), startswith(hostPath, "/var"), hostPath == "/"]
	res[_]
	msg := "Pod attempted to access sensitive host file system mount!"
}