To get an up-to-date list of Istio configuration profiles, run the:

```bash
istioctl profile list
```

To install Istio using the Istio CLI, we can use the --set flag and specify the profile like this:

```bash
istioctl install --set profile=demo
```

To get the complete YAML configuration of the demo profile, we can run the following command:

```bash
istioctl profile dump demo
```

Another useful command when exploring the different profiles is the diff command. The diff command lists differences between the configuration profiles:

```bash
istioctl profile diff demo default
```

Here is how we could install the istiod chart, for example:

```bash
helm install istiod istio/istiod -n istio-system
```

We can provide custom configuration settings to individual Helm charts at installation time. To review settings that can be updated, we can use the show values command like this:

```bash
helm show values istio/istiod
```

Lab files:

https://github.com/tetratelabs/cncf-istio-course

