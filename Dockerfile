# استخدم صورة Python أساسية
FROM python:3.12-slim

# إعداد العمل داخل الحاوية
WORKDIR /app

# نسخ متطلبات الحزم
COPY requirements.txt .

# تثبيت الحزم
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي الملفات
COPY . .

# تحديد المنفذ
EXPOSE 8000

# الأمر لتشغيل التطبيق
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
