import argparse
import runpy
import shutil
from pathlib import Path


OUTPUTS = [
    "bbxx.txt",
    "bbxx.m3u",
    "bbxx_lite.txt",
    "bbxx_lite.m3u",
    "others_output.txt",
    "tiyu.html",
    "dead_sources.txt",
]


def run_pipeline():
    # Execute main.py in the current process
    runpy.run_module("main", run_name="__main__")
    dist_dir = Path("dist")
    dist_dir.mkdir(exist_ok=True)
    for name in OUTPUTS:
        src = Path(name)
        if src.exists():
            shutil.copy2(src, dist_dir / src.name)


def main():
    parser = argparse.ArgumentParser(description="IPTV pipeline runner")
    parser.add_argument("command", nargs="?", default="run", help="use: run")
    args = parser.parse_args()
    if args.command != "run":
        parser.error("unknown command (use: run)")
    run_pipeline()


if __name__ == "__main__":
    main()
