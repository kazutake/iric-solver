!**********************************************************************
!
!   �v�Z�����ݒ胂�W���[��
!
!**********************************************************************
    module m_set_conditions
    use m_const
    use m_global
    
    contains
    
    
!======================================================================
!   CGNS�t�@�C����ǂݍ���
!======================================================================
    subroutine error_msg(func_name, ier)
    character(len=*) :: func_name
    
    if(ier /= 0) then
        write(*,'(a10, a30, a10, i10)') 'Error at ', func_name, ', ier = ', ier
        stop
    end if
    
    end subroutine
    
!======================================================================
!   CGNS�t�@�C����ǂݍ���
!======================================================================
    subroutine read_cgns
    include "cgnslib_f.h"
    include "iriclib_f.h"
    
    integer :: ier
    character(len= STRMAX) :: condfile
    
    if ( nargs() == 2 ) then
        call getarg(1, condfile, ier)
        call error_msg('getarg', ier)
    else
        write(*,*) 'Error: missing the cgns file as an argument.'
        stop
    endif
    call cg_open_f(condfile, CG_MODE_MODIFY, fid, ier)
    call error_msg('cg_open_f', ier)
    call cg_iric_init_f(fid, ier)
    call error_msg('cg_iric_init_f', ier)
    
!----------------------------------------------------------------------
!   �i�q
!----------------------------------------------------------------------
    call cg_iric_gotogridcoord2d_f(ni, nj, ier)
    call error_msg('cg_iric_gotogridcoord2d_f', ier)
    
    allocate (xx(ni, nj), yy(ni, nj))
    call cg_iric_getgridcoord2d_f(xx, yy, ier)
    call error_msg('cg_iric_getgridcoord2d_f', ier)
    
    allocate (zb(ni, nj), sn(ni, nj))
    call cg_iric_read_grid_real_cell_f('Elevation', zb, ier)
    call error_msg('cg_iric_read_grid_real_cell_f', ier)
    call cg_iric_read_grid_real_cell_f('Manning_n', sn, ier)
    call error_msg('cg_iric_read_grid_real_cell_f', ier)
    
    
    !call cg_iric_read_grid_real_node_f('Elevation', z8, ier)
    
!----------------------------------------------------------------------
!   ����
!----------------------------------------------------------------------
    !call cg_iric_read_integer_f('i_sec_hour', i_sec_hour, ier)
    call cg_iric_read_real_f('dt', dt, ier)
    call cg_iric_read_real_f('t_start', t_start, ier)
    call cg_iric_read_real_f('t_end', t_end, ier)
    call cg_iric_read_real_f('t_output', t_output, ier)
   
    
    end subroutine
    
!======================================================================
!   �v�Z������ݒ肷��
!======================================================================
    subroutine set_calc_conditions
    
!----------------------------------------------------------------------
!   ����
!----------------------------------------------------------------------
    it_start =  int(t_start / dt)
    it_end   =  int(t_end / dt)
    it_output = int(t_output / dt)
    
    
    
    
    end subroutine
    
!======================================================================
!   ����������ݒ肷��
!======================================================================
    subroutine set_initial_conditions
    
    allocate (vx(ni, nj), vy(ni, nj))
    allocate (hh(ni-1, nj-1), hs(ni-1, nj-1))
    
    
    
   
    
    
    end subroutine    
    
!======================================================================
!   �v�Z������ݒ肷��
!======================================================================
    subroutine set_conditions
    
    !CGNS�t�@�C����ǂݍ���
    call read_cgns()
    
    !�v�Z������ݒ肷��
    call set_calc_conditions()
    
    !����������ݒ肷��
    call set_initial_conditions()
    
    end subroutine
    
    end module