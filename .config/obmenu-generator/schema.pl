#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

item: add an item into the menu

    {item => ["command", "label", "icon"]}


cat: add a category into the menu

    {cat => ["name", "label", "icon"]}


begin_cat: begin of a category

    {begin_cat => ["name", "icon"]}


end_cat: end of a category

    {end_cat => undef}


sep: menu line separator

    {sep => undef}
    {sep => "label"}


exit: default "Exit" action

    {exit => ["label", "icon"]}


raw: any valid Openbox XML string

    {raw => q(xml string)},


obgenmenu: category provided by obmenu-generator

    {obgenmenu => "label"}


scripts: executable scripts from a directory

    {scripts => ["/my/dir", BOOL, "icon"]}

BOOL - can be either true or false (1 or 0)
    0 => to open the script in background
    1 => to open the script in a new terminal


wine_apps: windows applications installed via wine

    {wine_apps => ["label", "icon"]}

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name

require '/home/bernhard/.config/obmenu-generator/config.pl';

our $SCHEMA = [
    #             COMMAND             LABEL                ICON
    {item => ['thunar',         		'File Manager',      'file-manager']},
    {item => ['lxterminal --geometry=100x30',  	'Terminal',          'terminal']},
    {item => ['medit',          		 'Editor',            'text-editor']},
    {item => ['firefox',   			'Web Browser',       'web-browser']},

    {sep => undef},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['settings',    'Settings',    'applications-accessories']},
    {cat => ['system',      'System',      'applications-system']},

    #{cat => ['qt',          'QT Applications',    'qtlogo']},
    #{cat => ['gtk',         'GTK Applications',   'gnome-applications']},
    #{cat => ['x_xfce',      'XFCE Applications',  'applications-other']},
    #{cat => ['gnome',       'GNOME Applications', 'gnome-applications']},
    #{cat => ['consoleonly', 'CLI Applications',   'applications-utilities']},

    #                  LABEL          ICON
    #{begin_cat => ['My category',  'cat-icon']},
    #             ... some items ...
    #{end_cat   => undef},

    #                  LABEL             ICON
    #{wine_apps => ['Wine apps', 'applications-other']},

    #                DIR     BOOL       ICON
    #{scripts => ['/my/path', 1,  'text-x-script']},

    {sep       => undef},
    { raw => '<menu id="FILE_BROWSER" label="Places" icon="/usr/share/icons/Faenza/apps/48/drakmenustyle.png" execute="~/.config/openbox/pipemenus/obpipemenu-places"/>' },
    { raw => '<menu id="FILES_RECENT" label="Recent Files" icon="/usr/share/icons/Faenza/mimetypes/48/application-vnd.scribus.png" execute="~/.config/openbox/pipemenus/obrecent.sh"/>' },

    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    {sep       => undef},

    #{item => ['xscreensaver-command -lock', 'Lock', 'lock']},

    # This options uses the default OpenBox action "Exit"
    #{exit => ['Exit', 'exit']},
    {item => ['oblogout', 'Logout', 'un-reboot']},
]
