## Report Summary

This notebook is an analysis of ETA performance outputs from `datasets/cleaned_eta_logs`. The original dataset was collected from raw logs in `datasets/time.txt` and `datasets/time6.txt`. It has been cleaned (removing duplicates, normalizing fields) and time‑ordered

**Report Date:** November 8, 2025.
**Incident Date:** November 6, 2025 - 19:10 UTC (22:10 Local).
**Data Source:** `datasets/time.txt` and `datasets/time6.txt`.
**Dataset:** `datasets/cleaned_eta_logs.csv`.

---

## Report Overview

**Reported Issue:** System slowness and timeout conditions observed starting at 22:10 Local Time (19:10 UTC)

**Notebook:** [eta_analysis.ipynb](./eta_analysis.ipynb)

---

### Local Development

```bash
# Install dependencies
pip install -r requirements.txt

# Run the application
python jupyter notebook
```

### Using Nix

```bash
nix-shell --run "jupyter notebook"
```
