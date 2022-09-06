# Playground for different tools and attack techniques

slack webhook config url: https://api.slack.com/apps
## Tracee

installation

```bash
kubectl create \
    -f https://raw.githubusercontent.com/aquasecurity/postee/main/deploy/kubernetes/postee.yaml \
    -f https://raw.githubusercontent.com/aquasecurity/tracee/v0.8.0/deploy/kubernetes/tracee-postee/tracee.yaml
```

patch slack webhook

```bash
export tracee_webhook=
```
```bash
yq e -i 'with(.actions[]|select(.name=="my-slack"); .url=env(tracee_webhook) | .enable=true)' postee.yaml
```
```bash
k patch cm postee-config --patch-file postee.yaml
```