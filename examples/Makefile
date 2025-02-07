include docker.mk

.PHONY: test

test-n8n:
	docker exec $(shell docker ps --filter name='^/$(PROJECT_NAME)_n8nio' --format "{{ .ID }}") npm test