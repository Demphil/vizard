# استخدم صورة Python أساسية خفيفة
FROM python:3.12-slim

# إعداد العمل داخل الحاوية
WORKDIR /app

# نسخ متطلبات الحزم أولاً
COPY requirements.txt .

# تثبيت الحزم في بيئة معزولة
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي الملفات
COPY . .

# تحديد المنفذ الذي سيستمع عليه التطبيق
EXPOSE 8000

# الأمر لتشغيل التطبيق باستخدام Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
