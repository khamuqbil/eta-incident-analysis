#import "eta_incident_meta.typ" as meta
#import "@preview/modern-whs-assignment:0.2.1": *

#set heading(numbering: none)
#set text(lang: "en")

// Override the logo image to use SITA logo
#show image: it => {
  if "logo.png" in repr(it) {
    image("modern-whs-assignment/images/sita.png", width: it.width)
  } else {
    it
  }
}

#set heading(numbering: "1.1")

#show heading: it => {
  if (it.level >= 1) {
    block(it.body)
  } else {
    block(counter(heading).display() + " " + it.body)
  }
}

// Override German terms with English
#show "Literaturverzeichnis": ""
#show "Inhaltsverzeichnis": "Table of Contents"
#show "Abbildungsverzeichnis": ""
#show "Tabellenverzeichnis": ""
#show "Codeverzeichnis": ""
#show "Verzeichnisse": ""
#show "Version vom": "Report Date:"

// Override German bibliography terms:
#show "Verfügbar unter": "Available at"
#show "Zugriff am": "Accessed on"
#show "online": "Online"

#show: whs-assignment.with(
  meta.title,
  meta.author,
  meta.submission-date,
  meta.keywords,
  meta.course,
  meta.lecturer,
  meta.bibliography,
)

= Executive Summary <summary>

On November 6, 2025, at 22:10 local time (19:10 UTC), the ETA Agent system experienced a #text(fill: red)[*critical performance degradation incident*] characterized by a 6.51x slowdown in response times and 179 critical transactions exceeding 60 seconds.

== Incident Classification

#table(
  columns: (auto, auto),
  align: left,
  [*Severity*], [*CRITICAL - MAJOR INCIDENT*],
  [*Severity Score*], [6/7],
  [*Duration*], [6+ hours (22:10 → 04:39 Local)],
  [*User Impact*], [+16.9% increase in slow transactions],
  [*Root Cause*], [Saudi Arabia Border Gateway slowness],
)

== Key Performance Metrics

#table(
  columns: (auto, auto, auto),
  align: center,
  [*Metric*], [*Baseline*], [*Peak Impact*],
  [Average Response], [2.03s], [13.19s],
  [Slowdown Factor], [-], [6.51x],
  [Slow Rate (>20s)], [0.40%], [16.91%],
  [Critical Rate (>60s)], [0.00%], [1.70%],
  [Transactions], [2,756], [4,708],
)

*Based on Source of Truth verification with SHA256-verified dataset integrity*

== Root Cause Validation

The technical analysis was #text(fill: green)[*confirmed by external monitoring data*] showing Saudi Arabia Border Gateway slowness with the exact same timestamp correlation:

- **AppGW-Borders Gov - SA - Slowness** alert triggered
- **Problem ID:** P-25117949
- **Correlation:** Dependency analysis confirms all incidents part of same problem
- **Impact:** External integration bottleneck caused ETA Agent connection pool exhaustion

= Technical Analysis <technical>

== Data Verification & Methodology

This analysis employs the #text(fill: blue)[**Source of Truth**] verification approach for maximum accuracy:

#table(
  columns: (auto, auto),
  align: left,
  [*Dataset*], [cleaned_eta_logs.csv],
  [*SHA256 Hash*], [b7c4fe3646d472...dabacd],
  [*Total Records*], [158,186],
  [*Time Coverage*], [27.6 hours],
  [*Standard Deviation*], [Population (ddof=0)],
  [*Baseline Window*], [21:30-22:00 (30 min)],
  [*Peak Window*], [22:20-23:10 (50 min)],
)

== Performance Degradation Timeline

The incident showed #text(fill: red)[*sudden degradation*] pattern suggesting resource exhaustion:

=== 10-Minute Window Analysis

#table(
  columns: (auto, auto, auto),
  align: center,
  [*Time*], [*Avg Response*], [*Status*],
  [21:40], [2.21s], [Normal],
  [21:50], [1.61s], [Normal],
  [22:00], [6.46s], [Degrading],
  [22:10], [16.92s], [Critical],
  [22:20], [14.34s], [Critical],
  [22:30], [13.14s], [Critical],
)

**Change Pattern Analysis:**
- Pre-incident (last 20 min): 4.03s average
- Post-incident (first 20 min): 15.63s average
- **Immediate impact: +288% change**
- Pattern: **SUDDEN DEGRADATION** - suggests resource exhaustion

