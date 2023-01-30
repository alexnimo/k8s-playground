Existing VPC:

```bash
eksctl create cluster --name <lab something> --nodes 3 --node-type t2.large --region us-east-1 /
--vpc-private-subnets=<subnet 1>,<subnet 2> --vpc-public-subnets=<subnet 1>,<subnet 2>
```

create with config file:

eksctl create cluster --config-file=karpenter.yaml

example config files:

https://github.com/weaveworks/eksctl/tree/main/examples
