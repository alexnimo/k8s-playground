Existing VPC:

```bash
eksctl create cluster --name <lab something> --nodes 3 --node-type t2.large --region us-east-1 /
--vpc-private-subnets=<subnet 1>,<subnet 2> --vpc-public-subnets=<subnet 1>,<subnet 2>
```