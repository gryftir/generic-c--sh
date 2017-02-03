# Installation

Assumes gnu sed, on Mac Os X you can install with  

````bash
brew install gnu-sed --with-default-names
```

add the following to your .bashrc, with the path replaced appropriately, and source it

```bash
#generates a basic c makefile from a generic version
make_c() {
    ${PATH_OF_GENERIC}/./generic.sh $1
    if [[ -z "$1" ]]; then
      echo "usage make_c [foldername]"
    else
      cd $1
    fi
}
```bash
