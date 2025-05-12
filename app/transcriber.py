import whisper
from pytube import YouTube
import os
import uuid

def download_audio(video_url):
    yt = YouTube(video_url)
    stream = yt.streams.filter(only_audio=True).first()
    filename = f"static/audio_{uuid.uuid4().hex}.mp4"
    stream.download(filename=filename)
    return filename

def transcribe_audio(video_url):
    audio_path = download_audio(video_url)
    model = whisper.load_model("base")
    result = model.transcribe(audio_path)
    return result['text'], audio_path
