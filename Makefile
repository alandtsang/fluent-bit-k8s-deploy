
.PHONY: all
all: install delete

###########
# Install #
###########

.PHONY: install
install:
	kubectl apply -f fluentbit/

##########
# Delete #
##########

.PHONY: delete
delete:
	kubectl delete -f fluentbit/
