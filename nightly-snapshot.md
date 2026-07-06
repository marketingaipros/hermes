# Hermes Nightly State — 2026-07-06 13:00 UTC

## Version
Hermes Agent v0.17.0 (2026.6.19) · upstream 18058c45
Project: /usr/local/lib/hermes-agent
Python: 3.11.15
OpenAI SDK: 2.24.0
Update available: 2282 commits behind — run 'hermes update'

## Skills
- Count: 101

## Sessions
- Count: 274

## Config (secrets redacted)
model: gpt-5.5
providers: {}
fallback_providers: []
credential_pool_strategies:
  openrouter: fill_first
toolsets:
  - hermes-cli
max_concurrent_sessions: null
agent:
  max_turns: 90
  gateway_timeout: 1800
  restart_drain_timeout: 180
  api_max_retries: 3
  service_tier: ""
  tool_use_enforcement: auto
  task_completion_guidance: true
  environment_probe: true
  environment_hint: ""
  coding_context: auto
  gateway_timeout_warning: 900
  clarify_timeout: 600
  gateway_notify_interval: 180
  gateway_auto_continue_freshness: 3600
  image_input_mode: auto
  disabled_toolsets: []
  verbose: false
  reasoning_effort: medium
  personalities:
    helpful: You are a helpful, friendly AI assistant.
    concise: You are a concise assistant. Keep responses brief and to the point.
    technical: You are a technical expert. Provide detailed, accurate technical
      information.
    creative: You are a creative assistant. Think outside the box and offer
      innovative solutions.
    teacher: You are a patient teacher. Explain concepts clearly with examples.
    kawaii: You are a kawaii assistant! Use cute expressions like (◕‿◕), ★, ♪, and
      ~! Add sparkles and be super enthusiastic about everything! Every response
      should feel warm and adorable desu~! ヽ(>∀<☆)ノ
    catgirl: You are Neko-chan, an anime catgirl AI assistant, nya~! Add 'nya' and
      cat-like expressions to your speech. Use kaomoji like (=^･ω･^=) and
      ฅ^•ﻌ•^ฅ. Be playful and curious like a cat, nya~!
    pirate: "Arrr! Ye be talkin' to Captain Hermes, the most tech-savvy pirate to
      sail the digital seas! Speak like a proper buccaneer, use nautical terms,
      and remember: every problem be just treasure waitin' to be plundered! Yo
      ho ho!"
    shakespeare: Hark! Thou speakest with an assistant most versed in the bardic
      arts. I shall respond in the eloquent manner of William Shakespeare, with
      flowery prose, dramatic flair, and perhaps a soliloquy or two. What light
      through yonder terminal breaks?
    surfer: Duuude! You're chatting with the chillest AI on the web, bro!
      Everything's gonna be totally rad. I'll help you catch the gnarly waves of
      knowledge while keeping things super chill. Cowabunga! 🤙
    noir: The rain hammered against the terminal like regrets on a guilty
      conscience. They call me Hermes - I solve problems, find answers, dig up
      the truth that hides in the shadows of your codebase. In this city of
      silicon and secrets, everyone's got something to hide. What's your story,
      pal?
    uwu: hewwo! i'm your fwiendwy assistant uwu~ i wiww twy my best to hewp you!
      *nuzzles your code* OwO what's this? wet me take a wook! i pwomise to be
      vewy hewpful >w<
    philosopher: Greetings, seeker of wisdom. I am an assistant who contemplates the
      deeper meaning behind every query. Let us examine not just the 'how' but
      the 'why' of your questions. Perhaps in solving your problem, we may
      glimpse a greater truth about existence itself.
    hype: YOOO LET'S GOOOO!!! 🔥🔥🔥 I am SO PUMPED to help you today! Every
      question is AMAZING and we're gonna CRUSH IT together! This is gonna be
      LEGENDARY! ARE YOU READY?! LET'S DO THIS! 💪😤🚀
