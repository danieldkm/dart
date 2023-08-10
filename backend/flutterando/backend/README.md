A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# 1. Subir docker e rodar

subir banco

```bash
docker compose up -d
```

criar build da imagem docker

```bash
docker build -t dart-server .
```

rodar

```bash
docker run -it --rm -p 4466:4466 --name backend-api dart-server
```

# 2. Instalar as dependencias
# 3. Rodar projeto
# 4. Build