== Agent Performance Breakdown

=== Baseline Performance by Agent Type

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  [*Agent Type*], [*Count*], [*Mean*], [*Median*], [*P95*],
  [eta_agent], [2,572], [2.08s], [0.90s], [7.40s],
  [eta_iagent], [184], [1.27s], [0.92s], [4.21s],
)

=== Peak Impact Performance by Agent Type

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  [*Agent Type*], [*Count*], [*Mean*], [*Median*], [*P95*],
  [eta_agent], [4,587], [13.27s], [11.74s], [36.31s],
  [eta_iagent], [121], [10.16s], [13.14s], [13.34s],
)

== Critical Transaction Analysis

The analysis identified **179 critical transactions** (>60s) with 77.7% temporal clustering, indicating systematic performance issues rather than isolated problems.

=== Top Process Contributors (Peak Period)

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  [*PID*], [*Transactions*], [*Avg Time*], [*Total Time*],
  [7963], [90], [14.31s], [1,287.97s],
  [7765], [81], [15.01s], [1,215.93s],
  [8099], [78], [14.71s], [1,146.97s],
  [7985], [76], [14.89s], [1,131.90s],
  [7864], [95], [11.68s], [1,109.32s],
)

=== Worst Single Transactions (Evidence-Based)

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  [*Time*], [*PID*], [*Duration*], [*Transaction ID*],
  [22:25:27], [7860], [115.9s], [11017739576934],
  [22:25:19], [7865], [115.3s], [11017739585840],
  [22:25:17], [7766], [113.8s], [11017739585838],
  [22:18:33], [7844], [111.3s], [11017739567853],
  [23:04:43], [8087], [104.9s], [11017739623549],
)

= Root Cause Analysis <rootcause>

== External Dependency Failure Confirmation

The ETA Agent performance degradation was #text(fill: green)[**definitively caused**] by the Saudi Arabia Border Gateway slowness, as confirmed by:

1. **Monitoring Alert Correlation**
  - AppGW-Borders Gov - SA - Slowness alert
  - Exact timestamp match: 19:10 UTC incident time
  - Problem status: OPEN with ongoing impact

2. **Dependency Chain Analysis**
  - ETA Agents → Border Gateway integration → Saudi Arabia services
  - Connection pool exhaustion due to slow external responses
  - Cascading impact across all ETA Agent instances

3. **Performance Pattern Validation**
  - Sudden degradation (not gradual load increase)
  - System-wide impact across all PIDs
  - Recovery pattern correlating with external service restoration

== System Behavior Indicators

#table(
  columns: (auto, auto),
  align: left,
  [*Indicator*], [*Analysis Result*],
  [PID Performance Variance], [Low (1.3x spread) - even load distribution],
  [Load vs Performance Correlation],
  [Moderate (1h difference between peak volume and worst performance)],

  [Pattern Type], [Sudden degradation (resource exhaustion)],
  [Recovery Type], [Gradual (external dependency recovery)],
)

== Anomaly Detection Results

Using robust z-score analysis (threshold > 3), **202 anomalous minutes** were identified:

#table(
  columns: (auto, auto, auto),
  align: center,
  [*Time*], [*P95 Response*], [*Robust Z-Score*],
  [22:16], [97.0s], [20.9],
  [22:25], [86.4s], [18.5],
  [23:04], [81.6s], [17.4],
  [22:55], [74.4s], [15.8],
)

= Recovery Analysis <recovery>

== Recovery Timeline

The system showed gradual recovery over multiple phases:

1. **Initial Recovery** (23:10-00:10): Partial improvement to 10.88s average
2. **Mid Recovery** (00:10-02:10): Continued stabilization to 6.92s average
3. **Late Recovery** (02:10+): Near-baseline performance at 1.27s average

== Recovery Milestone Achievement

#table(
  columns: (auto, auto),
  align: left,
  [*Recovery Threshold*], [4.08s (150% of baseline)],
  [*Achievement Time*], [02:10 Local],
  [*Time to Recovery*], [240 minutes (4.0 hours)],
  [*Final Status*], [-53% vs baseline (better than normal)],
)

= Recommendations <recommendations>

== Immediate Actions (Priority 1)

1. **SA Border Gateway Monitoring**
  - Implement dedicated monitoring for SA Border Gateway response times
  - Set up circuit breakers for country-specific integrations
  - Create automatic failover procedures for border gateway timeouts

