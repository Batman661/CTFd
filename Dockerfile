FROM python:3.11-slim
WORKDIR /app
COPY . /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN mkdir -p /var/uploads
CMD ["gunicorn", "CTFd:create_app()", "-b", "0.0.0.0:8000", "-w", "9", "--threads", "4", "--timeout", "90"]
