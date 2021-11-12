match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.object.spec.template.spec.containers[_].securityContext.privileged
	msg := "Pod created with Root Privileges!"
}