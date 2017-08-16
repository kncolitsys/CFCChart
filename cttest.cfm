<cfset s1 = queryNew("value,column","Integer,VarChar")>
<cfloop from="1" to="5" index="x" step="1">
<cfset newRow = QueryAddRow(s1,1)>
<cfset a = x>
<cfset b = x+2>
<cfset c= x+3>

<cfset temp= querysetcell(s1,'value',#a#)>
<cfset temp= querysetcell(s1,'column',"KW #x#")>
</cfloop>
<cfset s2 = queryNew("value,column","Integer,VarChar")>
<cfloop from="1" to="5" index="x" step="1">
<cfset newRow = QueryAddRow(s2,1)>
<cfset a = x+2>

<cfset temp= querysetcell(s2,'value',#a#)>
<cfset temp= querysetcell(s2,'column',"KW #x#")>
</cfloop>
<cfset s3 = queryNew("value,column","Integer,VarChar")>
<cfloop from="1" to="5" index="x" step="1">
<cfset newRow = QueryAddRow(s3,1)>
<cfset a = x+3>


<cfset temp= querysetcell(s3,'value',#a#)>
<cfset temp= querysetcell(s3,'column',"KW #x#")>
</cfloop> 
<!--- scatter graph --->
<cfset scatter1 = queryNew("value,column","Integer,VarChar")>
<cfloop from="1" to="40" index="x" step="1">
<cfset newRow = QueryAddRow(scatter1,1)>
<cfset a = (rand()-0.5)*200>
<cfset b = (rand()+0.5)* 6 * x + x>
<cfset temp= querysetcell(scatter1,'value',#a#)>
<cfset temp= querysetcell(scatter1,'column',"#b#")>
</cfloop>
<cfset scatter2 = queryNew("value,column","Integer,VarChar")>
<cfloop from="1" to="40" index="x" step="1">
<cfset newRow = QueryAddRow(scatter2,1)>
<cfset a = (rand()-0.5)*200>
<cfset b = (rand()+0.5)* 6 * x + x>

<cfset temp= querysetcell(scatter2,'value',#a#)>
<cfset temp= querysetcell(scatter2,'column',"#b#")>
</cfloop>
<cfset scatter3 = queryNew("value,column","Integer,VarChar")>
<cfloop from="1" to="40" index="x" step="1">
<cfset newRow = QueryAddRow(scatter3,1)>
<cfset a = (rand()-0.5)*200>
<cfset b = (rand()+0.5)* 6 * x + x>
<cfset temp= querysetcell(scatter3,'value',#a#)>
<cfset temp= querysetcell(scatter3,'column',"#b#")>
</cfloop>

<cfset taskNames="Write Proposal, Obtain Approval, Requirements Analysis, Requirements 1, Requirements 2,Testing, Final Implementation">
<cfset gantt = queryNew("")>
<cfset tasks =['Write Proposal', 'Obtain Approval', 'Requirements Analysis', 'Requirements 1', 'Requirements 2','Testing', 'Final Implementation']>
<cfset start =['04/01/2008', '04/10/2008', '06/02/2008', '06/03/2008', '08/01/2008','08/10/2008', '09/12/2008']>
<cfset end =['04/09/2008', '05/01/2008', '06/04/2008', '07/30/2008', '08/08/2008','08/10/2008', '10/30/2008']>
<cfset complete =[0.5, 0.74,0, 0, 0,0,1]>
<cfset test=QueryAddColumn(gantt, "task", "VarChar",  tasks)>
<cfset test=QueryAddColumn(gantt, "start", "date",  start)>
<cfset test=QueryAddColumn(gantt, "end", "date",  end)>
<cfset test=QueryAddColumn(gantt, "complete", "decimal",  complete)>

<cfimport taglib="jfreeChart" prefix="jf">
<!--- <cfset startDate = createObject("java","java.util.Date").init(s1.start)>--->
<html>
<head><title>Jfree Custom Component Examples</title></head>
<body>


<jf:jfreechart chartType="gantt" height="650" width="450" showmarkers="true" showlabels="true" title="Gantt Chart Example	" categoryAxisLabel="Tasks" categoryValueLabel="Date" createImageMap="true">
	<jf:jfTaskSeries seriesLabel="Project Time Line" serieslinethickness="3" query="#gantt#" startdatecolumn="start" enddatecolumn="end" taskNameColumn="task" PercentCompleteColumn="complete" seriesColorHEX='cc0000' >
</jf:jfreechart>
<br>
<br>

 <jf:jfreechart chartType="bar" height="650" width="450" showmarkers="true" showlabels="true" title="Bar Chart Example" categoryAxisLabel="Tasks" categoryValueLabel="Date" createImageMap="true">
	<jf:jfSeries seriesLabel="Series 1" serieslinethickness="3" query="#s1#" itemColumn="column" valueColumn="value" seriesColorHEX='cc0000' colorlist="cc0000,F5A529,999999">
	<jf:jfSeries seriesLabel="Series 2" serieslinethickness="3" query="#s2#" itemColumn="column" valueColumn="value" seriesColorHEX='F5A529' colorlist="cc0000,F5A529,999999">
	<jf:jfSeries seriesLabel="Series 3" serieslinethickness="3" query="#s3#" itemColumn="column" valueColumn="value" seriesColorHEX='999999' colorlist="cc0000,F5A529,999999">
</jf:jfreechart>
<br>
<br> 
<jf:jfreechart chartType="pie" height="650" width="450" showmarkers="true" showlabels="true" title="Pie Chart Example" categoryAxisLabel="Tasks" categoryValueLabel="Date" createImageMap="true">
	<jf:jfSeries seriesLabel="Pie Series" serieslinethickness="3" query="#s3#" itemColumn="column" valueColumn="value" colorlist="cc0000,F5A529,999999">
</jf:jfreechart>

<br>
<br> 
<jf:jfreechart chartType="pie" height="850" width="450" showmarkers="true" showlabels="true" title="Multi-Pie Chart Example" categoryAxisLabel="Tasks" categoryValueLabel="Date" createImageMap="true">
	<jf:jfSeries seriesLabel="Pie Series 1" serieslinethickness="3" query="#s1#" itemColumn="column" valueColumn="value" colorlist="cc0000,F5A529,999999">
<jf:jfSeries seriesLabel="Pies Series 2" serieslinethickness="3" query="#s2#" itemColumn="column" valueColumn="value" seriesColorHEX='F5A529' colorlist="cc0000,F5A529,999999">
</jf:jfreechart>

<br>
<br> 
<jf:jfreechart chartType="scatter" height="550" width="450" showmarkers="true" showlabels="true" title="Scatter Chart Example" categoryAxisLabel="Random" categoryValueLabel="values" createImageMap="true">
	<jf:jfSeries seriesLabel="Scatter Series 1" serieslinethickness="3" query="#scatter1#" itemColumn="column" valueColumn="value" colorlist="cc0000,F5A529,999999">
	<jf:jfSeries seriesLabel="Scatter Series 2" serieslinethickness="3" query="#scatter2#" itemColumn="column" valueColumn="value" seriesColorHEX='F5A529' colorlist="cc0000,F5A529,999999">
	<jf:jfSeries seriesLabel="Scatter Series 3" serieslinethickness="3" query="#scatter3#" itemColumn="column" valueColumn="value" seriesColorHEX='F5A529' colorlist="cc0000,F5A529,999999">

</jf:jfreechart>
</body>
</html>
