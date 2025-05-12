app = "vizard-clone"  # تأكد من أن الاسم هنا هو نفسه الذي ترغب في استخدامه في Fly.io

primary_region = "cdg"  # تغيير المنطقة إذا لزم الأمر

[build]
  dockerfile = "Dockerfile"  # تأكد من أن اسم ملف Dockerfile صحيح

[env]
  PYTHONUNBUFFERED = "1"

[experimental]
  auto_rollback = true

[[services]]
  internal_port = 8000
  protocol = "tcp"

  [[services.ports]]
    handlers = ["http"]
    port = 80

  [[services.ports]]
    handlers = ["tls", "http"]
    port = 443

  [[services.tcp_checks]]
    interval = "15s"
    timeout = "2s"
    grace_period = "5s"
    restart_limit = 0
