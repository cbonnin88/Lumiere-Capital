from dagster import Definitions
from dagster_dbt import DbtCliResource
from .assets import lumiere_capital_dbt_assets
from .project import lumiere_capital_project
from .schedules import schedules

defs = Definitions(
    assets=[lumiere_capital_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=lumiere_capital_project),
    },
)

