update-helm-docs:
	helm-docs -t README.md.gotmpl -t README_CONFIG.md.gotmpl -t README_CHANGELOG.md.gotmpl --output-file README.md

push-chart:
	helm cm-push . thejohnsons
