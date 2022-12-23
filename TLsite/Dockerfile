FROM python:3.8-alpine3.13
ENV PYTHONUNBUFFERED 1
COPY .. /TLsite
COPY requirements.txt /requirements.txt
COPY ./scripts /scripts

WORKDIR /TLsite
EXPOSE 8000
RUN python -m venv /py && \
/py/bin/pip install --upgrade pip && \
apk add --update --no-cache postgresql-client && \
apk add --update --no-cache --virtual .tmp-deps \
    build-base postgresql-dev musl-dev linux-headers && \
/py/bin/pip install -r /requirements.txt && \
apk del .tmp-deps && \
adduser --disabled-password --no-create-home TLsite_user && \
mkdir -p /vol/web/static && \
mkdir -p /vol/web/media && \
chown -R root:root /vol && \
chmod -R 775 /vol && \
chmod -R +x /scripts

ENV PATH="/scripts:/py/bin:$PATH"

USER root

CMD ["run.sh"]