#!/bin/bash
set -xe
# 1. tomcat 사용자가 존재하는지 확인 후, 없으면 생성
if ! id "tomcat" &>/dev/null; then
    echo "🛠️ tomcat 사용자 생성 중..."
    sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
    echo "✅ tomcat 사용자 생성 완료."
else
    echo "✅ tomcat 사용자가 이미 존재합니다."
fi

# Delete the old  directory as needed.
if [ -d /usr/local/codedeployresources ]; then
    rm -rf /usr/local/codedeployresources/
fi

mkdir -vp /usr/local/codedeployresources
