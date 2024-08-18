
FROM takeyamajp/ubuntu-sshd:ubuntu22.04

# Пароль для рут
ENV ROOT_PASSWORD root


# установка зависимостей
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y nano python3 python3-pip supervisor software-properties-common postgresql postgresql-client postgresql-contrib mc
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt



# здесь задается структура БД
COPY struct.sql struct.sql





RUN echo "host all  all    0.0.0.0/0  trust" >> /etc/postgresql/14/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/14/main/postgresql.conf




USER postgres
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER dbmaster WITH SUPERUSER PASSWORD 'dbmaster';" &&\
    createdb -O dbmaster menergo &&\
    psql menergo < struct.sql
    





#RUN echo "host all  all    0.0.0.0/0  trust" >> /etc/postgresql/14/main/pg_hba.conf
#RUN echo "listen_addresses='*'" >> /etc/postgresql/14/main/postgresql.conf
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
COPY psql.sh /usr/local/bin/psql.sh

#8000 - порт для веб сервиса fastapi
EXPOSE 22 5432 8000
USER root
CMD ["/usr/bin/supervisord"]
