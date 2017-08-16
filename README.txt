/***************************************/
Description: 	JFree Chart custom tag is a Collection of Coldfusion Custom tags that wrap the functionality of the Open Source JFree Chart project 
		written by David Gilbert (more information) http://www.jfree.org/jfreechart/index.html
License:	The JFree Chart Java API and is distributed under GNU Lesser General Public Licence (LGPL).  Likewise the collection of custom tags
		written to encapsulate the functionality of the JFree Charting API have also been released as open source but under the Apache 2 (http://www.apache.org/licenses/LICENSE-2.0)
		license.
Disclaimer: 	If you use the custom tags and something goes horribly wrong thats not my problem.  By using the collection of custom tags you 
		assume all risk!
Other:		If you like the custom tags and find them useful I do accept gifts.  You can gift me something from my amazon wish list http://www.amazon.com/gp/registry/wishlist/18MOTJO43P2YC/ref=wl_web/
/**************************************/

Installation Instructions:
-------------------------
1) Download the lastest version of the JFree Chart API from http://sourceforge.net/project/showfiles.php?group_id=15494
2) Extract the files and add the lib directory to your Coldfusion class path (restart coldfusion server).
3) Copy the jfreechart directory and put it in your custom tags directory.
4) Start using Jfree Charts in your projects


Change History: 20.02.2008 - Corrected height/width mixup
			- added support for earlier versions of Coldfusion (removed <cfimage> tag and imagenew functionality)
			- added chachedirectory/maxCacheSize attributes to support earlier cf versions
			- added check for chachedirectory attribute (must naturally exist before trying to write to the directory).
			- added cfsilent around functions
			- made small change to customImageOutput function
			- numerous small "cosmetic" changes
		12.02.2008	- Added Gantt chart type
			- Added child tag jfTaskSeries to support Gantt chart type
			- Added show legend attribute awareness
			- Added height and width attribute awareness
			- Added validation to attributes (height,width,show legend)
		08.02.2008 	- Added scatter chart type
			- Broke out pie chart styling into own function
			- Broke out bar/line chart styling into own function
			- Created fucntion to build xy data sets from query
			- Created fucntion to build defaultCategoryData sets from query
			- Created function to build jfree Pie Data sets from query
			- added CustomImageOutput function to allow the addition of the 'usemap' attribute to the generated image tag
		07.02.2008 - Initial charts added (bar/line)