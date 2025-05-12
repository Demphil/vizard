# استخدم صورة أساسية من Python
FROM python:3.12-slim

# إعداد دليل العمل
WORKDIR /app

# نسخ ملف متطلبات الحزم
COPY requirements.txt .

# تثبيت الحزم
RUN pip install --no-cache-dir -r requirements.txt

# نسخ جميع الملفات في المجلد
COPY . .

# تحديد المنفذ الذي سيستمع عليه التطبيق
EXPOSE 8000

# الأمر لتشغيل التطبيق
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
