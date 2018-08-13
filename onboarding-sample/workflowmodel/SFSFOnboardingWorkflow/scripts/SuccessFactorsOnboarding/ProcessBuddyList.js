var team = $.context.empData.team.d.directReports.results;
var buddies = [];

for (var i = 0; i < team.length; i++) { 
	buddies.push(team[i].userId);
}

$.context.empData.buddies = buddies.toString();