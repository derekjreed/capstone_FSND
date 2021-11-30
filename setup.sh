#!/usr/bin/env bash

# Script to setup test environment for postman

# Linux shell env for flask
export FLASK_ENV='development'
export FLASK_APP='app'

# Python/flask drop/create database tables and create dummy data
flask shell << EOF
from models import setup_db, Actor, Movie, db_create_all, db_drop_and_create_all, create_dummy_data
db_drop_and_create_all()
create_dummy_data()
EOF

# Tokens for each test account
export CASTING_ASSISTANT='Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InJiUWVkd1ZMdE5EaVlxWHQwcS1sYyJ9.eyJpc3MiOiJodHRwczovL2Rldi1yYTQxYnV2YS5ldS5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjFhNDAzMTE1NDRmYzMwMDZkNWY2NmI4IiwiYXVkIjoiY2Fwc3RvbmUiLCJpYXQiOjE2MzgxODQ4MDMsImV4cCI6MTYzODI3MTIwMywiYXpwIjoiV0Z0ZmpJR1ZHMzVUTmRuamxFaXFEb1F3MWs3c1dmRjMiLCJzY29wZSI6IiIsInBlcm1pc3Npb25zIjpbImdldDphY3RvcnMiLCJnZXQ6bW92aWVzIl19.R1dApQFJqxj44h9Bbiapt9SfWOCPk5SdXqBbh7m1v7p7_Hm9F0URobOhQRtcZQHpCg440oN4UYAyET-Gus4Yap14IkClUMzSmHnf5HkYR-HWDDncsIC4HDdcMP9BeFPZAUIvcGjy_PzUP9Ab_KH6EXjdYwd_d95eXc7rIMhKeoro_PDolj3cxCSWPOIP_hykXCoeuBpdD8nGYzMYD64GWlyYK-oF8STw1IwUBSjgX1a5vALfLOcFN6bhTbBmOaFXhJdT8HAoJWwoAFsr6yFrvcKF9_ykcHPAYqn1EsKXnPuBpP6DmdwaIH7zIpWuR0p7oHYUIMAnQaZxuJ_kjNvPHQ'
export CASTING_DIRECTOR='Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InJiUWVkd1ZMdE5EaVlxWHQwcS1sYyJ9.eyJpc3MiOiJodHRwczovL2Rldi1yYTQxYnV2YS5ldS5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjFhNDAzNDFhYzBiOGEwMDY4MGFhYzk3IiwiYXVkIjoiY2Fwc3RvbmUiLCJpYXQiOjE2MzgxODQ5MjEsImV4cCI6MTYzODI3MTMyMSwiYXpwIjoiV0Z0ZmpJR1ZHMzVUTmRuamxFaXFEb1F3MWs3c1dmRjMiLCJzY29wZSI6IiIsInBlcm1pc3Npb25zIjpbImRlbGV0ZTphY3RvcnMiLCJnZXQ6YWN0b3JzIiwiZ2V0Om1vdmllcyIsInBhdGNoOmFjdG9ycyIsInBhdGNoOm1vdmllcyIsInBvc3Q6YWN0b3JzIl19.pMccQUVz7KsQotd533lBZtJTpnVFl9LIq1peaKMVarlQfhHZ4MvQpTqWroTUBNwzXRUzRDge2WDJs26ip3pUCFhqQOpwzatfM24yXM_Fm3amixS882d4Jxhzz1eBNdxVTufEhahuQ7ZDy6zTduHd-GT9vP7rnEAqWX38JVSQP-rbBIE7EDgrUajisAOEJ8Pl4AC2YaOnzkEPIvhkVewmqic7zujX2AAJTFAa4jtQ3RsjXSXCRr31xugkUby_2dO0a4PPb05juob3HluNM_s0f8pRYexLGJY1I686uD1eQAlbPVU-S8PREZzBTDKtyD4AS9sHv2S0AzdKN0cukk99YQ'
export EXECUTIVE_PRODUCER='Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InJiUWVkd1ZMdE5EaVlxWHQwcS1sYyJ9.eyJpc3MiOiJodHRwczovL2Rldi1yYTQxYnV2YS5ldS5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjFhNDAzNjU2YmQwOGEwMDcwYjYwZmM4IiwiYXVkIjoiY2Fwc3RvbmUiLCJpYXQiOjE2MzgxODUwOTgsImV4cCI6MTYzODI3MTQ5OCwiYXpwIjoiV0Z0ZmpJR1ZHMzVUTmRuamxFaXFEb1F3MWs3c1dmRjMiLCJzY29wZSI6IiIsInBlcm1pc3Npb25zIjpbImRlbGV0ZTphY3RvcnMiLCJkZWxldGU6bW92aWVzIiwiZ2V0OmFjdG9ycyIsImdldDptb3ZpZXMiLCJwYXRjaDphY3RvcnMiLCJwYXRjaDptb3ZpZXMiLCJwb3N0OmFjdG9ycyIsInBvc3Q6bW92aWVzIl19.izbAzg0S3vchFKmYOvP1RJXoIyAmQlIIrvMSqmAAt6-ncPNLnSfkM1BACtTrCuKFPfgsItfHiujTAjNGsBunGifT-_a2jwlcYCZ7JVG8f5o4ZT_6h2-J00sW7ZNcIPIGxnvGub6u4Gyr8z7JNXqDXZBvVr3Ks6Zon0WT1_cWVrIdHhF2Slt_T1gMUpBoW81fGWljB58U8Kv0m6lyroS_zsju-kOaQZ_WPj2Opcw3dPF0pxdNCtH9sNkNBvASCbw6gr5BJdUNB_qqlnG4YPle6KMOyMmNCCDMkqfPM0OXeKGuVOtqtY6r4O7jY0wDzSf6ilFID5I_gngGzV8NpV9mtg'

