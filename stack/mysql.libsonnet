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
        // NOTE: For simplicity, we self reference the current repository but in production, you should move the modules
        // to a different repo, and use a concrete ref tag.
        'github.com/tf-libsonnet/infrastructure-live-example//modules/mysql?ref=main',
        {
          name: envName,
          vpc_id: o._ref.data.aws_vpc.vpc.get('id'),
        },
      )
      + tf.withOutput('fqdn', o._ref.module.mysql.get('fqdn'));

    o
  ),
}
