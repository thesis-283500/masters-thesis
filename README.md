# Energy-Efficient DevOps: Sustainable Software Deployment

## Query for Carbon Footprint Emission

```SQL
    {"QueryStatement":"SELECT last_refresh_timestamp, location, model_version, payer_account_id, product_code, region_code, total_mbm_emissions_unit, total_mbm_emissions_value, usage_account_id, usage_period_end, usage_period_start FROM CARBON_EMISSIONS"}

    {"TableConfigurations":{"CARBON_EMISSIONS":{}}}
```

## Important Links

- [How to setup eks cluster using terraform](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks)
- [Monitoring cloud carbon footprint using kepler](https://grafana.com/blog/2024/04/22/going-green-how-to-monitor-your-cloud-carbon-footprint-using-kepler-prometheus-and-grafana/)
- [How to setup self hosted runners](https://github.com/actions/actions-runner-controller/blob/master/docs/quickstart.md)
- [How to install cert-manager](https://cert-manager.io/docs/installation/)

## Handy Commands

- To connect kubectl to eks cluster run

```BASH
    aws eks --region $(terraform output -json eks-outputs | jq -r ".region") update-kubeconfig \
    --name $(terraform output -json eks-outputs | jq -r ".cluster_name")
```

- To delete a rogue namespace run

```BASH
    (NAMESPACE=spire-server
    kubectl proxy &
    kubectl get namespace $NAMESPACE -o json |jq '.spec = {"finalizers":[]}' >temp.json
    curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize)
```

- To delete stuck pod run

```BASH
    kubectl delete pod <podname> --grace-period=0 --force --namespace <namespace>
```