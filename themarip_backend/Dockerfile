# ---- Build stage ----
    FROM dart:stable AS build
    WORKDIR /app
    
    # 1. Copy pubspec first and fetch deps
    COPY pubspec.* ./
    RUN dart pub get
    
    # 2. Copy the rest of the project BUT .dart_tool is ignored via .dockerignore
    COPY . .
    
    # 3. Regenerate package config to match container paths (fast, uses cache)
    RUN dart pub get --offline
    
    # 4. Compile to native executable
    RUN dart compile exe bin/server.dart -o /server
    
    # ---- Runtime stage ----
    FROM debian:bullseye-slim
    COPY --from=build /runtime/ /
    COPY --from=build /server /server
    ENV PORT=8080
    CMD ["/server"]
    