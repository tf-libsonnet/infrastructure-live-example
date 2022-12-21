local backend = import './backend.libsonnet';
local mysql = import './mysql.libsonnet';
local provider = import './provider.libsonnet';
local vpc = import './vpc.libsonnet';

{
  // getStack returns the Terraform code to deploy the full application stack for a single environment. To facilitate
  // this, this returns the resulting main.tf.json for each folder in the environment stack, which should be extracted
  // by the -m flag of jsonnet.
  getStack:: function(envName, cidrBlock) {
    [envName + '/vpc/main.tf.json']: (
      backend.getBackend(envName, 'vpc')
      + provider
      + vpc.getVPC(envName, cidrBlock)
    ),
    [envName + '/mysql/main.tf.json']: (
      backend.getBackend(envName, 'mysql')
      + provider
      + mysql.getMySQL(envName)
    ),
  },
}
