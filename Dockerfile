# 베이스 이미지를 명시합니다.
FROM node:alpine as builder

# 작업경로 설정
WORKDIR /usr/src/app

# 패키지 파일 복사
COPY package.json ./

# 추가로 필요한 파일들을 내려 받습니다.
RUN npm install

# 전체 파일 복사
COPY ./ ./

# 컨테이너 빌드
RUN npm run build

# RUN STAGE
FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

