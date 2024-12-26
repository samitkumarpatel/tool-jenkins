docker compose up -d jcac jenkins dind
sleep 30
DOCKER_TOKEN=$(curl -L -s -u user:user123 -H "Jenkins-Crumb:dac7ce5614f8cb32a6ce75153aaf2398" -X GET http://localhost:8080/computer/docker/slave-agent.jnlp | sed "s/.*<jnlp><application-desc><argument>\([a-z0-9]*\).*/\1/")
echo "############### DOCKER_TOKEN: $DOCKER_TOKEN Successfully"

TERRAFORM_TOKEN=$(curl -L -s -u user:user123 -H "Jenkins-Crumb:dac7ce5614f8cb32a6ce75153aaf2398" -X GET http://localhost:8080/computer/terraform/slave-agent.jnlp | sed "s/.*<jnlp><application-desc><argument>\([a-z0-9]*\).*/\1/")
echo "############### TERRAFORM_TOKEN: $TERRAFORM_TOKEN Successfully"

docker compose up -d docker terraform
docker compose logs -f
