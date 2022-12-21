local tf = import 'github.com/tf-libsonnet/core/main.libsonnet';
local aws = import 'github.com/tf-libsonnet/hashicorp-aws/main.libsonnet';

{
  // Given the environment name, return the VPC data source lookup with mysql module call blocks.
  getMySQL:: function(envName) (
    // Bind the resulting object to a reference so we can refer to self.
    local o =
      aws.data.vpc.new(
        'vpc',
        tags={
          Name: envName,
        },
      )
      + tf.withModule(
        'mysql',
        'github.com/myorg/my-mysql?ref=v1.0.8',
        {
          name: envName,
          vpc_id: o._ref.data.aws_vpc.vpc.get('id'),
        },
      )
      + tf.withOutput('fqdn', o._ref.module.mysql.get('fqdn'));

    o
  ),
}
