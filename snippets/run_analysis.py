#!/usr/bin/env python3
"""
ETA Agent Incident Analysis - Automated Execution
Run the complete analysis pipeline with clean data
"""

import subprocess
import sys
import os
from pathlib import Path

def run_notebook(notebook_path, output_format='html'):
    """Execute a Jupyter notebook and save output"""
    try:
        print(f"🔄 Executing {notebook_path}...")
        
        # Convert notebook to the specified format and execute
        cmd = [
            'jupyter', 'nbconvert', 
            '--to', output_format,
            '--execute',
            '--ExecutePreprocessor.timeout=600',  # 10 minute timeout
            notebook_path
        ]
        
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        print(f"✅ Successfully executed {notebook_path}")
        return True
        
    except subprocess.CalledProcessError as e:
        print(f"❌ Error executing {notebook_path}:")
        print(f"   {e.stderr}")
        return False

def main():
    """Main analysis execution pipeline"""
    print("🚀 ETA Agent Incident Analysis - Pipeline Execution")
    print("=" * 60)
    
    # Change to the notebook directory
    os.chdir('/home/khamuqbil/note/nic-duty/reports/jupyter')
    
    # Check if required files exist
    required_files = ['time6.txt', 'time.txt']
    missing_files = [f for f in required_files if not Path(f).exists()]
    
    if missing_files:
        print(f"❌ Missing required files: {', '.join(missing_files)}")
        print("   Please ensure the log files are in the current directory.")
        return False
    
    print(f"✅ Required log files found: {', '.join(required_files)}")
    
    # Step 1: Data Cleaning
    print(f"\n📊 STEP 1: Data Cleaning & Validation")
    print("-" * 40)
    
    if not run_notebook('data_cleaning.ipynb'):
        print("❌ Data cleaning failed. Stopping pipeline.")
        return False
    
    # Check if clean dataset was created
    if not Path('cleaned_eta_logs.csv').exists():
        print("❌ Clean dataset not created. Check data_cleaning.ipynb output.")
        return False
    
    print("✅ Clean dataset created: cleaned_eta_logs.csv")
    
    # Step 2: Final Analysis
    print(f"\n📈 STEP 2: Comprehensive Incident Analysis")
    print("-" * 40)
    
    if not run_notebook('final_incident_analysis_clean.ipynb'):
        print("❌ Final analysis failed. Check notebook output.")
        return False
    
    # Step 3: Generate Summary
    print(f"\n📋 STEP 3: Analysis Complete")
    print("-" * 40)
    
    # List generated outputs
    output_files = []
    for ext in ['.html', '.csv']:
        for notebook in ['data_cleaning', 'final_incident_analysis_clean']:
            output_file = f"{notebook}{ext}"
            if Path(output_file).exists():
                output_files.append(output_file)
    
    if 'cleaned_eta_logs.csv' in os.listdir('.'):
        output_files.append('cleaned_eta_logs.csv')
    
    print(f"✅ Generated output files:")
    for output_file in output_files:
        file_size = Path(output_file).stat().st_size / 1024  # KB
        print(f"   📄 {output_file} ({file_size:.1f} KB)")
    
    print(f"\n🎉 INCIDENT ANALYSIS PIPELINE COMPLETE!")
    print(f"📊 Ready for review and technical deep-dive")
    
    return True

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)