# Installation

add the following to your .bashrc, with the path replaced appropriately, and source it

```bash
#generates a basic c makefile from a generic version
make_c() {
    ${PATH_OF_GENERIC}./generic.sh $1
    cd $1
}
```bash