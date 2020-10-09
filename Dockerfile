FROM cirrusci/flutter:1.20.2 as builder
WORKDIR '/app'
COPY . .
RUN sudo chown -R cirrus:cirrus /app
RUN flutter config --enable-web && flutter pub get && flutter build web

FROM nginx
COPY --from=builder /app/build/web /usr/share/nginx/html