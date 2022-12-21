local const = import './constants.json';
local aws = import 'github.com/tf-libsonnet/hashicorp-aws/main.libsonnet';

aws.provider.new(region=const.region)
