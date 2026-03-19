from pathlib import Path
from dagster_dbt import DbtProject

# Current file is: root/lumiere_capital_pipeline/lumiere_capital_pipeline/project.py
lumiere_capital_project = DbtProject(
    # parents[2] means: 
    # [0] is lumiere_capital_pipeline/
    # [1] is lumiere_capital_pipeline/ (the outer one)
    # [2] is the ROOT of the repo
    project_dir=Path(__file__).resolve().parents[2],
)

lumiere_capital_project.prepare_if_dev()

