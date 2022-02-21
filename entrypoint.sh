#!/usr/bin/env bash


ACTION=""
while [[ ! "$ACTION" =~ [cdkq] ]]; do
  cat <<EOF
What can I do for you today?

c) Create a new environment
d) Deploy an existing environment
k) Destroy an existing environment
q) Quit

Enter your choice:
EOF
  read -r ACTION
done

case $ACTION in

c)
  # Select the environment to clone
  envTemplate=$(ls terraform | percol --prompt-bottom --prompt "Select the environment to trigger:")
  # Select a name for the new environment
  printf "Insert a unique name for the environment:\n"
  read -r environmentName
  if [ -d "${environmentName}" ]; then
    echo "Environment named ${ENVIRONMENT_NAME} already exists. Please select a unique name"
    exit 1
  fi
  # Clone environment
  cp -a "terraform/${envTemplate}" "environments/${environmentName}"

  printf "New environment created: %s\n" "./environments/${environmentName}"
  ;;
q)
  echo "Have a nice day!"
  exit 0
  ;;

esac

#Select the environment
if [ -z "${environmentName}" ]; then
  environmentName=$(ls "environments" | percol --prompt-bottom --prompt "Select environment:")
fi
if [ ! -f "environments/${environmentName}/caos.auto.tfvars" ]; then
  echo "Rename "environments/${environmentName}/caos.auto.tfvars.dist" to "environments/${environmentName}/caos.auto.tfvars", fill the variables and re-run command"
  exit 1
fi

make init-${environmentName}

case $ACTION in
d | c)
  echo "Installing dependencies..."
  make deps
  make apply-${environmentName}
  ;;
k)
  make destroy-${environmentName}
  echo "Do you want to delete all the files?y/[n]"
  read -r PRUNE
  if [ "${PRUNE}" == "y" ]; then
    rm -rf "environments/${environmentName}"
  fi
  ;;
esac
