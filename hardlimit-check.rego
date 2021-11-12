soft = [
"memory",
"cpu"
]


match[{"msg": msg}] {
	input.request.operation == "CREATE"
	requests = input.request.object.spec.template.spec.containers[_].resources.limits
	count({ x | x = requests[soft[_]] }) != 2
	msg := "Attempted to create pod without hard limits!"
}