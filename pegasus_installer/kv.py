kv_screen = '''
MDScreenManager:
    ScreenSplash:
    ScreenPaths:

<ScreenSplash>:
    name: 'screen_splash'
    md_bg_color: '#005D9B'

    Image:
        source: 'pegasus_installer/assets/images/splash_pegasus_00001.png'
        allow_stretch: False
        keep_ratio: True

<ScreenPaths>:
    name: 'screen_paths'

    MDLabel:
        text: 'Welcome Pegasus User'
        halign: 'center'
    
    MDRectangleFlatButton:
        text: 'Back'
        pos_hint: { 'center_x': 0.5, 'center_y': 0.2 }
        on_press: root.manager.current= 'screen_splash'
'''

