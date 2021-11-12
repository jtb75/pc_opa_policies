# Disallow top level custom SELinux options
match[{"msg": msg}] {
    has_field(input.request.object.spec.securityContext, "seLinuxOptions")
    msg := "SELinux options is not allowed for Pod spec!"
}

# Disallow container level custom SELinux options
match[{"msg": msg}] {
    c := input_security_context[_]
    has_field(c.securityContext, "seLinuxOptions")
    msg := "SELinux options is not allowed for Container spec!"
}

# Read for Pod Object
input_security_context[c] {
    c := input.request.object.spec.containers[_]
    has_field(c.securityContext, "seLinuxOptions")
}
input_security_context[c] {
    c := input.request.object.spec.initContainers[_]
    has_field(c.securityContext, "seLinuxOptions")
}

# Read for all objects such as Deployments, DaemonSets, StatefulSets, Job, CronJob, etc 
input_security_context[c] {
    c := input.request.object.spec.template.spec.containers[_]
    has_field(c.securityContext, "seLinuxOptions")
}
input_security_context[c] {
    c := input.request.object.spec.template.spec.initContainers[_]
    has_field(c.securityContext, "seLinuxOptions")
}

# has_field returns whether an object has a field
has_field(object, field) = true {
    object[field]
}