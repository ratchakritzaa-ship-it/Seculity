FROM python:3.10-slim
WORKDIR /app
COPY . .
CMD ["sh", "-c", "python -m http.server ${PORT:-10000}"]
