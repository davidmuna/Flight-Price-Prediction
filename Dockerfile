FROM python:3.10-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apk --no-cache add \
    build-base \
    openblas-dev \
    lapack-dev \
    gfortran
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
RUN apk del build-base \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*
COPY . .
CMD ["flask", "run"]