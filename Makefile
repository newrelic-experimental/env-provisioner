PROJDIR := $(realpath $(CURDIR))
TERRAFORM_DIR := terraform
ENVS_DIR := environments
ANSIBLE_CAOS := ansible/caos-ansible-roles

SAMPLES = $(shell basename -a $(wildcard $(addprefix $(PROJDIR)/, $(TERRAFORM_DIR))/*))

# TODO: Handle basename error if environments dir is empty
ENVS = $(shell basename -a $(wildcard $(addprefix $(PROJDIR)/, $(ENVS_DIR))/*) 2> /dev/null)


.DEFAULT_GOAL := default
default:
	@echo No default target defined

format:
	@terraform fmt \
		-write=true \
		-recursive
deps:
	git submodule update --init
	@for role in $(shell find ${ANSIBLE_CAOS} -maxdepth 1 -type d -not -path '*/.*' | tail -n +2 ); do cd $${role}; [ -f requirements.yml ] && ansible-galaxy install --roles-path ../../ -r requirements.yml; cd ../; done

define make-new-env
  new-$1:
	@cp -r $(TERRAFORM_DIR)/$1 $(ENVS_DIR)
	@echo "New environment created $(ENVS_DIR)/$1"
endef

define make-init-env
  init-$1:
	@terraform -chdir=$(ENVS_DIR)/$1 init
endef

define make-apply-env
  apply-$1:
	@terraform -chdir=$(ENVS_DIR)/$1 apply
endef

define make-destroy-env
  destroy-$1:
	@terraform -chdir=$(ENVS_DIR)/$1 destroy
endef

$(foreach element,$(SAMPLES),$(eval $(call make-new-env,$(element))))
$(foreach element,$(ENVS),$(eval $(call make-init-env,$(element))))
$(foreach element,$(ENVS),$(eval $(call make-apply-env,$(element))))
$(foreach element,$(ENVS),$(eval $(call make-destroy-env,$(element))))
