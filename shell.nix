{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Python with data science packages
    (python3.withPackages (ps: with ps; [
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
      
      # Additional useful packages
      plotly
      scikit-learn
      statsmodels
      
      # Development tools
      black
      flake8
      pytest
    ]))
    
    # Additional system tools
    git
  ];
  
  shellHook = ''
    echo "🔬 Data Science Environment Ready!"
    echo "📊 Available packages:"
    echo "  • pandas, numpy, scipy"
    echo "  • matplotlib, seaborn, plotly" 
    echo "  • jupyter, jupyterlab"
    echo "  • scikit-learn, statsmodels"
    echo ""
    echo "🚀 Quick start:"
    echo "  jupyter lab                 # Start JupyterLab"
    echo "  jupyter notebook            # Start Jupyter Notebook"
    echo "  python eta_agent_analysis.py # Run analysis script"
    echo ""
    
    # Set up Python path for current directory
    export PYTHONPATH="$PWD:$PYTHONPATH"
    
    # Create .jupyter directory if it doesn't exist
    mkdir -p ~/.jupyter
  '';
}