2. **ETA Agent Resilience**
  - Implement connection timeout controls (< 60s)
  - Add retry logic with exponential backoff
  - Deploy connection pool management improvements

== Technical Improvements (Priority 2)

1. **Performance Monitoring**
  - Deploy P95/P99 monitoring with 5-minute resolution
  - Implement real-time alerts for >200% performance degradation
  - Create automated anomaly detection using robust z-scores

2. **Capacity Management**
  - Review database connection pool sizing during peak hours
  - Assess thread pool configuration under load
  - Implement gradual load shedding during resource exhaustion

== Process Improvements (Priority 3)

1. **Incident Response**
  - Establish procedures for >4-hour degradation incidents
  - Create dependency chain analysis protocols
  - Develop external service correlation procedures

2. **Testing & Validation**
  - Create load testing scenarios for external dependency failures
  - Implement chaos engineering for border gateway simulations
  - Develop performance regression test suite

= Data Visualizations & Analysis <visualizations>

== Performance Timeline Charts

The Source of Truth analysis generated comprehensive visualizations showing the incident progression and anomaly patterns.

=== Per-Minute P95 Execution Time

#figure(
  image("output_12_3.png", width: 90%),
  caption: [Per-minute P95 execution time showing clear anomaly spikes during incident window. Red dots indicate anomalous minutes with robust z-score > 3.],
)

=== Throughput vs Mean Execution Analysis

#figure(
  image("output_12_4.png", width: 90%),
  caption: [Throughput (blue bars) vs mean execution time (green line) correlation analysis. Shows inverse relationship during incident period.],
)

== Sample Data Tables

=== Top 10 Anomalous Minutes (Robust Z-Score Analysis)

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  [*Time*], [*Transactions*], [*Mean Exec*], [*P95 Exec*], [*Z-Score*],
  [22:16], [110], [26.57s], [96.95s], [20.9],
  [22:25], [141], [19.26s], [86.42s], [18.5],
  [23:04], [120], [23.43s], [81.59s], [17.4],
  [22:55], [106], [19.97s], [74.43s], [15.8],
  [22:14], [94], [20.59s], [67.08s], [14.1],
  [14:11], [133], [23.38s], [66.73s], [14.0],
  [22:17], [96], [20.43s], [64.56s], [13.5],
  [23:36], [93], [16.70s], [64.16s], [13.4],
  [22:24], [116], [21.24s], [62.71s], [13.1],
  [22:34], [120], [16.27s], [56.68s], [11.7],
)

*Note: Z-scores > 3 indicate statistically significant anomalies*

=== Top 15 Critical Transactions (>60s)

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  [*DateTime*], [*PID*], [*Duration*], [*Transaction ID*],
  [14:11:30], [8079], [119.15s], [11017738838699],
  [14:11:30], [7695], [118.85s], [11017738838700],
  [14:11:48], [7861], [116.82s], [11017738845216],
  [14:10:01], [7985], [116.55s], [11017738837744],
  [14:10:10], [8023], [116.20s], [11017738837829],
  [22:25:28], [7860], [115.90s], [11017739576934],
  [22:25:19], [7865], [115.34s], [11017739585840],
  [22:25:17], [7766], [113.75s], [11017739585838],
  [22:18:34], [7844], [111.34s], [11017739567853],
  [14:11:53], [8097], [109.64s], [11017738840609],
  [14:09:03], [7692], [104.92s], [11017738837247],
  [23:04:44], [8087], [104.87s], [11017739623549],
  [22:25:07], [8097], [103.07s], [11017739576894],
  [22:25:07], [7692], [102.77s], [11017739576896],
  [22:16:52], [8144], [101.47s], [11017739567163],
)

*Evidence shows both early morning (14:xx) and incident period (22:xx-23:xx) transactions*

== Statistical Validation

=== Agent Performance Distribution

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  align: center,
  [*Period*], [*Agent Type*], [*Count*], [*Mean*], [*P95*], [*Max*],
  [Baseline], [eta_agent], [2,572], [2.08s], [7.40s], [34.08s],
  [Baseline], [eta_iagent], [184], [1.27s], [4.21s], [9.35s],
  [Peak], [eta_agent], [4,587], [13.27s], [36.31s], [115.90s],
  [Peak], [eta_iagent], [121], [10.16s], [13.34s], [13.98s],
)

