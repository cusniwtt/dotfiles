#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: Create"
    echo "     : $0 create [-n|--name] <conda_env_name> [-py|--python] <python_version>"
    echo "Usage: Remove"
    echo "     : $0 remove [-n|--name] <conda_env_name>"
    exit 1
}

# Default values
action=""
conda_env_name=""
python_version=""

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        create|remove)
            action="$1"
            ;;
        -n|--name)
            shift
            conda_env_name="$1"
            ;;
        -py|--python)
            shift
            python_version="$1"
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Invalid argument: $1"
            usage
            ;;
    esac
    shift
done

# Check if required arguments are provided
if [ -z "$action" ] || [ -z "$conda_env_name" ]; then
    echo "Both action and conda environment name are required."
    usage
fi

# Function to create a new conda environment
create_conda_env() {
    # Initialize conda for the shell
    eval "$(conda shell.bash hook)"

    # Create a new conda environment with the specified name and Python version
    conda create --name "$conda_env_name" python="$python_version" -y

    # Activate the new conda environment
    conda activate "$conda_env_name"

    # Install ipykernel in the active conda environment
    conda install ipykernel -y

    # Get the name of the active conda environment
    env_name="$(basename "$CONDA_PREFIX")"

    # Register the conda environment as a Jupyter kernel
    python -m ipykernel install --user --name="$env_name"

    # Display a message indicating success
    echo "Conda environment '$env_name' with Python $python_version has been created, and ipykernel has been added as a Jupyter kernel."
}

# Function to remove an existing conda environment
remove_conda_env() {
    # Initialize conda for the shell
    eval "$(conda shell.bash hook)"

    # Get the name of the active conda environment
    current_env_name="$(basename "$CONDA_PREFIX")"

    # Check if the current environment is not the base environment
    if [ "$current_env_name" != "base" ]; then
        # Deactivate the conda environment if it's not the base environment
        conda deactivate
    fi

    # Remove the conda environment
    conda env remove --name "$conda_env_name" -y

    # Uninstall ipykernel only within the removed conda environment
    #conda uninstall -y ipykernel
    rm -rf ~/.local/share/jupyter/kernels/"$conda_env_name"
    echo "Remove kernel config from ~/.local/share/jupyter/kernels/"$conda_env_name" successfull"

    # Display a message indicating success
    echo "Conda environment '$conda_env_name' has been removed, and ipykernel has been uninstalled within the environment."
}

# Perform the specified action
case "$action" in
    create)
        create_conda_env
        ;;
    remove)
        remove_conda_env
        ;;
    *)
        echo "Invalid action: $action"
        usage
        ;;
esac
