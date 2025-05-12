from fastapi import FastAPI, Form, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from app.transcriber import transcribe_audio
from app.translator import translate_text
from app.video_processor import process_video

# إنشاء تطبيق FastAPI
app = FastAPI()

# تحميل الملفات الثابتة مثل الصور والفيديوهات
app.mount("/static", StaticFiles(directory="static"), name="static")

# الصفحة الرئيسية التي تعرض HTML
@app.get("/", response_class=HTMLResponse)
def read_root():
    with open("static/index.html", "r", encoding="utf-8") as f:
        return HTMLResponse(f.read())

# معالج POST لاستقبال رابط الفيديو ومعالجته
@app.post("/process", response_class=HTMLResponse)
async def process_video_url(request: Request, url: str = Form(...), language: str = Form("en")):
    transcription, audio_path = transcribe_audio(url)  # تفريغ الصوت
    translation = translate_text(transcription, language)  # ترجمة النص
    clips = process_video(audio_path)  # تقسيم الفيديو

    return HTMLResponse(f"""
        <h2>Transcription:</h2><pre>{transcription}</pre>
        <h2>Translation ({language}):</h2><pre>{translation}</pre>
        <h2>Video Clips:</h2>
        <ul>{"".join([f"<li><a href='{clip}' target='_blank'>Clip {i+1}</a></li>" for i, clip in enumerate(clips)])}</ul>
    """)
