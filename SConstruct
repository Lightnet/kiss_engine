#!python 
import platform
import os
import sys
import glob

print("Project Script Config!")
#print("Current Dir: " + os.getcwd())

#get the mode flag from the command line
#default to 'release' if the user didn't specify
devmode = ARGUMENTS.get('mode', 'release')   #holds current mode
#projectmode = ARGUMENTS.get('mode', 'debug')   #holds current mode

#check if the user has been naughty: only 'debug' or 'release' allowed
if not (devmode in ['debug','release']):
	print("Error: expected 'debug' or 'release', found: " + devmode)

print('**** Compiling in ' + devmode + ' mode...')

programname = 'ufo_2d'				#holds the project name
projectpackage = 'examples'						#holds the project folder
buildroot = './bin/' + devmode			#holds the root of the build directory tree
builddir = './' + projectpackage  			#holds the build directory for this project
targetpath = buildroot + '/' + programname	#holds the path to the executable in the build directory

env = Environment(ENV = os.environ) #this load user complete external environment
#env.Append(LINKFLAGS=['-D_CRT_SECURE_NO_WARNINGS'])
env.Append(LINKFLAGS=['/SUBSYSTEM:CONSOLE'])
env.Append(LINKFLAGS=['/machine:X86'])
#env.Append(LINKFLAGS=['/Oi /GR- /Gm /EHa- /WX /W4 /FC /Zi /MD /wd4100 /wd4456 /wd4244 /wd4201 /wd4305 /wd4459 /wd4577 /wd4189'])

include_packages = [] #header file basefile.h
include_packages.append('include') 
include_packages.append('lib\\Box2D')
include_packages.append('lib\\\glfw\\include')
include_packages.append('lib\\gl3w')
include_packages.append('lib\\glfw\\include\\GLFW')
include_packages.append('include\\imgui')


env.Append(CPPPATH=include_packages) #include

env.Library(buildroot + os.sep + 'glad',Glob('include\\glad\\*.c')) #

env.Library(buildroot + os.sep + 'imgui',Glob('include\\imgui\\*.cpp')) #

env.Library(buildroot + os.sep + 'gl3w',Glob('lib\\gl3w\\GL\\*.c')) #

env.Library(buildroot + os.sep + 'glfw3',Glob('lib\\glfw\\lib\\glfw3.lib'),LINKFLAGS=['/machine:X86']) #

env.Library(buildroot + os.sep + 'Box2D',Glob('lib\\Box2D\\Box2D\\lib\\Box2D.lib')) #
#env.Library(buildroot + os.sep + 'Box2D',Glob('lib\\Box2D\\Box2D\\*\\*.cpp')) #
#env.Library(buildroot + os.sep + 'Box2D',Glob('lib\\Box2D\\Box2D\\Dynamics\\*.cpp')) #
#env.Library(buildroot + os.sep + 'Box2D',Glob('lib\\Box2D\\Box2D\\Common\\*.cpp')) #
#env.Library(buildroot + os.sep + 'Box2D',Glob('lib\\Box2D\\Box2D\\Collision\\*.cpp')) #

lib_packages = []
#lib_packages.append('Gdi32')
lib_packages.append('opengl32')
#lib_packages.append('Shell32')
#lib_packages.append('user32')
lib_packages.append('Box2D')
lib_packages.append('glfw3')
lib_packages.append('glad')
lib_packages.append('gl3w')

env.Program(targetpath, Glob(builddir + os.sep + 'ufo_2d\\*.cpp'), LIBS=lib_packages, LIBPATH=['.','examples\\ufo_2d', buildroot])

print("**** Script Finish Here! Win32")