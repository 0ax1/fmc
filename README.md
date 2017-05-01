# fmc

**F**ind **m**atching **c**ommits for staged changes in a Git repository.

In case the current branch is not `master`, the inspected range is given by the
common ancestor with `master` and the current branch's `HEAD`. Otherwise, all
commits of `master` are taken into account. In case no line candidates are
found, the latest commits modifying the files are returned. The number of listed
commits is limited to four.

## Install

Install: `install.sh --install` | Uninstall: `install.sh --uninstall`

## Usage

Run `fmc` within a Git repository. Output format: `<sha> <match type> <message> <author>`.
```
538445b124 |L| Commit message - Author                                  # Line match
8cad3046be |F| Another commit message - Author                          # File match
```

Fixup with interactive selection provided by [fzf](https://github.com/junegunn/fzf).
```
fmc_fix() {
    if [[ commit=`fmc | fzf | cut -d ' ' -f 1` && ! -z $commit ]]; then
        git commit --fixup=$commit
    fi
}
```

## Credit
`fmc` was inspired by: https://github.com/keis/git-fixup
