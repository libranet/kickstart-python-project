
# safety


# show which safety is used
# [group: 'safety']
# safety-which:
#     @ which safety


# run safety check
[group: 'safety']
safety-check:
    uv run safety check


# run safety check with html-report
[group: 'safety']
safety-check-html:
    @ mkdir -p var/html/safety
    uv run safety check --save-html var/html/safety/safety.html

