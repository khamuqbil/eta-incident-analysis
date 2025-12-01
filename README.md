## Incident Summary

**Report Date:** November 8, 2025.
**Incident Date:** November 6, 2025 - 19:10 UTC (22:10 Local).
**Data Source:** The original dataset was collected from raw logs in `time.txt` and `time6.txt`. It has been cleaned _normalizing fields_ and time ordered into `datasets/cleaned_eta_logs.csv`.

---

## Report Overview

**Reported Issue:** System slowness and timeout conditions observed starting at 22:10 Local Time (19:10 UTC)

**Investigation Scope:**

- **Investigation Period:** 21:00 Local → End of available data
- **Incident Window:** 22:10 → 04:39 Local (6.5 hours)
- **Total Transactions Analyzed:** 30,818+ transactions
- **Data Sources:** Clean, validated logs from time6.txt and time.txt

**Full Report:** [eta_analysis.ipynb](./eta_analysis.ipynb)

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
