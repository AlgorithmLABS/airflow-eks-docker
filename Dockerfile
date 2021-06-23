FROM apache/airflow:2.0.2-python3.7

LABEL version="1.0.0"

RUN pip install --user pytest

RUN pip install --user google-cloud-bigquery==2.6.2

RUN pip install --upgrade apache-airflow-providers-google

RUN pip install --upgrade apache-airflow-providers-sftp apache-airflow-providers-slack apache-airflow-providers-http apache-airflow-providers-ssh apache-airflow-providers-amazon


COPY dags/ ${AIRFLOW_HOME}/dags
COPY unittests.cfg ${AIRFLOW_HOME}/unittests.cfg
COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg
COPY unittests/ ${AIRFLOW_HOME}/unittests
COPY integrationtests ${AIRFLOW_HOME}/integrationtests

