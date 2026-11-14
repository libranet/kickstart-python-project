
# gh - GitHub CLI


# list all labels in this repo
[group: 'gh']
gh-label-list:
    gh label list


# add a label to this repo
[group: 'gh']
gh-label-add name color="#0075ca" description="":
    gh label create "{{name}}" --color "{{color}}" --description "{{description}}"


# remove a label from this repo
[group: 'gh']
gh-label-remove name:
    gh label delete "{{name}}" --yes


# rename a label in this repo
[group: 'gh']
gh-label-rename old_name new_name:
    gh label edit "{{old_name}}" --name "{{new_name}}"