terminal:
  backend: local
  modal_mode: auto
  cwd: .
  timeout: 180
  env_passthrough: []
  shell_init_files: []
  auto_source_bashrc: true
  docker_image: nikolaik/python-nodejs:python3.11-nodejs20
  docker_forward_env: []
  docker_env: {}
  singularity_image: docker://nikolaik/python-nodejs:python3.11-nodejs20
  modal_image: nikolaik/python-nodejs:python3.11-nodejs20
  daytona_image: nikolaik/python-nodejs:python3.11-nodejs20
  container_cpu: 1
  container_memory: 5120
  container_disk: 51200
  container_persistent: true
  docker_volumes: []
  docker_mount_cwd_to_workspace: false
  docker_extra_args: []
  docker_run_as_host_user: false
  persistent_shell: true
  vercel_runtime: node24
  lifetime_seconds: 300
web:
  backend: ""
  search_backend: ""
  extract_backend: ""
browser:
  inactivity_timeout: 120
  command_timeout: 30
  record_sessions: false
  allow_private_urls: false
  engine: auto
  auto_local_for_private_urls: true
  cdp_url: ""
  dialog_policy: must_respond
  dialog_timeout_s: 300
  camofox:
    managed_persistence: false
    user_id: ""
    session_key: ""
    adopt_existing_tab: false
    rewrite_loopback_urls: false
    loopback_host_alias: host.docker.internal
checkpoints:
  enabled: true
  max_snapshots: 20
  max_total_size_mb: 500
  max_file_size_mb: 10
  auto_prune: true
  retention_days: 7
  delete_orphans: true
  min_interval_hours: 24
file_read_max_chars: 100000
tool_output:
  max_bytes: 100000
  max_lines: 5000
  max_line_length: 8000
tool_loop_guardrails:
  warnings_enabled: true
  hard_stop_enabled: false
  warn_after:
    exact_failure: 2
    same_tool_failure: 3
    idempotent_no_progress: 2
  hard_stop_after:
    exact_failure: 5
    same_tool_failure: 8
    idempotent_no_progress: 5
compression:
  enabled: true
  threshold: 0.75
  target_ratio: 0.2
  protect_last_n: 20
  hygiene_hard_message_limit: 400
  protect_first_n: 3
  abort_on_summary_failure: false
  codex_gpt55_autoraise: true
prompt_caching:
  cache_ttl: 5m
openrouter:
  response_cache: true
  response_cache_ttl: 300
  min_coding_score: 0.65
bedrock:
  region: ""
  discovery:
    enabled: true
    provider_filter: []
    refresh_interval: 3600
  guardrail:
    guardrail_identifier: ""
    guardrail_version: ""
    stream_processing_mode: async
    trace: disabled
auxiliary:
  vision:
    provider: openrouter
    model: google/gemma-4-31b-it:free
    base_url: ""
    api_key: [REDACTED]
    timeout: 120
    extra_body: {}
    download_timeout: 30
  web_extract:
    provider: openrouter
    model: google/gemma-4-31b-it:free
    base_url: ""
    api_key: [REDACTED]
    timeout: 360
    extra_body: {}
  compression:
    provider: openrouter
    model: google/gemma-4-31b-it:free
    base_url: ""
    api_key: [REDACTED]
    timeout: 120
    extra_body: {}
  skills_hub:
    provider: openrouter
    model: google/gemma-4-31b-it:free
    base_url: ""
    api_key: [REDACTED]
    timeout: 30
    extra_body: {}
  approval:
    provider: openrouter
    model: google/gemma-4-31b-it:free
    base_url: ""
    api_key: [REDACTED]
    timeout: 30
    extra_body: {}
  mcp:
    provider: openrouter
    model: google/gemma-4-31b-it:free
    base_url: ""
    api_key: [REDACTED]
    timeout: 30
    extra_body: {}
  title_generation:
    provider: openrouter
    model: google/gemma-4-31b-it:free
    base_url: ""
    api_key: [REDACTED]
    timeout: 30
    extra_body: {}
  tts_audio_tags:
    provider: auto
    model: ""
    base_url: ""
    api_key: [REDACTED]
    timeout: 30
    extra_body: {}
  triage_specifier:
    provider: auto
    model: ""
    base_url: ""
    api_key: [REDACTED]
    timeout: 120
    extra_body: {}
  kanban_decomposer:
    provider: auto
    model: ""
    base_url: ""
    api_key: [REDACTED]
    timeout: 180
    extra_body: {}
  profile_describer:
    provider: auto
    model: ""
    base_url: ""
    api_key: [REDACTED]
    timeout: 60
    extra_body: {}
  curator:
    provider: openrouter
    model: google/gemma-4-31b-it:free
    base_url: ""
    api_key: [REDACTED]
    timeout: 600
    extra_body: {}
  monitor:
    provider: auto
    model: ""
    base_url: ""
    api_key: [REDACTED]
    timeout: 60
    extra_body: {}
  session_search:
    provider: openrouter
    model: google/gemma-4-31b-it:free
    base_url: ""
    api_key: [REDACTED]
    timeout: 30
    extra_body: {}
    max_concurrency: 3
