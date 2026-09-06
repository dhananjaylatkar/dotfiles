#!/usr/bin/env python

import os
import yaml
import re
from datetime import datetime
import sys
import subprocess

class m2e:
    def __init__(self, fname):
        self.fpath = os.path.abspath(fname)
        self.fcontents = []
        self.issue_month = None
        self.out_fname = None
        self.metadata = {
            "identifier": [{"scheme": "DOI", "text": "doi:10.234234.234/33"}],
            "publisher": "The Caravan",
        }

        if not os.path.exists(self.fpath):
            raise ValueError(f"'{self.fpath}' does not exists")

        if not self.fpath.endswith(".md"):
            raise ValueError("only markdown files are supported")

        self.issue_month = os.path.basename(os.path.dirname(self.fpath))

        # self.out_dir = os.path.join(os.path.dirname(self.fpath), "out")
        self.out_dir = os.path.join(os.getcwd(), "epubs", self.issue_month.replace(" ", "_"))
        os.makedirs(self.out_dir, exist_ok=True)

    def __get_collection(self):
        return f"The Caravan ({self.issue_month})"

    def __fetch_contents(self):
        with open(self.fpath, "r") as file:
            self.fcontents = file.readlines()[:15]

    def __get_tile(self):
        main = None
        sub = None

        for l in self.fcontents:
            if l.startswith("# "):
                main = l[2:].rstrip()
            elif l.startswith("## "):
                sub = l[3:].rstrip()

        if not main:
            raise ValueError("could not get title")

        if main == "Editor's Pick":
            sub = self.issue_month

        if sub:
            self.out_fname = f"{self.__get_group_position():02d} {main}: {sub}"

            return [
                {"type": "main", "text": main},
                {"type": "subtitle", "text": sub}
            ]

        self.out_fname = f"{self.__get_group_position():02d} {main}"

        return [
            {"type": "main", "text": main},
        ]

    def __get_creators(self):
        author_ln = None
        creators = []

        for l in self.fcontents:
            if not "https://caravanmagazine.in/author" in l:
                continue
            author_ln = l.rstrip()
            break

        if not author_ln:
            print(f"using default author for {self.fpath}")
            creators.append({"role": "author", "text": "The Caravan"})
        else:
            authors = re.findall(r"\[([^\]]*)\]", author_ln)
            for author in authors:
                creators.append({"role": "author", "text": author})

        return creators

    def __get_date(self):
        fmt = "%d %B, %Y"

        for l in self.fcontents:
            try:
                dt = datetime.strptime(l.rstrip(), fmt)
                return dt.strftime("%Y-%m-%d")
            except ValueError:
                continue

        raise ValueError("could not find date")

    def __get_group_position(self):
        fname = os.path.basename(self.fpath)
        return int(fname.split()[0])

    def __get_metadata_fname(self):
        return os.path.join(self.out_dir, f"{self.out_fname}.yaml")

    def __get_out_fname(self):
        return os.path.join(self.out_dir, f"{self.out_fname}.epub")

    def generate_metadata(self):
        self.__fetch_contents()
        self.metadata["belongs-to-collection"] = self.__get_collection()
        self.metadata["group-position"] = self.__get_group_position()
        self.metadata["title"] = self.__get_tile()
        self.metadata["creator"] = self.__get_creators()
        self.metadata["date"] = self.__get_date()

        with open(self.__get_metadata_fname(), "w", encoding="utf-8") as f:
            yaml.safe_dump(self.metadata, f, sort_keys=False)

    def create_epub(self):
        self.generate_metadata()
        cmd = ["pandoc", "-o", self.__get_out_fname(), "--metadata-file", self.__get_metadata_fname(), self.fpath]
        # print(cmd)
        subprocess.run(cmd, cwd=os.path.dirname(self.fpath), check=True)


if __name__ == "__main__":
    articles = sys.argv[1:]
    for article in articles:
        m2e(article).create_epub()
