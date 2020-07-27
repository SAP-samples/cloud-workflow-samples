# FLP module

An SAP Fiori launchpad site is one of the site templates offered by SAP Cloud Platform Portal. A launchpad site displays a home page with tiles and links representing business applications that an end user can launch.

Adding an SAP Fiori launchpad Site module to your project, adds a new folder under the mta project containing the launchpad design time site. The design time site includes all content configuration files, e.g Content Data Model, and relevant translation files. 

During deployment, the SAP Fiori launchpad site is created and activated in the project space.

## The CommonDataModule.json file

Here is an example of a CommonDataModel.json file. It contains the site apps, and the related configuration entities, e.g. catalogs, and groups, and site settings.
```json
{
    "_version": "3.0.0",
    "identification": {
        "id": "{{bundleId}}",
        "entityType": "bundle"
    },
    "payload": {
    }
}
``` 

### Catalogs
Catalogs represent a grouping of related apps for authorization purposes. Every app must be assigned to a catalog. Catalogs and their associated apps are displayed in the AppFinder. 

```json
{
    "catalogs": [{
        "_version": "3.0.0",
        "identification": {
            "id": "defaultCatalogId",
            "title": "{{title}}",
            "entityType": "catalog",
            "i18n": "i18n/defaultCatalogId.properties" 
        },
        "payload": {
            "viz": [{
                "id": "app1",
                "vizId": "semantic-action"
            }, {
                "id": "app2",
                "vizId": "semantic-action"
            }, {
                "id": "app3",
                "vizId": "semantic-action"
            }]
        }
   }]
}
```

### Groups
Groups are a grouping of apps in the UI level. Your launchpad may contain a large number of apps. You can group them together according to a certain criteria. In this example, the group contains two tiles and a link that launch three different apps.  
```json
{
    "groups": [{
        "_version": "3.0.0",
        "identification": {
            "id": "defaultGroupId",
            "title": "{{title}}",
            "entityType": "group",
            "i18n": "i18n/defaultGroupId.properties"
        },
        "payload": {
            "viz": [{
                "id": "tileId-1",
                "appId": "app1",
                "vizId": "semantic-action"
            }, {
                "id": "tileId-2",
                "appId": "app2",
                "vizId": "semantic-action"
            }],
            "links": [{
                "id": "tileId-3",
                "appId": "app3",
                "vizId": "semantic-action"
            }] 
        }
   }]
}
```

Apps are defined in the group section. To add a new tile/link, add another code block using the same format as the example above. The app ID is taken from the app manifest.json (app folder → webapp → manifest.json).  To change the configuration of the tile/link, open the app manifest.json → Navigation tab.   
   
### Sites
In this section you can define the site settings.

The following settings can be configured:
* Personalization – enablePersonalization (enabled by default) 
* Theme selection – you can replace the value of "theme.id" with any of the values that appear in "theme.active" array
* SAPUI5 - you can change the  value of "ui5VersionNumber" to a different one

```json
   {
        "sites": [{
            "_version": "3.0.0",
            "identification": {
                "id": "{{siteId}}",
                "entityType": "site",
                "title": "SAP Fiori launchpad site on Cloud Foundry",
                "description": "SAP Fiori launchpad site on Cloud Foundry, deployed from SAP Web IDE"
            },
            "payload": {
                "config": {
                    "ushellConfig": {
                        "renderers": {
                            "fiori2": {
                                "componentData": {
                                    "config": {  
                                        "enableRecentActivity": false,
                                        "applications": {
                                            "Shell-home": {}
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                "groups": [ 
                    "defaultGroupId"
                ],
                "sap.cloud.portal": { 
                    "config": { 
                        "theme.id": "sap_belize",
                        "theme.active": ["sap_belize","sap_belize_plus","sap_belize_hcb","sap_belize_hcw"],
                        "ui5VersionNumber": "1.61"
                    }
                }
            }
         }]
    }}
}    
```

## Handling translation
* Translation of the launchpad entities (catalogs, groups., etc.) is maintained per entity.
* Each entity defines the properties file of the master language (default language). For example: defaultCatalogId.properties.
* To add translation to a certain language, create a new file. Use the same name as the master language file , and add _locale at the end. For example: defaultCatalogId_de.properties.
* Place all translation files in the i18n folder.
* To activate the translation, build the mta project and deploy the mtar.

## Build - Deploy - Access Site
1. Right click your mta project folder → Build.  
Results: A new mta_archives folder is created in your workspace. Inside the mta_archives folder, you will find a folder with the same name as the mta project, which contains an mtar (deployable) file.
2. Right click the mtar file → Deploy → Deploy to Cloud Foundry. You can also deploy the mtar using CLI, or Pipeline.
3. At the end of the DeploymentToCF job, you can find in the SAP WebIDE console the following message:  
Application <appRputer module name> has been created. Application URL is: https://\<application URL>. To access the site, use https://\<application URL>/cp.portal

* [Portal on Cloud Foundry](https://help.sap.com/viewer/ad4b9f0b14b0458cad9bd27bf435637d/Cloud/en-US/5798687972fd4c2bace31c65b47f5587.html)
