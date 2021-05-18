@echo off

rem �I���W�i���\���o�[�֘A�t�@�C������
set solver_name=\mysolver
set go_file=.\go.bat
set exe_file=.\x64\release\iric-solver.exe
set def_file=.\definition.xml

rem iRIC�C���X�g�[���t�H���_�֘A�p�X�ݒ�
set iric_dir=C:\Users\riverlink\iRIC
set private_dir=\private
set solver_dir=\solvers
set src_dir=\src

rem �t�H���_���Ȃ���΍쐬����
echo %iric_dir%
If not exist %iric_dir% goto error

rem �t�H���_���Ȃ���΍쐬����
set buf=%iric_dir%%private_dir%
echo %buf%
If not exist %buf% mkdir %buf%

rem �t�H���_���Ȃ���΍쐬����
set buf=%buf%%solver_dir%
echo %buf%
If not exist %buf% mkdir %buf%

rem �t�H���_���Ȃ���΍쐬����
set buf=%buf%%solver_name%
echo %buf%
If not exist %buf% mkdir %buf%


rem iRIC�p�v���O�����̃R�s�[
copy /y %go_file% %buf%
copy /y %def_file% %buf%
copy /y %exe_file% %buf%

rem �t�H���_���Ȃ���΍쐬����
set buf=%buf%%src_dir%
echo %buf%
If not exist %buf% mkdir %buf%

rem �\�[�X�R�[�h�̃R�s�[
copy /y .\*.f90 %buf%

goto :EOF


:error
echo Error
