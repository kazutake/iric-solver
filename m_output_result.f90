!**********************************************************************
!
!   �v�Z���ʏo�̓��W���[��
!
!**********************************************************************
    module m_output_result    
    
    use m_const
    use m_global
    
    contains
        
!======================================================================
!   �v�Z���ʂ̏o�̓��[�`��
!======================================================================
    subroutine output_result(htime)
    
    real(8) :: htime
    
    
    call cg_iric_write_sol_time_f(htime*HOUR_SEC, ier)
    
    
    call cg_iric_write_sol_baseiterative_real_f('Discharge(m3s-1)', qq, ier)
    
    call cg_iric_write_sol_gridcoord2d_f(xx,yy,ier)
    call cg_iric_write_sol_cell_real_f("Elevation(m)", zb, ier)
    
    call cg_iric_write_sol_real_f("VV(ms-1)X", vx,ier)
    call cg_iric_write_sol_real_f("VV(ms-1)Y", vy,ier)
    
    call cg_iric_write_sol_cell_real_f("Depth(m)", hs,ier)
    call cg_iric_write_sol_cell_real_f("WaterSurface(m)", hh, ier)
    

    end subroutine
    
    end module