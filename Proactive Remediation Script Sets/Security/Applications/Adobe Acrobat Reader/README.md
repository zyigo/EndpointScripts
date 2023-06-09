# Adobe Acrobat Reader
Configures registry elements to establish recommended security settings for Adobe Acrobat Reader, that are also considered required by Microsoft Defender.
 
## Pre-Requisites
There are no pre-requisites for this PR set.

## Instructions
Modify both the detection and remediation scripts to set the appropriate registry values. Defaults are shown below.

| Registry Key                                                      			| Registry Value                              	| Type  | Script Default |
| ---                                                               			| ---                                      	| ---   | ---            |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown 	  		| bEnhancedSecurityStandalone				| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bEnhancedSecurityInBrowser 				| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bProtectedMode						| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| iProtectedView						| DWord | 2              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| EnableProtectedModeAppContainer			| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bDisableTrustedSites 					| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| iFileAttachmentPerms 					| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bDisablePDFHandlerSwitching 			| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bEnableFlash         					| DWord | 0              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bEnable3D            					| DWord | 0              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bUpdater             					| DWord | 0              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bToggleFTE           					| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bToggleToDoList      					| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bAcroSuppressUpsell					| DWord | 1              | 
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bToggleDCAppCenter					| DWord | 1              | 
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bSendMailShareRedirection				| DWord | 1              | 
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bToggleSendAndTrack					| DWord | 1              | 
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bShowScanTabInHomeView 				| DWord | 0              | 
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bToggleToDoTiles     					| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bToggleSophiaWebInfra 				| DWord | 0              | 
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bLimitPromptsFeatureKey 				| DWord | 1              | 
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown  			  | bEnablePersistentButton 	     			| DWord | 0              | 
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown   			| bDisableJavaScript   					| DWord | 1              | 
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cSharePoint 	| bDisableSharePointFeatures 				| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cIPM 			| bDontShowMsgWhenViewingDoc 				| DWord | 0              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cWebmailProfiles	| bDisableWebmail      					| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices		| bUpdater             					| DWord | 0              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices 		| bToggleAdobeDocumentServices 			| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices 		| bToggleAdobeSign     					| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices 		| bTogglePrefSync      					| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices 		| bToggleWebConnectors 					| DWord | 1              |
| HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cCloud 		| bAdobeSendPluginToggle 				| DWord | 1              |
| HKU:\\$sid\SOFTWARE\Adobe\Acrobat Acrobat\DC\TrustManager        			| bEnableAlwaysOutlookAttachmentProtectedView 	| DWord | 0              |
| HKU:\\$sid\SOFTWARE\Adobe\Adobe Acrobat\DC\HomeWelcomeFirstMile 			| bEnableFirstMile     					| DWord | 0              |
| HKU:\\$sid\SOFTWARE\Adobe\Adobe Acrobat\DC\Workflows\cServices\cAcrobatApp 		| bAcrobatAppInstalled 					| DWord | 1              |
| HKU:\\$sid\SOFTWARE\Adobe\Adobe Acrobat\DC\Workflows\cServices\cScanApp 		| bScanAppInstalled    					| DWord | 1              |
