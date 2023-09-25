from distutils.core import setup
setup(
    name='local',
    version='0.1',
    packages=[],
    license='Apache2',
    long_description=open('ReadMe.md').read(),
    install_requires=[
        "carla @ /home/david/carla/PythonAPI/carla/dist/carla-0.9.14-py3.7-linux-x86_64.egg",
    ],
)
