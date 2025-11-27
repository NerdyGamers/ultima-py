# `ultimapy.sdk.skills`

Skill metadata and skill groups.

## Sources

- `Skills.idx` / `skills.mul` – skill definitions
- `skillgrp.mul` – grouping information (categories)

In environments where these files are missing, the loaders no-op and leave
entries / categories in a default or empty state so that imports still succeed.
