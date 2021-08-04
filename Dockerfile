FROM python:3.8
ENV PYTHONUNBUFFERED=1
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
RUN python manage.py collectstatic
EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/python"]
CMD ["-m", "gunicorn", "config.wsgi", "-b", "0.0.0.0:8000"]