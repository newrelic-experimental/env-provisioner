[![New Relic Experimental header](https://github.com/newrelic/opensource-website/raw/master/src/images/categories/Experimental.png)](https://opensource.newrelic.com/oss-category/#new-relic-experimental)

# otel-env-provider

> Create OpenTelemetry instrumented environments on demand.

Predefined scenarios are located under [terraform](terraform)
folder and can be spawned with custom configurations. When creating and environment, a copy of the selected scenario will 
be created and placed under [environments](environments) folder with the custom configuration. 

## Installation

* [Docker](https://www.docker.com/) Application will run in docker so no other software dependencies are required.
* **AWS Credentials**: `~/.aws` folder will be used to create the infrastructure in AWS
* **SSH Key**: `~/.ssh` folder will be used to access the ES2 instances
* `AWS_PROFILE` : Environment variable with the profile to be used
* `AWS_REGION` : Environment variable with the AWS region to be used 

## Getting Started

> Executing `run.sh` will guide you to create, execute and destroy environments. After creating the environment, check the
README.md of the created environment to check how to configure it.
```shell
./run.sh
```

## Support

* [single-ec2](terraform/single-ec2): Launch an ec2 instance
* [otel-ec2](terraform/otel-ec2): Spawn ec2 instances with the Open Telemetry Collector (gateway or agent)

## Troubleshooting
#### Terraform gets stuck after plan
Probably aws credentials are expired. Renew them and execute action again.

#### Ansible cannot connect to host
Ensure that the ssh_key path provided is the one inside the docker container (i.e. : /root/.ssh/your_key_name). `.ssh` 
folder gets mounted `ro` inside the container so any key from the host machine should work.

## Contributing
We encourage your contributions to improve [project name]! Keep in mind when you submit your pull request, you'll need to sign the CLA via the click-through using CLA-Assistant. You only have to sign the CLA one time per project.
If you have any questions, or to execute our corporate CLA, required if your contribution is on behalf of a company,  please drop us an email at opensource@newrelic.com.

**A note about vulnerabilities**

As noted in our [security policy](../../security/policy), New Relic is committed to the privacy and security of our customers and their data. We believe that providing coordinated disclosure by security researchers and engaging with the security community are important means to achieve our security goals.

If you believe you have found a security vulnerability in this project or any of New Relic's products or websites, we welcome and greatly appreciate you reporting it to New Relic through [HackerOne](https://hackerone.com/newrelic).

## License
otel-env-provider is licensed under the [Apache 2.0](http://apache.org/licenses/LICENSE-2.0.txt) License.
