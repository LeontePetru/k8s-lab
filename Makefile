CLUSTER_NAME=dev

create:
	k3d cluster create --config cluster/k3d.yaml
	./bootstrap/install-argocd.sh
	kubectl apply -f apps/root-app.yaml

delete:
	k3d cluster delete $(CLUSTER_NAME)

start:
	k3d cluster start $(CLUSTER_NAME)

stop:
	k3d cluster stop $(CLUSTER_NAME)