FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN useradd --create-home --uid 1001 appuser

COPY --chown=appuser:appuser app/ ./app/

USER appuser

EXPOSE 8000

CMD ["python", "-m", "app.app"]
