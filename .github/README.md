

<div align="center">  
  <a href="https://github.com/zyigo/EndpointScripts">
    <img src="logo.png" alt="Logo" width="80" height="80">
  </a>

  <h1 id="top">Endpoint Scripts</h1>

  [![Contributors][contributors-shield]][contributors-url]
  [![Forks][forks-shield]][forks-url]
  [![Stargazers][stars-shield]][stars-url]
  [![MIT License][license-shield]][license-url]
  [![Issues][issues-shield]][issues-url]

</div>

> [!WARNING]  
> This repo is no longer maintained. Feel free to fork it as necessary.

<div align="center"> 
  <br/>
  
  When working for a small business, I needed a way to manage devices quickly, simply and effectively. To do so, [zyigo/EndpointScripts](https://github.com/zyigo/EndpointScripts) was established. It is a collection of ideas, thoughts and scripts for effective configuration of Microsoft Endpoint Managed and Intune devices. 

  <br/>
  
  [Report Bug](https://github.com/zyigo/EndpointScripts/issues/new?assignees=&labels=bug&template=bug_report.md&title=)
  ·
  [Request Feature](https://github.com/zyigo/EndpointScripts/issues/new?assignees=&labels=enhancement&template=feature_request.md&title=)
  
  [![GitHub issues by-label](https://img.shields.io/github/issues/zyigo/EndpointScripts/bug?color=red&label=Bugs&style=flat-square)](https://github.com/zyigo/EndpointScripts/labels/bug)
  [![GitHub issues by-label](https://img.shields.io/github/issues/zyigo/EndpointScripts/documentation?color=blue&label=Documentation&style=flat-square)](https://github.com/zyigo/EndpointScripts/labels/documentation)
  [![GitHub issues by-label](https://img.shields.io/github/issues/zyigo/EndpointScripts/enhancement?color=aqua&label=Enhancements&style=flat-square)](https://github.com/zyigo/EndpointScripts/labels/enhancement)
  [![GitHub issues by-label](https://img.shields.io/github/issues/zyigo/EndpointScripts/good%2520first%2520issue?color=purple&label=Good%20First%20Issue&style=flat-square)](https://github.com/zyigo/EndpointScripts/labels/good%20first%20issue)
  [![GitHub issues by-label](https://img.shields.io/github/issues/zyigo/EndpointScripts/Help%20Wanted?color=forestgreen&label=Help%20Wanted&style=flat-square)](https://github.com/zyigo/EndpointScripts/labels/help%20wanted)
  [![GitHub issues by-label](https://img.shields.io/github/issues/zyigo/EndpointScripts/security?color=black&label=Security&style=flat-square)](https://github.com/zyigo/EndpointScripts/labels/security)
  
</div>

## Getting Started
Instructions for use and any necessary prerequisities are listed within each script and/or within each script set readme. If the instructions are insufficient, or you are still having trouble, please [raise a new feature request](https://github.com/zyigo/EndpointScripts/issues/new?assignees=&labels=documentation&template=feature_request.md&title=).

## [Stand-Alone Scripts](https://github.com/zyigo/EndpointScripts/tree/main/Stand-Alone%20Scripts)
| Type | Scripts | Description |
| --- | --- | --- |
| [Provisioning](https://github.com/zyigo/EndpointScripts/tree/main/Stand-Alone%20Scripts/Provisioning) | [Enhance Intune Agent Logging](https://github.com/zyigo/EndpointScripts/tree/main/Stand-Alone%20Scripts/Provisioning/Enhance%20Intune%20Agent%20Logging.ps1) | The script extends the Intune Management Extension (IME) log behavior. |
| [Provisioning](https://github.com/zyigo/EndpointScripts/tree/main/Stand-Alone%20Scripts/Provisioning) | [Remove Built-In Apps] | Removes unnecessary built-in windows app during device provisioning. |

[Remove Built-In Apps]: https://github.com/zyigo/EndpointScripts/tree/main/Stand-Alone%20Scripts/Provisioning/Remove%20Built-In%20Apps.ps1

## [Proactive Remediation Sets](https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets)
| Type | Scripts | Description |
| --- | --- | --- |
| [Cleanup] | [Cleanup Printers and Ports] | Removes specific, existing printers and printer ports from a device. |
| [Provisioning] | [Enable Automatic Timezone] | Enables the Automatic Timezone service, so that the device can auto-configure as expected. |
| [Provisioning] | [Remove Built-In Microsoft Teams]| Removes the Personal-Only Microsoft Teams installed by default in Windows 11. |
| [Security/Applications] | [Adobe Acrobat Reader] | Configures security settings for Adobe Acrobat Reader. |
| [Security/Applications] | [Uninstall Local Google Chrome] | Removes Google Chrome if it is installed locally by the user. |
| [Security/System] | [Enable Credential Guard] | Enables Credential Guard on non-Enterprise PCs (i.e. Business Premium licenced). |
| [Security/System] | [Fix Unquoted Service Path Issues] | Remediates service paths in the registry that are not secured with quotation marks. |
| [Security/System] | [Intune Policy Gap-Filler] | Sets various keys required by Microsoft Defender, that aren't available via Intune configuration profiles. |

[Cleanup]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Cleanup
[Provisioning]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Provisioning
[Security/Applications]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Security/Applications
[Security/System]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Security/System

[Enable Automatic Timezone]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Provisioning/Enable%20Automatic%20Timezones
[Remove Built-In Microsoft Teams]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Provisioning/Remove%20Built-In%20Microsoft%20Teams
[Cleanup Printers and Ports]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Cleanup/Cleanup%20Printers%20and%20Ports
[Adobe Acrobat Reader]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Security/Applications/Adobe%20Acrobat%20Reader
[Uninstall Local Google Chrome]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Security/Applications/Uninstall%20Local%20Google%20Chrome
[Fix Unquoted Service Path Issues]: https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Security/System/Fix%20Unquoted%20Service%20Path%20Issues
[Enable Credential Guard]:https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Security/System/Enable%20Credential%20Guard
[Intune Policy Gap-Filler]:https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Security/System/Intune%20Policy%20Gap-Filler

## Licence
Distributed under the MIT License. See [`LICENSE.md`](https://github.com/zyigo/EndpointScripts/blob/main/LICENSE.md) for more information.

## Acknowledgments
- Project icon designed by [Freepik](https://www.flaticon.com/authors/freepik) from [Flaticon](https://www.flaticon.com/free-icons/programming)
- [PRSS/Security/System/Fix Unquoted Service Path Issues](https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Security/System/Fix%20Unquoted%20Service%20Path%20Issues) is a fork of a repo developed by various contributors. Original repo available [here](https://github.com/VectorBCO/windows-path-enumerate).
- [PRSS/Provisioning/Enable Automatic Timezones](https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Provisioning/Enable%20Automatic%20Timezones) is a fork of a script developed by [IntuneTraining](https://github.com/IntuneTraining). Original repo available [here](https://github.com/IntuneTraining/TimezoneTurnOn).
- [PRSS/Security/Applications/Uninstall Local Google Chrome](https://github.com/zyigo/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Security/Applications/Uninstall%20Local%20Google%20Chrome) is a fork of a gist developed by [Snaver](https://gist.github.com/Snaver). Original gist available [here](https://gist.github.com/Snaver/39bdd480ee83a6d6fff71c7120136728).
- [SAS/Provisioning/Enhance Intune Agent Logging.ps1](https://github.com/zyigo/EndpointScripts/blob/main/Stand-Alone%20Scripts/Provisioning/Enhance%20Intune%20Agent%20Logging.ps1) is a fork of a [script](https://github.com/okieselbach/Intune/blob/master/EnhanceIntuneAgentLogging.ps1) originally authored by [Oliver Kieselbach](https://github.com/okieselbach) of [oliverkieselbach.com](oliverkieselbach.com).
- [SAS/Provisioning/Remove Built-In Apps.ps1](https://github.com/zyigo/EndpointScripts/blob/main/Stand-Alone%20Scripts/Provisioning/Remove%20Built-In%20Apps.ps1) is a fork of a script originally authored by _Joymalya Basu Roy_ and _Wojciech Maciejewski_.

</br>

<p align="center">(<a href="#top">back to top</a>)</p>

[warning-shield]: https://img.shields.io/badge/-%E2%9A%A0%EF%B8%8F%20Many%20of%20these%20are%20likely%20still%20in%20development.%20Use%20them%20at%20your%20own%20peril%2C%20and%20test%20before%20you%20deploy!%20%E2%9A%A0%EF%B8%8F-red
[contributors-shield]: https://img.shields.io/github/contributors/zyigo/EndpointScripts.svg?style=for-the-badge
[contributors-url]: https://github.com/zyigo/EndpointScripts/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/zyigo/EndpointScripts.svg?style=for-the-badge
[forks-url]: https://github.com/zyigo/EndpointScripts/network/members
[stars-shield]: https://img.shields.io/github/stars/zyigo/EndpointScripts.svg?style=for-the-badge
[stars-url]: https://github.com/zyigo/EndpointScripts/stargazers
[issues-shield]: https://img.shields.io/github/issues/zyigo/EndpointScripts.svg?style=for-the-badge
[issues-url]: https://github.com/zyigo/EndpointScripts/issues
[license-shield]: https://img.shields.io/github/license/zyigo/EndpointScripts?style=for-the-badge
[license-url]: https://github.com/zyigo/EndpointScripts/blob/master/LICENSE.md
[size-shield]: https://img.shields.io/github/repo-size/zyigo/EndpointScripts
