# Assembly_WorkShop



## Étape 1

- Exécutez la commande suivante pour rendre le script exécutable :
  ```bash
  chmod +x compile64
  ```
- Copiez le script dans `/usr/local/bin` pour qu'il soit disponible globalement :
  ```bash
  sudo cp compile64 /usr/local/bin
  ```
- Rechargez :
    ```bash
    source ~./bashrc
    ```

## Étape 2

Pour compiler un fichier assembleur dans le répertoire courant, utilisez la commande suivante :
```bash
compile64 fichier.asm
```

Si la commande échoue, essayez avec :
```bash
./compile64 fichier.asm
```
<br>

# Cours et explication de l'Assembleur

## Template


Le minimum requis pour un programme asm x86 fonctionnel se trouve dans le fichier source `template.asm` à la racine du repo. 

## Pourquoi répéter l'instruction `mov rax, 0` ?

Dans les programmes en assembleur utilisant la convention **System V AMD64 ABI** (x86_64), le registre **`rax`** doit être mis à **0** avant chaque appel aux fonctions comme **`printf`** ou **`scanf`** pour indiquer qu'il n'y a pas d'arguments flottants à passer.

Si **`rax`** contient une valeur différente de zéro, les fonctions pourraient chercher des arguments flottants qui n'existent pas, causant des comportements inattendus. Répéter **`mov rax, 0`** est donc nécessaire pour ces appels.
Cela garantit le bon fonctionnement des fonctions sans arguments flottants.

## Directives `define` en assembleur NASM

Les directives `define` en NASM sont utilisées pour réserver de l'espace en mémoire pour des données de tailles spécifiques. Voici un récapitulatif des principales directives utilisées pour définir des variables de différentes tailles :

| Directive | Taille (bits) | Taille (octets) | Description                            |
|-----------|----------------|----------------|----------------------------------------|
| **db**    | 8 bits         | 1 octet        | Définit un octet                       |
| **dw**    | 16 bits        | 2 octets       | Définit un mot (word)                  |
| **dd**    | 32 bits        | 4 octets       | Définit un double mot (double word)    |
| **dq**    | 64 bits        | 8 octets       | Définit un quadruple mot (quad word)   |
| **dt**    | 128 bits       | 16 octets      | Définit un double quadruple mot        |

### Utilisation :

- **`db`** : Utilisé pour définir des octets ou des chaînes de caractères.
  - Exemple : `message db "Hello", 0`
- **`dw`** : Utilisé pour des valeurs sur 16 bits.
  - Exemple : `value dw 1234`
- **`dd`** : Utilisé pour des valeurs sur 32 bits.
  - Exemple : `number dd 100000`
- **`dq`** : Utilisé pour des valeurs sur 64 bits.
  - Exemple : `large_number dq 123456789012345`
- **`dt`** : Utilisé pour des valeurs sur 128 bits.
  - Exemple : `huge_value dt 0x123456789ABCDEF0123456789ABCDEF0`

---

## Registres sur l'architecture x86_64

Ce tableau récapitule les registres principaux sur l'architecture x86_64 et leurs sous-parties. Chaque registre peut être utilisé pour manipuler des données de différentes tailles (64 bits, 32 bits, 16 bits, 8 bits).

| Registre  | 64 bits | 32 bits | 16 bits | 8 bits (Haut) | 8 bits (Bas) |
|-----------|---------|---------|---------|---------------|--------------|
| **RAX**   | rax     | eax     | ax      | ah            | al           |
| **RBX**   | rbx     | ebx     | bx      | bh            | bl           |
| **RCX**   | rcx     | ecx     | cx      | ch            | cl           |
| **RDX**   | rdx     | edx     | dx      | dh            | dl           |
| **RSI**   | rsi     | esi     | si      | -             | sil          |
| **RDI**   | rdi     | edi     | di      | -             | dil          |
| **R8**    | r8      | r8d     | r8w     | -             | r8b          |
| **R9**    | r9      | r9d     | r9w     | -             | r9b          |
| **R10**   | r10     | r10d    | r10w    | -             | r10b         |
| **R11**   | r11     | r11d    | r11w    | -             | r11b         |
| **R12**   | r12     | r12d    | r12w    | -             | r12b         |
| **R13**   | r13     | r13d    | r13w    | -             | r13b         |
| **R14**   | r14     | r14d    | r14w    | -             | r14b         |
| **R15**   | r15     | r15d    | r15w    | -             | r15b         |

### Explication des tailles :
- **64 bits** : Utilisé pour manipuler des valeurs 64 bits. Exemple : `mov rax, 1234567890123456`.
- **32 bits** : Pour des opérations sur 32 bits. Exemple : `mov eax, 123456`.
- **16 bits** : Pour des valeurs sur 16 bits. Exemple : `mov ax, 1234`.
- **8 bits (Haut)** : Les registres 8 bits de la partie haute (ex. `ah`, `bh`, `ch`, `dh`).
- **8 bits (Bas)** : Les registres 8 bits de la partie basse (ex. `al`, `bl`, `cl`, `dl`).

---
