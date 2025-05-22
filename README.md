# Energy-Efficient DevOps: Sustainable Software Deployment

## Query for Carbon Footprint Emission

```SQL
    {"QueryStatement":"SELECT last_refresh_timestamp, location, model_version, payer_account_id, product_code, region_code, total_mbm_emissions_unit, total_mbm_emissions_value, usage_account_id, usage_period_end, usage_period_start FROM CARBON_EMISSIONS"}

    {"TableConfigurations":{"CARBON_EMISSIONS":{}}}
```

## Important Links

- [How to setup eks cluster using terraform](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks)
- [Monitoring cloud carbon footprint using kepler](https://grafana.com/blog/2024/04/22/going-green-how-to-monitor-your-cloud-carbon-footprint-using-kepler-prometheus-and-grafana/)
- [How to setup self hosted runners]()