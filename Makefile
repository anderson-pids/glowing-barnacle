TERRAFORM_SHELL_NAME=terraform-sh
TERRAGRUNT_SHELL_NAME=terragrunt-sh
PATH_USR_BIN=/usr/local/bin

# Initializing executables for terraform and terragrunt
.PHONY: init
init: init-terraform init-terragrunt
init-terraform:
	@printf 'make -C %s terraform pwd=$${PWD}' ${PWD} > ${TERRAFORM_SHELL_NAME} && chmod +xs ${TERRAFORM_SHELL_NAME}
init-terragrunt:
	@printf 'make -C %s terragrunt pwd=$${PWD}' ${PWD} > ${TERRAGRUNT_SHELL_NAME} && chmod +xs ${TERRAGRUNT_SHELL_NAME}

# Move 
.PHONY: install
install: install-terraform install-terragrunt
install-terraform:
	@mv ${TERRAFORM_SHELL_NAME} ${PATH_USR_BIN}/${TERRAFORM_SHELL_NAME}	
install-terragrunt:
	@mv ${TERRAGRUNT_SHELL_NAME} ${PATH_USR_BIN}/${TERRAGRUNT_SHELL_NAME}

.PHONY: uninstall
uninstall:
	@rm ${PATH_USR_BIN}/${TERRAFORM_SHELL_NAME} && rm ${PATH_USR_BIN}/${TERRAGRUNT_SHELL_NAME} && echo "All clean!"

# Executing docker compose files
.PHONY: terraform
terraform:
	@docker compose run --rm -v ${pwd}:/app terraform sh
.PHONY: terragrunt
terragrunt:
	@docker compose run --rm -v ${pwd}:/app terragrunt sh
