
***************Author: William Duncan*********************
**************Last Edited: 9/9/2018***********************
*****Data Visualization with scorecard_elite_merged*******


clear all
set more off
cd "C:\Users\WilliamDuncan\Dropbox\Power Elite in the US\Working Data"

use "merged_data"

ranksum rank, by(elite_dummy)



