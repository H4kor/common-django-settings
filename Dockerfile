FROM python:3.10

# Expose ports
EXPOSE 8000

WORKDIR /app

# Install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY . /app

RUN python manage.py collectstatic --noinput

CMD ["daphne", "fun_facts.asgi:application", "--bind", "0.0.0.0", "--port", "8000"]