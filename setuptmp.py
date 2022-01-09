import gi

gi.require_version("Gtk", "3.0")
gi.require_version('Notify', '0.7')

from gi.repository import Gtk
from gi.repository import Notify

class MyWindow(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Hello World")
        Gtk.Window.set_default_size(self, 640, 480)
        # Gtk.Window.set_resizeable(False)
        Notify.init("Simple GTK3 Application")

        label = Gtk.Label("test")
        self.add(label)

        self.box = Gtk.Box(spacing=6)
        self.add(self.box)
       
        self.button = Gtk.Button(label="Install")
        self.button.set_halign(Gtk.Align.CENTER)
        self.button.set_valign(Gtk.Align.CENTER)
        self.button.connect("clicked", self.InstallButtonClicked)
        self.box.pack_start(self.button, True, True, 0)

    def InstallButtonClicked(self, widget):
        #TODO Make this do something
        pass #This just makes the rest of the code not break until we get something in here

win = MyWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
