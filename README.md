> **Personal fork of [wez/govee2mqtt](https://github.com/wez/govee2mqtt).**
> I use this to learn Rust, Home Assistant addon development, and GitHub release automation.
> All bug fixes are contributed back upstream. If upstream has what you need, [use upstream](#using-upstream-instead) — that's the recommendation.

# Govee2MQTT: Govee-to-Home-Assistant Bridge

Control your [Govee](https://govee.com) lights, humidifiers, and other smart devices from
[Home Assistant](https://www.home-assistant.io/) — including automations, dashboards, and voice assistants.

Govee2MQTT acts as a bridge: it talks to your Govee devices and makes them
available in Home Assistant through [MQTT](https://www.home-assistant.io/integrations/mqtt/)
(a standard messaging protocol that Home Assistant uses to communicate with devices).

## Getting started

Choose the installation method that matches your Home Assistant setup:

* **[Install as a Home Assistant App](docs/ADDON.md)** — recommended for HAOS and Supervised installations (most users)
* **[Run in Docker](docs/DOCKER.md)** — for Home Assistant Container or Core installations
* **[Configuration reference](docs/CONFIG.md)** — all available settings

## What you'll need

1. **Govee devices** with Wi-Fi (Bluetooth-only devices are not supported yet)
2. **An MQTT broker** — the [Mosquitto app](https://github.com/home-assistant/addons/blob/master/mosquitto/DOCS.md) is the easiest option
3. **Your Govee account credentials** (the email and password you use in the Govee Home app) — recommended for room names, scenes, and full device support
4. **A Govee API key** (optional but recommended) — [get one free here](https://developer.govee.com/reference/apply-you-govee-api-key). Enables scene control, segment colors, and music modes.

## Features

* **Local-first control** — Devices with [LAN API support](https://app-h5.govee.com/user-manual/wlan-guide) respond faster and work even when your internet is down.
* **Scenes and modes** — DIY scenes, music modes, and Tap-to-Run shortcuts from the Govee app all work in Home Assistant.
* **Real-time status** — Devices report state changes (on/off, color, brightness) within seconds via LAN or Govee's cloud.
* **Broad device support** — Lights, LED strips, humidifiers, heaters, fans, purifiers, and kettles.

**What the "Requires" column means:**

* **API Key** — You've [applied for a free Govee API key](https://developer.govee.com/reference/apply-you-govee-api-key) and entered it in the configuration.
* **Govee Account** — You've entered your Govee email and password. This connects to Govee's cloud for real-time updates and Tap-to-Run support.
* **LAN API** — You've [enabled the LAN API](https://app-h5.govee.com/user-manual/wlan-guide) on supported devices in the Govee Home app.

|Feature|Requires|Where to find it in Home Assistant|
|-------|--------|----------------------------------|
|DIY Scenes|API Key|Effects list on the light entity|
|Music Modes|API Key|Effects list on the light entity|
|Tap-to-Run / One Click|Govee Account|Scenes list, and under the "Govee to MQTT" device|
|Live Status Updates|LAN API and/or Govee Account|Automatic — devices update within seconds|
|Segment Color|API Key|`Segment 001`, `002`, etc. light entities under your device|

## Have a question?

* [Is my device supported?](docs/SKUS.md)
* [Frequently Asked Questions](docs/FAQ.md)
* [LAN API troubleshooting](docs/LAN.md)
* [Privacy policy](docs/PRIVACY.md)

---

## Why this fork exists

This is a personal fork of [wez/govee2mqtt](https://github.com/wez/govee2mqtt). I run it for three reasons:

1. **Learning Rust and Home Assistant addon development** — this is real infrastructure running in my home, which makes it a great project to learn on.
2. **Practicing the full GitHub release pipeline** — CI/CD, multi-arch Docker builds, automated tagging, pre-commit hooks, the works.
3. **Experimenting with features** — things like scene quick-cycle buttons that I want for my own setup.

Every bug fix I make here gets contributed back upstream. wez's project is the upstream, and I want it to succeed. This fork is not a replacement for it.

### What I've contributed back

| Fix | Upstream status |
|-----|----------------|
| UTF-8 crash fix | [Merged via #606](https://github.com/wez/govee2mqtt/pull/606) |
| H60B0 (Neon Rope Light 2) device support | [PR #629](https://github.com/wez/govee2mqtt/pull/629) submitted |
| Panic hardening | [#617](https://github.com/wez/govee2mqtt/issues/617) filed |
| Exit code fix | [#618](https://github.com/wez/govee2mqtt/issues/618) filed |
| 2FA login support | [PR #647](https://github.com/wez/govee2mqtt/issues/647) submitted |

### Fork-only experiments

These are things I'm building for my own use. They may or may not make sense upstream.

* **Scene quick-cycle** — Next/Previous buttons and scene info sensor for looping through scenes
* **CI improvements** — clippy gate, pre-commit hooks, automated testing, docs-only commit detection

## Using upstream instead

If you don't need the experimental features above, **use upstream**. That's the recommendation. wez's project is the real thing.

1. **In Home Assistant**, go to **Settings → Apps → App store** (three-dot menu → Repositories).
2. **Remove** this fork's repo URL: `https://github.com/florianhorner/govee2mqtt-extended`
3. **Add** the upstream repo URL: `https://github.com/wez/govee2mqtt`
4. **Refresh** and update/reinstall the Govee2MQTT app.
5. **Restart** the app. Verify your Govee devices come back online.

## Credits

This fork exists because of wez's work. The entire project, architecture, and device support is his.

* [wez/govee2mqtt](https://github.com/wez/govee2mqtt) — the upstream project
* [wez/govee-lan-hass](https://github.com/wez/govee-lan-hass/) — the earlier Govee LAN integration this builds on
* [@bwp91/homebridge-govee](https://github.com/bwp91/homebridge-govee/) — made the AWS IoT support possible
* [theg1nger](https://github.com/wez/govee2mqtt/pull/606) — original author of the UTF-8 fix

## Support the upstream

If Govee2MQTT is useful to you, support wez — he built the thing.

* [Sponsor wez on Github](https://github.com/sponsors/wez)
* [Sponsor wez on Patreon](https://patreon.com/WezFurlong)
* [Sponsor wez on Ko-Fi](https://ko-fi.com/wezfurlong)
* [Sponsor wez via liberapay](https://liberapay.com/wez)
