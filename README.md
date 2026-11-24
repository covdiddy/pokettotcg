# Pokémon TCG — Team Rocket Expansion (ROM Hack / Disassembly)

Progetto basato sulla decompilazione di **Pokémon Trading Card Game** ([pret/poketcg](https://github.com/pret/poketcg)), esteso con nuovi contenuti, carte ed espansioni.

## Modifiche principali implementate

- **Set Team Rocket (66 nuove carte):** Aggiunte tutte le 66 carte del set Team Rocket, complete di grafica 2bpp/PNG, testi, statistiche, attacchi ed effetti personalizzati.
- **Refactor a 16-bit degli ID carta:** Estensione del sistema di identificazione delle carte da 8-bit a 16-bit per superare il limite originale di 255 carte e supportare l'espansione del card pool.
- **Nuovo 5° Booster Pack:** Aggiunto un quinto booster pack dedicato alle carte del set Team Rocket (con relativa grafica, tabelle di probabilità e integrazione nei menu/ricompense).
- **3 nuovi avversari Team Rocket nei Club:** Inseriti 3 nuovi sfidanti Team Rocket all'interno dei Club, con deck dedicati, dialoghi e ricompense.

## Compilazione della ROM

Il repository include la toolchain `rgbds` precompilata in `tools/rgbds/bin`. Per compilare la ROM (`poketcg.gbc`) dalla root del progetto:

```bash
PATH="$PWD/tools/rgbds/bin:$PATH" make tcg
```

Al termine della compilazione verrà generato il file `poketcg.gbc` nella directory principale.

Per pulire i file intermedi e di build:

```bash
make clean
```

## Crediti e riferimenti

- Basato sulla disassembly originale: [pret/poketcg](https://github.com/pret/poketcg)
- Toolchain: [RGBDS](https://github.com/gbdev/rgbds)
