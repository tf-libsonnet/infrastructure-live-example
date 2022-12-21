# tf.libsonnet infrastructure-live example

This repository contains an example of how to use [Jsonnet](https://jsonnet.org/) and
[tf.libsonnet](https://tflibsonnet.com) to manage a multi-state Terraform project.

This represents a toy example of an AWS stack containing a VPC and MySQL database, that uses a fictional Terraform
module to deploy each.

> **NOTE**
>
> The underlying module calls use `null_resource`s to simulate the resources. However, the general pattern should be
> extensible to real world modules and use cases.

Refer to [Comparison to Terraform HCL](https://docs.tflibsonnet.com/docs/what-is-tf-libsonnet/#comparison-to-terraform-hcl)
for the motivating example and a full walkthrough.

## Usage

You can generate the Terraform code by using the base Jsonnet tool. To start, install `jsonnet` and `jsonnet-bundler`
(aka `jb`):

- [Installing Jsonnet](https://github.com/google/go-jsonnet#installation-instructions)
- [Installing jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler#install)

Once you have `jsonnet` and `jb` installed, generate the code with the following commands:

```
$ jb install
$ jsonnet -J ./vendor -c -m out/ main.jsonnet
```

This will output all the Terraform code to the `out` directory, resulting in the following folder structure:

```
./out
├── prod
│   ├── mysql
│   │   └── main.tf.json
│   └── vpc
│       └── main.tf.json
└── stage
    ├── mysql
    │   └── main.tf.json
    └── vpc
        └── main.tf.json
```

## Support

If you have any questions about how to use the `tf.libsonnet` libraries, ask in the [Organization GitHub
Discussion](https://github.com/orgs/tf-libsonnet/discussions).
