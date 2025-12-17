# AGENTS.md — IPTV Pipeline

## Project Goal
This repository is an IPTV pipeline project.
Its sole purpose is to collect IPTV sources, clean and filter them,
and generate stable IPv4-playable `.m3u` / `.txt` channel lists.

This is NOT a general toolset, NOT a player, NOT an AI demo project.

## Core Pipeline
Input sources
→ cleaning
→ filtering
→ sorting
→ output `.m3u` / `.txt`

## Core Files (DO NOT RESTRUCTURE)
- main.py        # main pipeline entry
- filter.py      # filtering rules
- utils/         # helpers only
- output/        # generated m3u/txt results
- assets/snapshot/  # source snapshot archive

## Output Contract
- Output files must remain `.m3u` / `.txt`
- Filenames follow existing conventions
- Main outputs must stay playable by common IPTV players

## Hard Constraints
- IPv6 sources are NOT allowed
- Do NOT add UI, database, or player logic
- Do NOT refactor project structure without explicit instruction
- All changes must be incremental on existing pipeline

## Environment & Run
- Python 3.10+, install deps via `pip install -r requirements.txt` (use venv).
- Run pipeline locally: `python3 -m iptv run` or `bash run.sh` (needs network; produces bbxx*.m3u/txt, others_output.txt, tiyu.html, dead_sources.txt; copies to dist/).
- Optional health check: `./test_sources.sh bbxx.txt` (requires ffprobe; only http/https allowed).

## CI Expectation
CI runs the pipeline and produces:
1. Latest playable IPTV lists
2. Snapshot archive of input sources for rollback/debugging
