# Website modifications

## Site-wide

- ~~Increase font size site-wide?~~
- databrary.com does not point to www.databrary.org site.

## [Databrary.org](http://databrary.org)

### Site-wide footer

~~- Funding source with NSF logo and grant number (BCS 1238599) on each page (footer?)~~
 >Not sure this is site-wide. I see the footer in the datavyu.org pages, but not on staging.databrary.org. Probably just replicate the footer or 

- We need a databrary-specific footer.
	- Facebook icon links to datavyu, not databrary FB page. Correct URL is https://www.facebook.com/pages/Databrary/185349568273416?.
	- Google+ icond links to @datavyu, not @databrary. Correct URL is https://plus.google.com/u/1/111083162045777800330/posts
	- GitHub icon links to http://github.com/databrary/datavyu; Correct URL is http://github.com/databrary
	- Twitter icon link is correct.
	- Fix URLs to Jobs and Contact to databrary.org/jobs/ and databrary.org/contact from staging*

- Add Funding page when we have more funding sources

### Join our mailing list tab

~~Window persists after hitting subscribe button.~~

### Fix mailing list output

On MailChimp, fix Testing mail confirmation / switch to a real list before site goes live.

### [Databrary.org/faq/](http://databrary.org/faq/)

- Need a blurb for "What is Databrary?"

> Databrary is a data library for scientists to share video and audio recordings, research data and analytical tools, and metadata with other investigators.

- Replace answer to "Will I receive credit for my contributions if other researchers use my data?" with the following:

> Yes. Users will sign an agreement stating that they will acknowledge contributors by citing any data or tool they use from Databrary. Databrary will provide permanent links and a citation format.

- Replace answer to "What can I contribute?" with the following:

> Data contributors can share raw digital video files, other data streams (e.g., audio, motion tracking, eye tracking coordinates, physiological data, transcripts), papers based on the data, associated metadata (e.g., coded spreadsheets, codebook, questionnaires, instruments, analysis spreadsheets), and a handful of tags describing the overall dataset that reflect standard federal guidelines (number of participants at various ages and their sex, race, ethnicity, and geographical region, typically/atypically developing) and study design (human/animal, naturalistic/experimental, cross-sectional/longitudinal). These rich forms of metadata will help users to search for appropriate datasets within Databrary, browse the videos within datasets for particulars, and make greater use of datasets for research and teaching. 
> Because video and audio recordings and photographs may depict faces, voices, names, or other personally identifying information (see [Databrary definitions](https://databrary.com/policies/definitions.md)"), special care must be taken. The people depicted must give explicit permission for the recordings or photographs to be shared with Databrary. Databrary has created template documents for this purpose (see examples [here](https://github.com/databrary/policies/) ).  
> In other data formats such as text files and spreadsheets, participants must be denoted by code number not names. Personally identifying information must be removed before data are deposited. Databrary recommends investigators adopt [best practices for data security](https://github.com/databrary/policies/blob/master/best-practices.md and uphold the [Databrary Bill of Rights](https://github.com/databrary/policies/blob/master/bill-of-rights.md).
> Tool contributors can share tools and algorithms for visualizing, exploring, and analyzing data, and other uses. Links and scripts will enable interoperability between coded data and tools. Open source tools can share the source code.

### [Databrary.org/jobs/](http://databrary.org/jobs/)

- Font sizes for header and body text are 1 click smaller here than on datavyu.org/jobs/

### [Databrary.org/about/#community](http://staging.databrary.org/about/#community)

Add links to every advisory board and committed contributor. ~~Can't find the html on github, but it was on the old databrary repo.~~found! 

### [Databrary.org/contact/](http://staging.databrary.org/contact/)

- Header says "Contact Datavyu." Change to "Contact Databrary."
- Add some team photos.

## [Datavyu.org](http://datavyu.org)

### Site-wide nav bar

#### Developer tab

- Should we alert that we are leaving the site? (Requires more unnecessary clicks?)

> True, more clicks. Could we have a mouse-over/pop-up or is that bad UI style? 
> Lightbox in the style of the subscription form, perhaps? It doesn't really leave the site though, it opens up a new tab.

### Site-wide footer

- ~~Funding source with NSF logo and grant number (BCS 1238599) on each page (footer?)~~

- (Have included grant # for now, when more funding sources include only logos of funding agencies.)

- Check social media links: should we have "Follow" links instead? (I'm personally wary about automatic follows and likes, so maybe no?)  

### [features.html](http://datavyu.org/features.html)

- Replace monkeybars video for "Record Observations" with something that is less "motor" (video taken yesterday. will sync and edit later this week)

### [support.html](http://datavyu.org/support.html)

- Complete refactor to Datavyu
	- ~~Change "Help others by asking and answering OpenSHAPA questions." in **welcome to Datavyu Support** box~~
	- ~~Change to About Datavyu in blue right hand side bar.~~
	 	
### [datavyu.org/bugs](http://datavyu.org/bugs/)

- Link takes to log-in page (offering Bugzilla alongside the support forum, both with separate logins, might be confusing to the general public. How about a link nested somewhere in the github repository for developers?)
- Customize to reflect datavyu?


## [Labnanny.org](http://labnanny.org)

### Links.html?

Should we add a links.html page with links to other lab/data management solutions like [Open Science Framework](http://openscienceframework.org/)
Agreed. Can someone provide a list of these links?

### Site-wide footer

- Funding source with NSF logo and grant number (BCS 1238599) on each page (footer?)

- Plan for addition of NICHD and possibly other funding sources.
