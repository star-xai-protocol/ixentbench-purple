# 1. Base Image
FROM python:3.12-slim

# 2. Configuración de entorno
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
# Añadimos curl por si acaso el Leaderboard quiere hacer healthcheck
RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

# 3. Directorio de trabajo
WORKDIR /app

# 4. Dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Código del Agente
COPY purple_ai.py .

# 6. EXPOSE (Informativo, pero ayuda al Leaderboard a saber qué puerto usas por defecto)
EXPOSE 9009

# 7. EL COMANDO ROBUSTO (Estilo "Example 3")
# ENTRYPOINT: Define "QUÉ" se ejecuta (siempre es python y tu script)
# El flag "-u" es vital para ver los logs en tiempo real.
ENTRYPOINT ["python", "-u", "purple_ai.py"]

# CMD: Define "CÓMO" se ejecuta por defecto (Argumentos)
# El Leaderboard sustituirá ESTA línea con sus propios argumentos,
# pero respetará el ENTRYPOINT de arriba.
CMD ["--host", "0.0.0.0", "--port", "9009"]
