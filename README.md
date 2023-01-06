<div align="center">
  <!-- PROJECT SHIELDS -->
  
  <a href="https://github.com/ALARP-Solutions/EndpointScripts">
    <img src="logo.png" alt="Logo" width="80" height="80">
  </a>

  <h1 id="top">Endpoint Scripts</h1>

  [![Contributors][contributors-shield]][contributors-url]
  [![Forks][forks-shield]][forks-url]
  [![Stargazers][stars-shield]][stars-url]
  [![MIT License][license-shield]][license-url]
  [![Issues][issues-shield]][issues-url]
  
  <br />
  
  As a small business, we needed a way to manage devices quickly, simply and effectively. To do so, [ALARP-Solutions/EndpointScripts](https://github.com/ALARP-Solutions/EndpointScripts) was established. It is a collection of ideas, thoughts and scripts for effective configuration of Microsoft Endpoint Managed and Intune devices. 
  
  [Report Bug](https://github.com/ALARP-Solutions/EndpointScripts/issues/new?assignees=&labels=bug&template=bug_report.md&title=)
  ·
  [Request Feature](https://github.com/ALARP-Solutions/EndpointScripts/issues/new?assignees=&labels=enhancement&template=feature_request.md&title=)
  
  [![GitHub issues by-label](https://img.shields.io/github/issues/ALARP-Solutions/EndpointScripts/bug?color=red&label=Bugs&style=flat-square)](https://github.com/ALARP-Solutions/EndpointScripts/labels/bug)
  [![GitHub issues by-label](https://img.shields.io/github/issues/ALARP-Solutions/EndpointScripts/documentation?color=blue&label=Documentation&style=flat-square)](https://github.com/ALARP-Solutions/EndpointScripts/labels/documentation)
  [![GitHub issues by-label](https://img.shields.io/github/issues/ALARP-Solutions/EndpointScripts/enhancement?color=aqua&label=Enhancements&style=flat-square)](https://github.com/ALARP-Solutions/EndpointScripts/labels/enhancement)
  [![GitHub issues by-label](https://img.shields.io/github/issues/ALARP-Solutions/EndpointScripts/good%2520first%2520issue?color=purple&label=Good%20First%20Issue&style=flat-square)](https://github.com/ALARP-Solutions/EndpointScripts/labels/good%20first%20issue)
  [![GitHub issues by-label](https://img.shields.io/github/issues/ALARP-Solutions/EndpointScripts/Help%20Wanted?color=forestgreen&label=Help%20Wanted&style=flat-square)](https://github.com/ALARP-Solutions/EndpointScripts/labels/help%20wanted)
  [![GitHub issues by-label](https://img.shields.io/github/issues/ALARP-Solutions/EndpointScripts/security?color=black&label=Security&style=flat-square)](https://github.com/ALARP-Solutions/EndpointScripts/labels/security)
  
</div>

## Getting Started

Instructions for use and any necessary prerequisities are listed within each script and/or within each script set readme. If the instructions are insufficient, or you are still having trouble, please [raise a new feature request](https://github.com/ALARP-Solutions/EndpointScripts/issues/new?assignees=&labels=documentation&template=feature_request.md&title=).

## Individual Scripts

| Type | Scripts | Description |
| --- | --- | --- |
| Provisioning | [CleanupBuiltinApps.ps1] | Removes built-in windows app during device provisioning. |

[CleanupBuiltinApps.ps1]: https://github.com/ALARP-Solutions/EndpointScripts/blob/master/Scripts/Provisioning/CleanupBuiltinApps.ps1

## Proactive Remediation Sets

| Type | Sub-Type | Scripts | Description |
| --- | --- | --- | --- |
| Security | System-Level | [Enable Credential Guard] | Enables Credential Guard on non-Enterprise PCs (i.e. Business Premium licenced) |
| Security | System-Level | [Misc Security Configurations] | Sets various keys required by Microsoft Defender, that aren't available via Intune configuration profiles. |

[Enable Credential Guard]:https://github.com/ALARP-Solutions/EndpointScripts/blob/master/Scripts/Proactive%20Remediation%20Sets/Security/System-Level/Enable%20Credential%20Guard
[Misc Security Configurations]:https://github.com/ALARP-Solutions/EndpointScripts/blob/master/Scripts/Proactive%20Remediation%20Sets/Security/System-Level/Misc%20Security%20Configurations

## Licence

Distributed under the MIT License. See [`LICENSE.md`](https://github.com/ALARP-Solutions/EndpointScripts/blob/main/LICENSE.md) for more information.

## Acknowledgments

- Project icon designed by [Freepik](https://www.flaticon.com/authors/freepik) from [Flaticon](https://www.flaticon.com/free-icons/programming)
- <a href="https://github.com/ALARP-Solutions/EndpointScripts/blob/master/CleanupBuiltinApps.ps1">CleanupBuiltinApps.ps1</a> is a fork of a script originally authored by _Joymalya Basu Roy_ and _Wojciech Maciejewski_

</br>
<p align="center">(<a href="#top">back to top</a>)</p>

[warning-shield]: https://img.shields.io/badge/-%E2%9A%A0%EF%B8%8F%20Many%20of%20these%20are%20likely%20still%20in%20development.%20Use%20them%20at%20your%20own%20peril%2C%20and%20test%20before%20you%20deploy!%20%E2%9A%A0%EF%B8%8F-red
[contributors-shield]: https://img.shields.io/github/contributors/ALARP-Solutions/EndpointScripts.svg?style=for-the-badge
[contributors-url]: https://github.com/ALARP-Solutions/EndpointScripts/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ALARP-Solutions/EndpointScripts.svg?style=for-the-badge
[forks-url]: https://github.com/ALARP-Solutions/EndpointScripts/network/members
[stars-shield]: https://img.shields.io/github/stars/ALARP-Solutions/EndpointScripts.svg?style=for-the-badge
[stars-url]: https://github.com/ALARP-Solutions/EndpointScripts/stargazers
[issues-shield]: https://img.shields.io/github/issues/ALARP-Solutions/EndpointScripts.svg?style=for-the-badge
[issues-url]: https://github.com/ALARP-Solutions/EndpointScripts/issues
[license-shield]: https://img.shields.io/github/license/ALARP-Solutions/EndpointScripts.svg?style=for-the-badge
[license-url]: https://github.com/ALARP-Solutions/EndpointScripts/blob/master/LICENSE.txt
[size-shield]: https://img.shields.io/github/repo-size/alarp-solutions/EndpointScripts
