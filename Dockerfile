# Minimal, funkar utan uv.lock
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8501

WORKDIR /app

# (Valfritt) byggverktyg för vissa wheels
RUN apt-get update && apt-get install -y --no-install-recommends build-essential \
  && rm -rf /var/lib/apt/lists/*

# Kopiera projektfiler som behövs för installation
# Viktigt: kopiera både pyproject.toml och src/ innan "pip install ."
COPY pyproject.toml /app/
COPY src/ /app/src/

# Installera beroenden definierade i pyproject (runtime, inte dev)
RUN python -m pip install --upgrade pip \
  && pip install .

# Exponera Streamlit-porten och starta appen
EXPOSE 8501
CMD ["streamlit", "run", "/app/src/webapp/app.py", "--server.port=8501", "--server.address=0.0.0.0"]
