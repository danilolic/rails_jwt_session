# frozen_string_literal: true

JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = SecureRandom.base64(48)
JWTSessions.access_exp_time = 3600 # 1 hour in seconds
JWTSessions.refresh_exp_time = 604_800 # 1 week in seconds
JWTSessions.jwt_options.leeway = 30 # seconds
