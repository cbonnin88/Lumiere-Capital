from dagster import AssetExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .project import lumiere_capital_project


@dbt_assets(manifest=lumiere_capital_project.manifest_path)
def lumiere_capital_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()
    