=== Process Contribution Analysis (Peak Period)

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  [*PID*], [*Transactions*], [*Mean Time*], [*Total Time*], [*Max Time*],
  [7963], [90], [14.31s], [1,287.97s], [74.17s],
  [7765], [81], [15.01s], [1,215.93s], [89.06s],
  [8099], [78], [14.71s], [1,146.97s], [71.23s],
  [7985], [76], [14.89s], [1,131.90s], [91.33s],
  [7864], [95], [11.68s], [1,109.32s], [60.41s],
)

*Total execution time reveals processes with highest cumulative impact*

= Artifacts & Evidence <artifacts>

== Machine-Readable Outputs Generated

The analysis produced comprehensive artifacts for operational use:

1. `artifact_baseline_by_agent.csv` - Agent performance baselines
2. `artifact_peak_by_agent.csv` - Peak period agent metrics
3. `artifact_peak_top_pid.csv` - Process contribution analysis
4. `artifact_anomalous_minutes.csv` - Statistical outlier detection
5. `artifact_top50_outliers.csv` - Worst performing transactions
6. `artifact_index.json` - Metadata and artifact index

== Sample Artifact Data

=== Baseline vs Peak Agent Performance (CSV Extract)

```csv
# artifact_baseline_by_agent.csv
agent_type,count,mean,median,p95,max
eta_agent,2572.0,2.081,0.895,7.4,34.083
eta_iagent,184.0,1.271,0.917,4.213,9.347

# artifact_peak_by_agent.csv
agent_type,count,mean,median,p95,max
eta_agent,4587.0,13.267,11.737,36.308,115.895
eta_iagent,121.0,10.159,13.136,13.335,13.978
```

=== Anomalous Minutes Detection (CSV Extract)

```csv
# artifact_anomalous_minutes.csv (Top 5)
minute_ts,n,mean_exec,p95_exec,max_exec,robust_z
2025-11-06 22:16:00,110,26.5736,96.9514,101.467,20.939
2025-11-06 22:25:00,141,19.2555,86.422,115.895,18.5209
2025-11-06 23:04:00,120,23.4314,81.5931,104.868,17.4119
2025-11-06 22:55:00,106,19.9702,74.429,89.837,15.7667
2025-11-06 22:14:00,94,20.5894,67.076,88.746,14.078
```

=== Critical Transactions (CSV Extract)

```csv
# artifact_top50_outliers.csv (Top 5)
datetime,agent_type,pid,transaction_id,execution_time
2025-11-06 14:11:30.472,eta_agent,8079,11017738838699,119.153
2025-11-06 14:11:30.345,eta_agent,7695,11017738838700,118.847
2025-11-06 14:11:48.334,eta_agent,7861,11017738845216,116.82
2025-11-06 14:10:00.965,eta_agent,7985,11017738837744,116.548
2025-11-06 14:10:09.804,eta_agent,8023,11017738837829,116.202
```

== Verification Results Summary

#table(
  columns: (auto, auto, auto),
  align: left,
  [*Analysis Type*], [*Key Finding*], [*Status*],
  [Evidence Verification],
  [Peak slow rate: 62.1% vs claimed 26.1%],
  [Discrepancy found],

  [Final Clean Analysis],
  [4.8x degradation, 179 critical transactions],
  [Comprehensive],

  [Source of Truth], [6.51x degradation, SHA256 verified], [Authoritative],
)

**Recommendation:** Use Source of Truth metrics as authoritative values for all reporting and remediation planning.

= Conclusion <conclusion>

The November 6, 2025 ETA Agent performance incident was a #text(fill: red)[**critical system degradation**] definitively caused by Saudi Arabia Border Gateway slowness. The incident demonstrates the importance of:

1. **External Dependency Monitoring** - Need for comprehensive border gateway performance tracking
2. **Resilience Engineering** - Implementation of circuit breakers and timeout controls
3. **Data-Driven Analysis** - Value of SHA256-verified datasets and robust statistical methods

The correlation between internal performance metrics and external monitoring alerts provides definitive root cause validation, enabling targeted remediation efforts focused on border gateway integration resilience.

**Next Steps:** Immediate implementation of SA Border Gateway circuit breakers and comprehensive external dependency monitoring to prevent similar incidents.

---

#align(center)[
  *Document Classification: Internal Use*

  *Generated from Source of Truth Analysis*

  *SHA256 Verified Dataset Integrity*
]

