ps-mem-parse
======

Calculates the accumulated RAM, per app, used currently (displays TOP 5).


### Usage:

Pipe one of the script (Perl, gawk) from `ps caux`:

```
ps caux | ./psmemparse.gawk
ps caux | ./psmemparse.plx
```
