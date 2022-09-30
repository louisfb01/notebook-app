FROM jupyter/tensorflow-notebook:36d857bb0121
RUN pip install lxml
RUN jupyter notebook --generate-config -y
RUN echo 'c.NotebookApp.token = ""' >> /home/jovyan/.jupyter/jupyter_notebook_config.py
EXPOSE 8888