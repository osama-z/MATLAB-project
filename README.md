# What is project do:
Project do two thing the first is plot the function (the function come from the user) and can do some Change like (time scaling, time shift and time reversal)
MATLAB will plot two function the first is Function without any edit and the second plot with edit (a*f (b*t + c)) that’s output plot will come when enter the plot.
Project can do convolution with rect(t/2) and plot it in axes2 and the function without convolution in axes1

# Toole I use in MATLAB code:
* Button plot:
    -Inline: take the function from user by get.
    -Eval: to take time from user and put it in specified variables.
    -Axes: to put the plot draw on the axes I want.
        Str2double: I use it to convert the text come from user to
        double.
        And I do something to make the plot look beautiful like I put the background color of plot black by set (gca, ‘color’, ‘k’)And I draw grid on plot.
        I plot grid minor and change the color.Then I add linewidth to plot to make the line more beautiful
* Convolution plot:
    I do the same thing in button plot in axes1 but in the axes2 I make some change. MATLAB will make convolution with rect(t/2) And the function that user input it.
    Conv: the function in MATLAB to make convolution with two function x, h conv (x, h).
    In convolution I should make new time(t) (x: r: y) that is (T) I will product x and h by 2 to be like this (x*2: r: y*2)
# How I make GUI in MATLAB:
    Write guide in command window then will create new GUI And use
        • static text: to write the text I want the user to see it.
        • Edit text: to take input from user.
        • Push button: to make user click to take the output.
    And I click twice to open inspector that help me make some change on it like
        • Color: to change the color of string or background
        • Front size: to change the size of string.
        • String: to write the text that I want user to see it.
        • Tag: (name of function in cod MATLAB) to make name of it that help me in code to now where I write code.