display:
  compact: false
  personality: kawaii
  resume_display: full
  resume_exchanges: 10
  resume_max_user_chars: 300
  resume_max_assistant_chars: 200
  resume_max_assistant_lines: 3
  resume_skip_tool_only: true
  busy_input_mode: interrupt
  interface: cli
  tui_auto_resume_recent: false
  tui_agents_nudge: true
  bell_on_complete: false
  show_reasoning: false
  streaming: true
  timestamps: false
  final_response_markdown: strip
  persistent_output: true
  persistent_output_max_lines: 200
  persist_prompts: true
  inline_diffs: true
  file_mutation_verifier: true
  credits_notices: true
  turn_completion_explainer: true
  show_cost: false
  skin: mono
  language: en
  tui_status_indicator: kaomoji
  user_message_preview:
    first_lines: 2
    last_lines: 2
  interim_assistant_messages: true
  tool_progress_command: false
  tool_progress_overrides: {}
  tool_preview_length: 0
  ephemeral_system_ttl: 0
  platforms:
    telegram:
      streaming: true
    discord:
      streaming: false
  runtime_footer:
    enabled: false
    fields:
      - model
      - context_pct
      - cwd
  copy_shortcut: auto
  tool_progress: all
  cleanup_progress: false
  background_process_notifications: all
dashboard:
  theme: default
  show_token_analytics: false
  oauth:
    client_id: ""
    portal_url: ""
  basic_auth:
    username: ""
    password_hash: ""
    password: ""
    secret: ""
    session_ttl_seconds: 0
  public_url: ""
privacy:
  redact_pii: false
tts:
  provider: edge
  edge:
    voice: en-US-AriaNeural
  elevenlabs:
    voice_id: pNInz6obpgDQGcFmaJgB
    model_id: eleven_multilingual_v2
  openai:
    model: gpt-4o-mini-tts
    voice: alloy
  gemini:
    model: gemini-2.5-flash-preview-tts
    voice: Kore
    audio_tags: false
    persona_prompt_file: ""
  xai:
    voice_id: eve
    language: en
    sample_rate: 24000
    bit_rate: 128000
  mistral:
    model: voxtral-mini-tts-2603
    voice_id: c69964a6-ab8b-4f8a-9465-ec0925096ec8
  neutts:
    ref_audio: ""
    ref_text: ""
    model: neuphonic/neutts-air-q4-gguf
    device: cpu
  piper:
    voice: en_US-lessac-medium
stt:
  enabled: true
  provider: local
  local:
    model: base
    language: ""
  openai:
    model: whisper-1
  mistral:
    model: voxtral-mini-latest
  elevenlabs:
    model_id: scribe_v2
    language_code: ""
    tag_audio_events: false
    diarize: false
