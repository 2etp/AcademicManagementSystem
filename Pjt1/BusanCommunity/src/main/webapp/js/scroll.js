$(document).ready(function() {
    $('#myContainer').multiscroll({
        sectionsColor: ['#fff', '#fff', '#fff', '#fff', '#fff'],
        anchors: ['first', 'second', 'third', 'fourth', 'fifth'],
        navigation: true,
        navigationTooltips: ['One', 'Two', 'Three', 'four', 'five'],
        loopBottom: true,
        loopTop: true
    });
});