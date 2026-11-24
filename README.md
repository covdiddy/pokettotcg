# Pokémon TCG — Team Rocket & Neo Expansion (ROM Hack / Disassembly)

Progetto basato sulla decompilazione di **Pokémon Trading Card Game** ([pret/poketcg](https://github.com/pret/poketcg)), esteso con le carte dei set **Team Rocket** e **Neo** (fino a 547 carte totali).

## Modifiche principali implementate

- **Set Team Rocket (66 nuove carte):** Aggiunte tutte le 66 carte del set Team Rocket (`src/data/cards_rocket.asm`), complete di grafica 2bpp/PNG, testi, statistiche, attacchi ed effetti personalizzati.
- **Set Neo (Neo Genesis, Neo Revelation, Neo Destiny):** Integrazione delle carte Neo (`src/data/cards_neo_1.asm`, `src/data/cards_neo_2.asm`, `src/gfx/cards/neo/`, `src/text/text_neo_*.asm`).
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

## Repository, distribuzioni e risorse utilizzate

- **Disassembly di base:** [pret/poketcg](https://github.com/pret/poketcg) — codice sorgente originale decompilato di Pokémon Trading Card Game (GBC).
- **Distribuzione / espansione Neo:** [RealCataclyptic/Pokemon-TCG-Neo](https://github.com/RealCataclyptic/Pokemon-TCG-Neo) — set *Neo Genesis*, *Neo Revelation* e *Neo Destiny* (dati e liste carte in `tools/neo_genesis_cards.json`, `tools/neo_revelation_cards.json`, `tools/neo_destiny_cards.json`).
- **Distribuzione / set Team Rocket:** [pret/poketcg2](https://github.com/pret/poketcg2) e [pkmncards.com — Team Rocket](https://pkmncards.com/set/team-rocket/) (elenco e artwork estratti tramite `tools/download_rocket_cards.py`, `tools/team_rocket_cards.json`, `tools/generate_rocket_cards_gfx.py` e `tools/generate_rocket_assets.py`).
- **Sorgente immagini e scansioni carte:** [pkmncards.com](https://pkmncards.com/) (utilizzato per le grafiche dei set Team Rocket e Neo).
- **Toolchain di assemblaggio:** [RGBDS](https://github.com/gbdev/rgbds) (inclusa in `tools/rgbds/bin`).
