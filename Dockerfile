FROM jupyter/tensorflow-notebook:36d857bb0121

ARG CODA_NOTEBOOK_APP_AUTH_REALM=${CODA_NOTEBOOK_APP_AUTH_REALM}
ARG CODA_AUTH_SERVICE_URL=${CODA_AUTH_SERVICE_URL}
ARG CODA_HUB_API_URL=${CODA_HUB_API_URL}

ENV CODA_AUTH_SERVICE_TOKEN_ENDPOINT_URL=${CODA_AUTH_SERVICE_URL}/realms/${CODA_NOTEBOOK_APP_AUTH_REALM}/protocol/openid-connect/token
ENV CODA_HUB_API_URL=${CODA_HUB_API_URL}
ENV RESTARTABLE=yes
ENV JUPYTER_ENABLE_LAB=yes

RUN pip install lxml
RUN jupyter notebook --generate-config -y
RUN echo 'c.NotebookApp.token = ""' >> /home/jovyan/.jupyter/jupyter_notebook_config.py
EXPOSE 8888