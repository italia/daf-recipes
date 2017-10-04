FROM jupyterhub/jupyterhub

#POSTGRES DB PACKAGE
RUN apt-get update && \
    apt-get install -y \
        libpq-dev \
        npm \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && pip install psycopg2 \
 && apt-get install postgresql-client -y

# ADD LDAP AUTH PACKAGE
RUN pip install jupyterhub-ldapauthenticator
RUN pip install jupyterhub-ldapcreateusers


# Install Spark Magic library
RUN pip install sparkmagic

# Configure user home directory permission
COPY /ubuntuconfig /etc

# Init script spark magic
ADD ./sparkmagic-init.sh /
ADD ./wait_db_is_ready.sh /
RUN chmod +x /sparkmagic-init.sh
RUN chmod +x /wait_db_is_ready.sh

# ADD LOCAL ADMIN USER
RUN useradd -m -G shadow -p $(openssl passwd -1 admin) admin
RUN chown admin .

#Configure sparkmagic json file
COPY /sparkmagicconfig /etc/skel

#Install notebook
RUN pip install notebook

#EXPOSE 8000
#ENTRYPOINT ["jupyterhub"]

USER root
