match[{"msg": msg}] {
	input.request.operation == "CREATE"
	input.request.object.spec.template.spec.containers[_].securityContext.allowPrivilegeEscalation
	msg := "Pod attempted to do Privilege Escalation!"
}