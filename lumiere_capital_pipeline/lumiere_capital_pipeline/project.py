from pathlib import Path
from dagster_dbt import DbtProject

lumiere_capital_project = DbtProject(
    project_dir=Path(__file__).resolve().parents[2],
)

lumiere_capital_project.prepare_if_dev()

