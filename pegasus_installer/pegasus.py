import os
os.environ['KIVY_NO_CONSOLELOG'] = '1'

from kivy.clock import Clock
from kivy.core.window import Window
from kivy.lang import Builder
from kivymd.app import MDApp
from kivymd.uix.screen import MDScreen
from kivymd.uix.screenmanager import MDScreenManager
from pegasus_installer.kv import kv_screen


Window.size = (800, 450)


class ScreenSplash(MDScreen) :
    
    def on_enter(self, *args):
        Clock.schedule_once(self.switch_to_home, 2)

    def switch_to_home(self, dt):
        self.manager.current = 'screen_paths'


class ScreenPaths(MDScreen):
    pass


sm = MDScreenManager()
sm.add_widget(ScreenSplash(name='screen_splash'))
sm.add_widget(ScreenPaths(name='screen_paths'))


class PegasusApp(MDApp):

    def build(self):

        self.title = 'Pegasus Installer'
        self.icon = 'pegasus_installer/assets/images/pegasus_logo_00001.png'
        
        screen = Builder.load_string(kv_screen)
        
        return screen
