# Installation

add the following to your .bashrc and source it

```bash
#generates a basic c makefile from a generic version
make_c() {
    /home/lawrence/workspace/c/generic/./generic.sh $1
    cd $1
}
```bash
