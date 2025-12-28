# mutmut


# install mutmut
[group: 'mutmut']
mutmut-install:
    uv ad mutmut

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
mutmut-run:
	mutmut run


# browse mutmut results
[group: 'mutmut']
mutmut-browse:
    mutmut browse


# show mutmut results
[group: 'mutmut']
mutmut-results:
    mutmut results


# apply mutant by name
[group: 'mutmut']
mutmut-apply name="":
    mutmut apply {{name}}


# test specific mutant by name
[group: 'mutmut']
mutmut-test-for-mutant name="":
    mutmut tests-for-mutant {{name}}

alias mutmut-test := mutmut-test-for-mutant