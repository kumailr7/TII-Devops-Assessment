### MakeFile for Terraform -- Minikube Infrastrcture ########
TERRAFORM=terraform
TF_DIR=terraform-minikube
PLAN_FILE=tfplan

all: init plan apply export
# Targets
init:
	@echo "Initializing Terraform..."
	$(TERRAFORM) -chdir=$(TF_DIR) init

plan:
	@echo "Generating execution plan..."
	$(TERRAFORM) -chdir=$(TF_DIR) plan -out=$(PLAN_FILE) --var-file=dev.tfvars 

apply:
	@echo "Applying changes..."
	$(TERRAFORM) -chdir=$(TF_DIR) apply --var-file=dev.tfvars --auto-approve

destroy:
	@echo "Destroying resources..."
	$(TERRAFORM) -chdir=$(TF_DIR) destroy --var-file=dev.tfvars --auto-approve

# export:
# 	@echo "Exporting kubeconfig..."
# 	$(TERRAFORM) -chdir=$(TF_DIR) output -raw kubeconfig > kubeconfig

clean:
	@echo "Cleaning up plan file..."
	rm -f $(TF_DIR)/$(PLAN_FILE) 

# Help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  init     - Initialize Terraform configuration"
	@echo "  plan     - Generate and save an execution plan"
	@echo "  apply    - Apply the saved plan"
	@echo "  clean    - Remove the generated plan file"
	@echo "  help     - Display this help message"
