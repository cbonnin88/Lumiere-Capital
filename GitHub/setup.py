from setuptools import find_packages, setup

setup(
    name="GitHub",
    version="0.0.1",
    packages=find_packages(),
    package_data={
        "GitHub": [
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

