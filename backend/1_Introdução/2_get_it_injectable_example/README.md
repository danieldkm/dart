# Get_it e Injectable principais conceitos

Por enquanto o get_it é o único que funciona apenas com o dart. (01/07/2023)

```bash
flutter create --project-name=get_it_injectable_example --org br.com.moritando --platforms android,ios -i swift -a kotlin .
```

Aplicar null safet

```bash
dart migrate --apply-changes
```

Factory: Cria nova instancia toda vez que é chamado
Singleton: Cria a instancia logo após subir o app
Lazy Singleton: Cria a instancia quando chama a primeira vez


## Injectable

```bash
flutter pub run build_runner watch
```
