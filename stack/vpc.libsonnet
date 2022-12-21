local tf = import 'github.com/tf-libsonnet/core/main.libsonnet';

{
  // Given the environment name and cidr block, return the VPC module call with output blocks.
  getVPC:: function(envName, cidrBlock) (
    // Bind the resulting object to a reference so we can refer to self.
    local o =
      tf.withModule(
        'vpc',
        'github.com/myorg/my-vpc?ref=v1.0.8',
        {
          name: envName,
          cidr_block: cidrBlock,
        },
      )
      + tf.withOutput('vpc_id', o._ref.module.vpc.get('vpc_id'));

    o
  ),
}