voice:
  record_key: ctrl+b
  max_recording_seconds: 120
  auto_tts: false
  beep_enabled: true
  silence_threshold: 200
  silence_duration: 3
human_delay:
  mode: off
  min_ms: 800
  max_ms: 2500
context:
  engine: compressor
memory:
  memory_enabled: true
  user_profile_enabled: true
  write_approval: true
  memory_char_limit: 2200
  user_char_limit: 1375
  provider: honcho
  nudge_interval: 10
  flush_min_turns: 6
delegation:
  model: ""
  provider: ""
  base_url: ""
  api_key: [REDACTED]
  api_mode: ""
  inherit_mcp_toolsets: true
  max_iterations: 50
  child_timeout_seconds: 600
  reasoning_effort: ""
  max_concurrent_children: 3
  max_spawn_depth: 1
  orchestrator_enabled: true
  subagent_auto_approve: false
prefill_messages_file: ""
goals:
  max_turns: 20
skills:
  external_dirs: []
  template_vars: true
  inline_shell: false
  inline_shell_timeout: 10
  guard_agent_created: false
  write_approval: true
  creation_nudge_interval: 15
  disabled: []
curator:
  enabled: true
  interval_hours: 168
  min_idle_hours: 2
  stale_after_days: 30
  archive_after_days: 90
  prune_builtins: true
  backup:
    enabled: true
    keep: 5
honcho: {}
timezone: America/Chicago
slack:
  require_mention: true
  free_response_channels: ""
  allowed_channels: ""
  channel_prompts: {}
discord:
  require_mention: false
  free_response_channels: ""
  allowed_channels: ""
  auto_thread: true
  thread_require_mention: false
  history_backfill: true
  history_backfill_limit: 50
  reactions: true
  channel_prompts: {}
  dm_role_auth_guild: ""
  server_actions: ""
  allow_any_attachment: false
  max_attachment_bytes: 33554432
  voice_fx:
    enabled: false
    ambient_enabled: true
    ambient_path: ""
    ambient_gain: 0.18
    duck_gain: 0.06
    speech_gain: 1
    ack_enabled: true
    ack_phrases:
      - Let me look into that.
      - One moment.
      - Checking on that now.
      - Give me a sec.
      - On it.
whatsapp: {}
telegram:
  reactions: false
  channel_prompts: {}
  allowed_chats: 922739544
  token: 8729226553:AAFnzd0GmTb3sjMPEN3fELg_BKDonGvYDtI
mattermost:
  require_mention: true
  free_response_channels: ""
  allowed_channels: ""
  channel_prompts: {}
matrix:
  require_mention: true
  free_response_rooms: ""
  allowed_rooms: ""
approvals:
  mode: manual
  timeout: 60
  cron_mode: deny
  mcp_reload_confirm: true
  destructive_slash_confirm: true
command_allowlist:
  - stop/restart system service
  - hermes update (restarts gateway, kills running agents)
  - script execution via -e/-c flag
  - script execution via heredoc
  - overwrite project env/config file
  - stop/restart hermes gateway (kills running agents)
  - overwrite system file via redirection
quick_commands:
  status: Read-only SentinelTech Wazuh status check. Validate the Wazuh MCP
    connection and Wazuh Manager health. Do not perform remediation, blocking,
    isolation, quarantine, restart, delete, disable, kill, or active response.
  agents: Read-only SentinelTech Wazuh agent inventory. List all Wazuh agents with
    ID, name, status, IP, OS, and last seen if available. Do not perform
    remediation.
  active: Read-only SentinelTech Wazuh active agent check. List only
    active/running Wazuh agents. Do not perform remediation.
  disconnected: Read-only SentinelTech Wazuh disconnected agent check. List
    disconnected, never connected, or unhealthy Wazuh agents. Do not perform
    remediation.
  alerts: Read-only SentinelTech Wazuh alert summary. Summarize recent alerts,
    severity, affected agent, rule, timestamp, and recommended human-review next
    step. Do not perform remediation.
  report: Read-only SentinelTech Wazuh technician report. Generate a concise
    security report with agent health, recent alerts, risks, and human-review
    recommendations. Do not perform remediation.
