# Version System
Meloc faithfully follows the [semantic version] (https://semver.org/spec/v2.0.0.html). There are three places where versions must be specified:

1. The field `type`, where it is indicated which version of the specification the module uses

2. The field `version`, whose value is the current version of the module

3. The field `dependencies`, where for each dependency it is indicated which version is used

In all cases, it is mandatory to indicate the version with the correct format. The field `version` requires you to always indicate the full version, without omitting any number.

In the fields `type` and `dependencies`, however, it depends on the stability of the version:

- If it is stable - from 1.0 - it is mandatory to indicate only the major and minor versions - for example, `1.2`

- If it is unstable —0.x—, it is mandatory to indicate the full version, without omitting any number —for example, `0.3.2`
