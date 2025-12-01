{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (python3.withPackages (
      ps: with ps; [
        pip
        pip
        pandas
        numpy
        scipy
        matplotlib
        seaborn
        jupyter
        jupyterlab
        notebook
        ipython
        ipykernel
        plotly
        scikit-learn
        statsmodels
        black
        flake8
        pytest
      ]
    ))
  ];

  shellHook = ''
    echo "Environment Ready ..."
    export PYTHONPATH="$PWD:$PYTHONPATH"
    mkdir -p ~/.jupyter

    # Auto-generate requirements.txt
    echo "Generating requirements.txt..."
    pip freeze > requirements.txt
    echo "requirements.txt updated."
  '';
}
