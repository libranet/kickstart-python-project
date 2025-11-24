# mutmut


# install mutmut
[group: 'mutmut']
[unix]
mutmut-install:
    uv ad mutmut

alias install-mutmut := mutmut-install


# display version of mutmut
[group: 'mutmut']
[unix]
mutmut-version:
	mutmut --version


# display help for mutmut
[group: 'mutmut']
[unix]
mutmut-help:
	mutmut --help


# run mutmut
[group: 'mutmut']
[unix]
mutmut-run:
	mutmut run


# browse mutmut results
[group: 'mutmut']
[unix]
mutmut-browse:
    mutmut browse


# show mutmut results
[group: 'mutmut']
[unix]
mutmut-results:
    mutmut results


# apply mutant by name
[group: 'mutmut']
[unix]
mutmut-apply name="":
    mutmut apply {{name}}


# test specific mutant by name
[group: 'mutmut']
[unix]
mutmut-test-for-mutant name="":
    mutmut tests-for-mutant {{name}}

alias mutmut-test := mutmut-test-for-mutant