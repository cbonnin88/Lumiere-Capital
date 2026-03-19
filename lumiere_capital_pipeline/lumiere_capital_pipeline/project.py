import os
from pathlib import Path
from dagster_dbt import DbtProject

reporoot = os.getenv("DAGSTER_CHROOT_DIR", Path(__file__).joinpath("..", "..").resolve())

lumiere_capital_project = DbtProject(
    project_dir=Path(reporoot).resolve(),
)

lumiere_capital_project.prepare_if_dev()

