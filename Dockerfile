# استخدم صورة أساسية تدعم Python و ffmpeg
FROM python:3.10-slim

# تثبيت أدوات النظام المطلوبة
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    gcc \
    libsm6 \
    libxext6 \
    && apt-get clean

# إعداد مجلد العمل
WORKDIR /app

# نسخ جميع ملفات المشروع
COPY . .

# إنشاء بيئة افتراضية وتثبيت المتطلبات
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# فتح المنفذ 8000
EXPOSE 8000

# أمر التشغيل
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