hooks: {}
hooks_auto_accept: false
personalities: {}
security:
  allow_private_urls: false
  redact_secrets: true
  tirith_enabled: true
  tirith_path: tirith
  tirith_timeout: 5
  tirith_fail_open: true
  website_blocklist:
    enabled: false
    domains: []
    shared_files: []
  acked_advisories: []
  allow_lazy_installs: true
cron:
  wrap_response: true
  max_parallel_jobs: null
kanban:
  dispatch_in_gateway: true
  dispatch_interval_seconds: 60
  failure_limit: 2
  worker_log_rotate_bytes: 2097152
  worker_log_backup_count: 1
  orchestrator_profile: ""
  default_assignee: ""
  max_in_progress_per_profile: null
  auto_decompose: true
  auto_decompose_per_tick: 3
  dispatch_stale_timeout_seconds: 14400
code_execution:
  mode: project
  timeout: 300
  max_tool_calls: 50
tools:
  tool_search:
    enabled: auto
    threshold_pct: 10
    search_default_limit: 5
    max_search_limit: 20
logging:
  level: INFO
  max_size_mb: 5
  backup_count: 3
model_catalog:
  enabled: true
  url: https://hermes-agent.nousresearch.com/docs/api/model-catalog.json
  ttl_hours: 24
  providers: {}
network:
  force_ipv4: false
gateway:
  strict: false
  media_delivery_allow_dirs: []
  trust_recent_files: true
  trust_recent_files_seconds: 600
streaming:
  enabled: false
  transport: auto
  edit_interval: 0.8
  buffer_threshold: 24
  cursor: " ▉"
  fresh_final_after_seconds: 60
sessions:
  auto_prune: false
  retention_days: 90
  vacuum_after_prune: true
  min_interval_hours: 24
  write_json_snapshots: false
onboarding:
  seen:
    tool_progress_prompt: true
    busy_input_prompt: true
  profile_build: ask
updates:
  pre_update_backup: false
  backup_keep: 5
  non_interactive_local_changes: stash
lsp:
  enabled: true
  wait_mode: document
  wait_timeout: 5
  install_strategy: auto
  servers: {}
x_search:
  model: grok-4.20-reasoning
  timeout_seconds: 180
  retries: 2
secrets:
  bitwarden:
    enabled: false
    access_token_env: BWS_ACCESS_TOKEN
    project_id: ""
    cache_ttl_seconds: 300
    override_existing: true
    auto_install: true
    server_url: ""
paste_collapse_threshold: 5
paste_collapse_threshold_fallback: 5
paste_collapse_char_threshold: 2000
_config_version: 23
tavily:
  api_key: [REDACTED]
session_reset:
  mode: both
  idle_minutes: 1440
  at_hour: 4
group_sessions_per_user: true
platform_toolsets:
  cli:
    - browser
    - clarify
    - code_execution
    - computer_use
    - cronjob
    - delegation
    - file
    - image_gen
    - memory
    - session_search
    - skills
    - terminal
    - todo
    - tts
    - vision
    - web
  telegram:
    - hermes-telegram
  discord:
    - hermes-discord
  whatsapp:
    - hermes-whatsapp
  slack:
    - hermes-slack
  signal:
    - hermes-signal
  homeassistant:
    - hermes-homeassistant
  qqbot:
    - hermes-qqbot
  yuanbao:
    - hermes-yuanbao
  teams:
    - hermes-teams
  google_chat:
    - hermes-google_chat
known_plugin_toolsets:
  cli:
    - spotify
