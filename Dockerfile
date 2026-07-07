FROM python:3.10-slim

WORKDIR /app

# ติดตั้งไลบรารีระบบที่ OpenCV จำเป็นต้องใช้ในการรันบน Linux
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# สั่งรันโดยรองรับ PORT แบบยืดหยุ่นของ Render
CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-10000}"]
