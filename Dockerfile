# استخدم صورة رسمية تعتمد على Python
FROM python:3.12-slim

# إعداد مجلد العمل داخل الحاوية
WORKDIR /app

# نسخ ملفات المشروع
COPY . /app

# تثبيت المتطلبات
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# فتح المنفذ 8080 (Fly.io يستعمله)
EXPOSE 8080

# تشغيل التطبيق باستخدام Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
