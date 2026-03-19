from pathlib import Path
from dagster_dbt import DbtProject

def find_root(start_path):
    for parent in start_path.parents:
        if (parent / "dbt_project.yml").exists():
            return parent
    return start_path.parents[2] # Fallback to 3 levels up

lumiere_capital_project = DbtProject(
    project_dir=find_root(Path(__file__).resolve()),
)

lumiere_capital_project.prepare_if_dev()

