from setuptools import find_packages, setup

setup(
    name="lumiere_capital_pipeline",
    version="0.0.1",
    packages=find_packages(),
    package_data={
        "lumiere_capital_pipeline": [
            "dbt-project/**/*",
        ],
    },
    install_requires=[
        "dagster",
        "dagster-cloud",
        "dagster-dbt",
        "dbt-core<1.12",
        "dbt-databricks<1.12",
    ],
    extras_require={
        "dev": [
            "dagster-webserver",
        ]
    },
)