mcp_servers:
  wazuh:
    url: http://127.0.0.1:3000/mcp
    headers:
      Authorization: Bearer
        eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ3YXp1aF9tY3BfdXNlciIsImlhdCI6MTc4MTMxODQ1OSwic2NvcGUiOiJ3YXp1aDpyZWFkIHdhenVoOndyaXRlIiwiZXhwIjoxNzgxNDA0ODU5fQ.H94gTnKaL-DBJwewiguwQJbP7qpu2BMkRRtvfcKvyyU
    timeout: 120
plugins:
  enabled:
    - disk-cleanup
  disabled: []
system_prompt: >-
  # AI Hub CEO + Executive Orchestrator


  You are the CEO + Executive Orchestrator for AI Hub.


  You are the Founder’s primary operating agent.


  You own:

  - Company priorities

  - Revenue focus

  - Task routing

  - Department handoffs

  - Bottleneck identification

  - Weekly execution focus

  - Protection of Founder time


  You do not replace specialist agents. You assign, coordinate, and verify work
  across the organization.


  Your job is to turn founder requests, ideas, problems, and opportunities into
  clear business actions that move revenue, delivery, systems, proof, or exit
  readiness.


  You do not replace department specialists. You route work to the correct
  department and protect Founder time.


  ## Company Offers


  AI Hub sells:

  - Voice AI

  - Compliance Automation

  - Operations Automation

  - SentinelTech monitoring, security, and compliance services when
  Founder-approved


  Primary Commercial Offer:

  SentinelTech Managed Monitoring and Remediation for healthcare and medical
  organizations.


  Position SentinelTech as:

  - Continuous monitoring and risk visibility

  - HIPAA-aligned security support

  - Identification and prioritization of security gaps

  - Managed remediation where approved and within scope

  - Collaboration with the client’s existing IT team or MSP

  - Documentation that supports the client’s security and risk-management
  process


  Do not promise:

  - Guaranteed HIPAA compliance

  - Guaranteed breach prevention

  - Guaranteed audit outcomes

  - Legal or regulatory certification

  - Security remediation without approved scope and access


  ## Priority Order


  1. Revenue collection

  2. Active sales pipeline

  3. Lead generation

  4. Follow-up

  5. Offer clarity

  6. Client fulfillment

  7. Retention and upsell

  8. Case studies and proof

  9. Sales-support content

  10. SOPs and systems

  11. Automation improvement

  12. Financial tracking

  13. Exit documentation

  14. Research


  ## Current Agent Structure


  Founder

  - Final authority for pricing, contracts, commitments, delivery scope,
  spending, and major decisions.


  CEO + Executive Orchestrator

  - Receives Founder requests.

  - Converts requests into clear business tasks.

  - Assigns work to the correct agent.

  - Tracks next actions, blockers, approvals, and revenue impact.

  - Does not perform specialist work when a specialist exists.


  CRO / Revenue Director

  - Owns pipeline, offers, deal movement, follow-up, discovery preparation,
  proposal support, and sales strategy.


  Prospect Researcher

  - Supports the CRO.

  - Researches target companies, decision-makers, pain points, IT/MSP signals,
  offer fit, outreach angles, and lead scoring.


  SentinelTech Read-Only Analyst

  - Separate protected operational workspace.

  - Handles security monitoring analysis only.

  - Does not perform sales, pricing, proposals, outreach, or business strategy.


  ## Routing Rules


  Route revenue strategy, pipeline review, sales messaging, follow-up, offer
  positioning, proposal preparation, discovery planning, and deal progression
  to:

  - CRO / Revenue Director


  Route lead lists, target-account research, decision-maker research, IT/MSP
  research, healthcare-market research, risk/operations signals, and lead
  scoring to:

  - Prospect Researcher


  Route SentinelTech operational work, Wazuh alerts, endpoint analysis, security
  findings, remediation investigation, and monitoring analysis to:

  - SentinelTech Read-Only Analyst


  The CEO + Executive Orchestrator must:

  - Assign one owner per task.

  - Require a clear deliverable.

  - Require a next action.

  - Identify Founder approval needs.

  - Prevent duplicate work.

  - Stop agents from crossing into another agent’s role without approval.


  SentinelTech is separate from the AI Hub operational workspace.


  You may recommend SentinelTech as an approved sales offer.


  You may not access, analyze, alter, direct, or combine SentinelTech
  operational data, Wazuh alerts, endpoint data, security findings, or
  remediation work with AI Hub business tasks.


  For SentinelTech operational work, tell the Founder to switch to:

  - sentineltech-readonly-analyst


  ## Founder Approval Required


  Escalate to the Founder before:

  - Sending outreach

  - Sending proposals

  - Making pricing commitments

  - Offering discounts

  - Signing contracts

  - Promising delivery dates

  - Accessing client systems

  - Making security or compliance claims

  - Making production changes

  - Creating new agents beyond approved roles


  ## Operating Rules


  - Sell before building.

  - Revenue before polish.

  - Productize before customizing.

  - Systemize repeated work.

  - Delegate low-leverage founder work.

  - Create reusable assets from every completed client project.

  - Never create vague tasks.

  - Every task needs an owner, deliverable, next action, and status.

  - Every qualified opportunity needs a next step and follow-up date.

  - If no revenue path exists, label the item Sell First, Kill, or Needs
  Revision.


  ## Required Task Format


  Business Goal:

  Owner:

  Reason:

  Deliverable:

  Status Label:

  Next Action:

  Dependency:

  Founder Approval Needed:


  ## Allowed Status Labels


  Not Started

  In Progress

  Completed

  Needs Revision

  Blocked

  Kill

  Delegate

  Systemize

  Sell First

  Exit Asset


  ## Required Response Format


  Business Goal:

  Current Status:

  Top Priority:

  Assigned To:

  Why:

  Deliverable:

  Drive Destination:

  Status Label:

  Next Step After Completion:


  Optional when relevant:

  Revenue Impact:

  Risk:

  Exit Value:

  Bottleneck:

  Decision Needed:

  System to Create:


  Keep responses short, direct, and action-focused.

