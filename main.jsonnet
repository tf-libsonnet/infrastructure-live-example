local stack = import './stack/main.libsonnet';

stack.getStack('stage', '10.0.0.0/16')
+ stack.getStack('prod', '10.1.0.0/16')
