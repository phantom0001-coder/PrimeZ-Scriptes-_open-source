# PrimeZ-Scriptes- (open source)

Roblox utility scripts by phantom0001-coder.

## LOCUS v2.1 - behavior audit / source-recovery tool

Runs a protected script (or its loader) inside an instrumented environment and records everything it touches:

- every global read/write (counted, with first-write value previews)
- every loadstring/load source dumped verbatim to workspace/locus/ (full source recovery, stage by stage)
- HTTP capture: request, http_request, syn.request, http.get/post, game:HttpGet/HttpGetAsync/HttpPost/HttpPostAsync, HttpService:GetAsync/PostAsync
- remote capture: FireServer/InvokeServer with remote path + first-arg preview
- leak scanner: urls / discord webhooks / hwid / fingerprint strings in dumped sources
- detection report: silent abort with zero activity = possible anti-instrumentation detection
- GUI launcher: enter URL or paste source, toggle OFFLINE, press EXECUTE AUDIT, watch the live pipe log

### Loadstring (repo must be PUBLIC for this to work)

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/phantom0001-coder/PrimeZ-Scriptes-_open-source/main/locus.lua"))()
```

### Usage

1. Run the loadstring in your executor (Xeno, Delta, Synapse Z, or any UNC executor). The LOCUS GUI opens.
2. SOURCE MODE: URL -> enter the loader URL, or SOURCE MODE: TEXT -> paste the script.
3. Keep OFFLINE on for the first run (fake responses, no real requests).
4. Press EXECUTE AUDIT. Output streams into the GUI log; dumps land in workspace/locus/.

### Files written

- target.lua - the fetched/pasted target
- loadstring_NN.lua - every source that passed through loadstring/load
- _http_log.txt - full HTTP transcript
- _remotes.txt - remote call log
- _summary.txt - the audit summary

Intended for auditing obfuscated outputs you own (Vykus/PolSec-style) and inspecting untrusted loaders before trusting them.
