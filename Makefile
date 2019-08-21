FLUENT_BIT_DIR ?= ./fluentbit
FLUENT_BIT_BUILD_DIR ?= ./build
FLUENT_BIT_FILES := $(shell find $(FLUENT_BIT_DIR) -name '*.yaml' | sed 's:$(FLUENT_BIT_DIR)/::g')

FLUENT_HTTP_HOST ?= zxl.test.com
FLUENT_HTTP_PORT ?= 80
#FLUENT_HTTP_HEADER ?= Authorization Bearer xxxxxx
#FLUENT_HTTP_URI  ?= /xxx/xxx

MAKE_ENV += FLUENT_HTTP_HOST FLUENT_HTTP_PORT
SHELL_EXPORT := $(foreach v,$(MAKE_ENV),$(v)='$($(v))')


.PHONY: all
all: clean deploy delete

.PHONY: clean
clean:
	@rm -rf ${FLUENT_BIT_BUILD_DIR}

.PHONY: build_dir
build_dir:
	@mkdir -p $(FLUENT_BIT_BUILD_DIR)

.PHONY: build_fluent
build_fluent: build_dir
	@for file in $(FLUENT_BIT_FILES); do \
		mkdir -p `dirname "$(FLUENT_BIT_BUILD_DIR)/$$file"` ; \
		$(SHELL_EXPORT) envsubst <$(FLUENT_BIT_DIR)/$$file >$(FLUENT_BIT_BUILD_DIR)/$$file ;\
	done


##########
# Deploy #
##########

.PHONY: deploy
deploy: build_fluent
	kubectl apply -f ${FLUENT_BIT_BUILD_DIR}

##########
# Delete #
##########

.PHONY: delete
delete:
	kubectl delete -f ${FLUENT_BIT_BUILD_DIR}
