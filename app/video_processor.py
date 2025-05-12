import os
from moviepy.editor import VideoFileClip

def process_video(video_path, clip_duration=15):
    clips = []
    video = VideoFileClip(video_path)
    total_duration = int(video.duration)
    output_dir = "static/clips"
    os.makedirs(output_dir, exist_ok=True)

    for i in range(0, total_duration, clip_duration):
        end_time = min(i + clip_duration, total_duration)
        clip = video.subclip(i, end_time)
        output_path = os.path.join(output_dir, f"clip_{i//clip_duration + 1}.mp4")
        clip.write_videofile(output_path, codec="libx264", audio_codec="aac")
        clips.append(f"/static/clips/clip_{i//clip_duration + 1}.mp4")

    return clips
