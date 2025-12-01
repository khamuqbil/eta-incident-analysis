{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Python with requirement packages
    (python3.withPackages (
      ps: with ps; [
        # Core data science stack
        pandas
        numpy
        scipy
        matplotlib
        seaborn

        # Jupyter ecosystem
        jupyter
        jupyterlab
        notebook
        ipython
        ipykernel

        # Additional packages
        plotly
        scikit-learn
        statsmodels

        # Development tools
        black
        flake8
        pytest
      ]
    ))
  ];

  shellHook = ''
    echo "Environment Ready ..."

    # Set up Python path for current directory
    export PYTHONPATH="$PWD:$PYTHONPATH"

    # Create .jupyter directory if it doesn't exist
    mkdir -p ~/.jupyter
  '';
}

