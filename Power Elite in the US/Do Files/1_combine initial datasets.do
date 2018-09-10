
************Author: William Duncan**************************
************Last Edited: 9/9/2018***************************
************Import and Clean University Elite Data**********

clear all
set more off
import excel "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Power Elite.xls", sheet("people") firstrow

drop if University == 0
drop Foundation ThinkTank Corporation PresidentialCommission Forbes400rank Fortune500rank ThinkTankrank CorporatePolicyNetwork lastname name category Universityrank
sort organization

collapse (sum) University, by(organization)
rename University no_elites
replace organization = "Columbia University in the City of New York" in 7
replace organization = "Georgia Institute of Technology-Main Campus" in 14
replace organization = "Indiana University-Bloomington" in 17
replace organization = "Pennsylvania State University-Main Campus" in 23
replace organization = "Tulane University of Louisiana" in 34
replace organization = "University of Illinois at Urbana Champagne" in 36
replace organization = "University of Illinois at Urbana Champaign" in 36
replace organization = "University of Illinois at Urbana-Champaign" in 36
replace organization = "University of Pittsburgh-Pittsburgh Campus" in 39
replace organization = "Washington University in St Louis" in 45

*bysort organization: gen num=sum(University)
*egen no_elites = max(num), by(organization)
*drop num

save "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\university_elites", replace
clear all


**********Import and Clean University Scorecard Data***********

import delimited "C:\Users\WilliamDuncan\Desktop\university scorecard data.txt"

rename instnm organization
drop ÿþunitid opeid opeid6 insturl npcurl

save "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\university scorecard", replace
clear all


************Merge the two datasets**********
use "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\university_elites"

merge 1:m organization using "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\university scorecard"
