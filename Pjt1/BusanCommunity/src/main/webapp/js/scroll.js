$(document).ready(function() {
    $('#myContainer').multiscroll({
        sectionsColor: ['#F2F2F2', '#ebedee', '#c3cfe2', '#e2d1c3', '#DCD9D4'],
        anchors: ['first', 'second', 'third', 'fourth', 'fifth'],
        navigation: true,
        navigationTooltips: ['One', 'Two', 'Three', 'four', 'five'],
        loopBottom: true,
        loopTop: true
    });
});