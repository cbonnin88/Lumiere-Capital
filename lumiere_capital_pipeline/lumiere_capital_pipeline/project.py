from pathlib import Path

from dagster_dbt import DbtProject

lumiere_capital_project = DbtProject(
    # Path.cwd() is the root of your repo in Dagster Cloud
    # If dbt_project.yml is in the root, use this:
    project_dir=Path(__file__).joinpath("..", "..").resolve(), 
)
lumiere_capital_project.prepare_if_dev()

