# Pokémon TCG — Team Rocket & Neo Expansion (ROM Hack / Disassembly)

Progetto basato sulla decompilazione di **Pokémon Trading Card Game** ([pret/poketcg](https://github.com/pret/poketcg)), esteso con le carte dei set **Team Rocket** e **Neo** fino a **547 carte totali**.

## Modifiche principali implementate

- **Set Team Rocket (66 nuove carte):** Aggiunte tutte le 66 carte del set Team Rocket (`src/data/cards_rocket.asm`), complete di grafica 2bpp/PNG, testi, statistiche, attacchi ed effetti personalizzati.
- **Set Neo (Neo Genesis, Neo Revelation, Neo Destiny):** Integrazione delle carte Neo (`src/data/cards_neo_1.asm`, `src/data/cards_neo_2.asm`, `src/gfx/cards/neo/`, `src/text/text_neo_*.asm`).
- **Espansione ROM da 1 MB a 2 MB & Refactor 16-bit:** Ristrutturazione dell'architettura di memoria e banking per superare il limite originale di 1 MB e 255 carte (dettagli tecnici sotto).
- **Nuovo 5° Booster Pack:** Aggiunto un quinto booster pack dedicato alle carte del set Team Rocket (con relativa grafica, tabelle di probabilità e integrazione nei menu/ricompense).
- **3 nuovi avversari Team Rocket nei Club:** Inseriti 3 nuovi sfidanti Team Rocket all'interno dei Club, con deck dedicati, dialoghi e ricompense.

---

## Architettura tecnica: Espansione 2 MB e Refactor a 16-bit

### 1. Espansione della ROM da 1 MB a 2 MB (MBC5 ROM Banking)
La ROM originale di *Pokémon TCG* occupa **1 MB** (`64` banchi da 16 KB: `ROM0` + `ROMX $01`–`$3F`). Per ospitare le nuove definizioni delle carte, i tileset 2bpp, i banchi di testo aggiuntivi e gli handler degli effetti, la ROM è stata espansa a **2 MB** (`128` banchi da 16 KB: `ROM0` + `ROMX $01`–`$7F`) sfruttando il mapper **MBC5+RAM+BATTERY** (configurato in `Makefile` con `rgbfix -m MBC5+RAM+BATTERY -p 0xff -r 03`).

Il linker script (`src/layout.link`) alloca in modo dedicato i nuovi banchi oltre il limite originale del primo megabyte:
- **`ROMX $3c–$3e`** (`Card Gfx Rocket 1–3`): grafica 2bpp delle 66 carte del set Team Rocket.
- **`ROMX $40–$41`** (`Cards Neo 1–2`): strutture dati delle carte Neo.
- **`ROMX $42–$4d`** (`Card Gfx Neo 1–12`): grafica 2bpp delle carte Neo.
- **`ROMX $4e–$54`** (`Text 1b`, `Text Neo 1–6`): banchi di testo estesi per nomi, descrizioni e dialoghi.
- **`ROMX $55–$56`** (`Neo Effects 1–2`): logica ed effetti custom delle carte Neo.
- **`ROMX $57–$7f`**: banchi liberi residui disponibili per future espansioni.

### 2. Refactor completo degli ID carta da 8-bit a 16-bit
Nel codice originale ogni carta era identificata da un singolo byte (`8-bit`, `$01`–`$FF` con `$00` = `NULL`), imponendo un tetto massimo di **255 carte**. Con **547 carte** (`NUM_CARDS` in `src/constants/card_constants.asm`), l'intero sistema di indirizzamento è stato migrato a **16-bit (`dw`)**:
- **Definizioni e tabelle carte:** ogni record carta (`src/data/cards.asm`, `src/data/cards_rocket.asm`, `src/data/cards_neo_1.asm`, `src/data/cards_neo_2.asm`) memorizza il proprio ID su 2 byte (`dw`) e la tabella `CardPointers` gestisce l'indicizzazione sull'intero spazio 16-bit.
- **Strutture Deck in WRAM/SRAM:** nella macro `deck_struct` (`src/macros/wram.asm`), il buffer `Cards` è stato raddoppiato da `DECK_SIZE` a `DECK_SIZE * 2` byte (`120` byte per mazzo da 60 carte) per tutti i deck attivi (`sDeck1–sDeck4`) e salvati (`sSavedDeck1–sSavedDeck20` in `src/sram.asm`), così come nei buffer di duello e mano/campo in WRAM.
- **Collezione in SRAM:** `CARD_COLLECTION_SIZE` (`src/constants/card_data_constants.asm`) è stato esteso a `$200` in `sCardCollection` (`src/sram.asm`) per tracciare il conteggio e il flag `CARD_NOT_OWNED` sull'intero catalogo esteso, distribuendo lo stato di salvataggio su `SRAM $00–$03`.
- **Motore di duello, AI, Menu e Booster:** tutte le routine di lookup delle carte, confronto ID, gestione del deck builder, apertura booster pack e logica AI sono state aggiornate per passare e manipolare gli ID carta su coppie di registri a 16 bit (`de` / `bc` / `hl`) al posto del singolo registro `a` a 8 bit.

---

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
