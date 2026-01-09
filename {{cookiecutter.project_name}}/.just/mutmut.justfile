# mutmut


# install mutmut
[group: 'mutmut']
mutmut-install:
    uv add mutmut

alias install-mutmut := mutmut-install


# display version of mutmut
[group: 'mutmut']
mutmut-version:
	mutmut --version


# display help for mutmut
[group: 'mutmut']
mutmut-help:
	mutmut --help


# run mutmut
[group: 'mutmut']
mutmut-run *args:
	mutmut run {{args}}


# browse mutmut results
[group: 'mutmut']
mutmut-browse *args:
    mutmut browse {{args}}


# show mutmut results
[group: 'mutmut']
mutmut-results *args:
    mutmut results {{args}}


# apply mutant by name
[group: 'mutmut']
mutmut-apply name="" *args:
    mutmut apply {{name}} {{args}}


# test specific mutant by name
[group: 'mutmut']
mutmut-test-for-mutant name="" *args:
    mutmut tests-for-mutant {{name}} {{args}}

alias mutmut-test := mutmut-test-for-mutant