# Removendo no sound null safety

## Acertos para remover o no sound null safety

Abra o .vscode\launch.json
e remova a config vmAdditionalArgs

```json
"vmAdditionalArgs": ["--no-sound-null-safety"]
```