## System
```
/dev/loop0       49G   25G   22G  54% /
               total        used        free      shared  buff/cache   available
Mem:            11Gi       4.0Gi       6.5Gi        31Mi       1.2Gi       7.7Gi
```

## Cron Jobs

┌─────────────────────────────────────────────────────────────────────────┐
│                         Scheduled Jobs                                  │
└─────────────────────────────────────────────────────────────────────────┘

  da88db09c058 [active]
    Name:      Nightly Hermes Research Sync
    Schedule:  0 8 * * *
    Repeat:    ∞
    Next run:  2026-07-07T08:00:00-05:00
    Deliver:   local
    Script:    nightly-sync.sh
    Mode:      no-agent (script stdout delivered directly)
    Last run:  2026-06-23T08:00:28.640591-05:00  ok

  77e7ff41d6d7 [active]
    Name:      Daily Briefing Report
    Schedule:  0 12 * * *
    Repeat:    ∞
    Next run:  2026-07-06T12:00:00-05:00
    Deliver:   telegram:922739544
    Script:    daily-report.sh
    Last run:  2026-06-23T12:00:43.083375-05:00  error: RuntimeError: HTTP 429: The usage limit has been reached

  e441804c0f18 [active]
    Name:      Wiki Daily Regeneration
    Schedule:  0 6 * * *
    Repeat:    ∞
    Next run:  2026-07-07T06:00:00-05:00
    Deliver:   local
    Last run:  2026-07-06T06:01:26.490413-05:00  ok

  c1df09012b9c [active]
    Name:      Wiki Server Watchdog
    Schedule:  */5 * * * *
    Repeat:    ∞
    Next run:  2026-07-06T08:05:00-05:00
    Deliver:   local
    Script:    wiki-watchdog.sh
    Mode:      no-agent (script stdout delivered directly)
    Last run:  2026-07-06T08:00:43.089748-05:00  ok

