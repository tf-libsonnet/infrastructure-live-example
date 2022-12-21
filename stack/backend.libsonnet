local const = import './constants.json';

{
  getBackend:: function(envName, component) {
    terraform+: {
      backend+: {
        s3: {
          bucket: 'my-' + envName + '-bucket',
          key: component + '/terraform.tfstate',
          region: const.region,
        },
      },
    },
  },
}
