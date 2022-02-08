## Single-EC2

Single host instrumented with OpenTelemetry.

### Configurable variables in [caos.auto.tfvars](caos.auto.tfvars)

Each scenario has a `caos.auto.tfvars.dist` file with the default variables. When deploying a scenario, all variables
will be offered to the user to be changed or to use default ones. With the final values `caos.auto.tfvars` file will 
be created in the environment and it will be used when deploying the environment. These values can be manually changed
in the non versioned `caos.auto.tfvars` file.


```shell
ami="ami-04511222dedb7385d"
subnet="subnet-09b64de757828cdd4"
security_groups=["sg-044ef7bc34691164a"]
key_name="caos-dev-arm"
instance_type="t3a.small"
username="caos"
ssh_pub_key="AAAAB3NzaC1yc2EAAAADAQABAAABAQDH9C7BS2XrtXGXFFyL0pNku/Hfy84RliqvYKpuslJFeUivf5QY6Ipi8yXfXn6TsRDbdxfGPi6oOR60Fa+4cJmCo6N5g57hBS6f2IdzQBNrZr7i1I/a3cFeK6XOc1G1tQaurx7Pu+qvACfJjLXKG66tHlaVhAHd/1l2FocgFNUDFFuKS3mnzt9hKys7sB4aO3O0OdohN/0NJC4ldV8/OmeXqqfkiPWcgPx3C8bYyXCX7QJNBHKrzbX1jW51Px7SIDWFDV6kxGwpQGGBMJg/k79gjjM+jhn4fg1/VP/Fx37mAnfLqpcTfiOkzSE80ORGefQ1XfGK/Dpa3ITrzRYW8xlR caos-dev-arm"
pvt_key="/root/.ssh/caos-dev-arm.cer"
name="otel-env-single"
otlp_endpoint=""
nr_license_key=""
```

### OpenTelemetry configuration
Default configuration is located under [otel-config.yaml](otel-config.yaml.j2). Modify it and relaunch scenario to apply 
the changes.