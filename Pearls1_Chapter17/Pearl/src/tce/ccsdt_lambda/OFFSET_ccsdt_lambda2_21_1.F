      SUBROUTINE OFFSET_ccsdt_lambda2_21_1(l_a_offset,k_a_offset,size)
C     $Id: OFFSET_ccsdt_lambda2_21_1.F 19706 2010-10-29 17:52:31Z d3y133 $
C     This is a Fortran77 program generated by Tensor Contraction Engine v.1.0
C     Copyright (c) Battelle & Pacific Northwest National Laboratory (2002)
C     i1 ( h3 p6 p1 p9 )_yt
      IMPLICIT NONE
#include "global.fh"
#include "mafdecls.fh"
#include "sym.fh"
#include "errquit.fh"
#include "tce.fh"
      INTEGER l_a_offset
      INTEGER k_a_offset
      INTEGER size
      INTEGER length
      INTEGER addr
      INTEGER h3b
      INTEGER p6b
      INTEGER p1b
      INTEGER p9b
      length = 0
      DO h3b = 1,noab
      DO p6b = noab+1,noab+nvab
      DO p1b = noab+1,noab+nvab
      DO p9b = noab+1,noab+nvab
      IF (int_mb(k_spin+h3b-1)+int_mb(k_spin+p6b-1) .eq. int_mb(k_spin+p
     &1b-1)+int_mb(k_spin+p9b-1)) THEN
      IF (ieor(int_mb(k_sym+h3b-1),ieor(int_mb(k_sym+p6b-1),ieor(int_mb(
     &k_sym+p1b-1),int_mb(k_sym+p9b-1)))) .eq. ieor(irrep_y,irrep_t)) TH
     &EN
      IF ((.not.restricted).or.(int_mb(k_spin+h3b-1)+int_mb(k_spin+p6b-1
     &)+int_mb(k_spin+p1b-1)+int_mb(k_spin+p9b-1).ne.8)) THEN
      length = length + 1
      END IF
      END IF
      END IF
      END DO
      END DO
      END DO
      END DO
      IF (.not.MA_PUSH_GET(mt_int,2*length+1,'noname',l_a_offset,k_a_off
     &set)) CALL ERRQUIT('ccsdt_lambda2_21_1',0,MA_ERR)
      int_mb(k_a_offset) = length
      addr = 0
      size = 0
      DO h3b = 1,noab
      DO p6b = noab+1,noab+nvab
      DO p1b = noab+1,noab+nvab
      DO p9b = noab+1,noab+nvab
      IF (int_mb(k_spin+h3b-1)+int_mb(k_spin+p6b-1) .eq. int_mb(k_spin+p
     &1b-1)+int_mb(k_spin+p9b-1)) THEN
      IF (ieor(int_mb(k_sym+h3b-1),ieor(int_mb(k_sym+p6b-1),ieor(int_mb(
     &k_sym+p1b-1),int_mb(k_sym+p9b-1)))) .eq. ieor(irrep_y,irrep_t)) TH
     &EN
      IF ((.not.restricted).or.(int_mb(k_spin+h3b-1)+int_mb(k_spin+p6b-1
     &)+int_mb(k_spin+p1b-1)+int_mb(k_spin+p9b-1).ne.8)) THEN
      addr = addr + 1
      int_mb(k_a_offset+addr) = p9b - noab - 1 + nvab * (p1b - noab - 1 
     &+ nvab * (p6b - noab - 1 + nvab * (h3b - 1)))
      int_mb(k_a_offset+length+addr) = size
      size = size + int_mb(k_range+h3b-1) * int_mb(k_range+p6b-1) * int_
     &mb(k_range+p1b-1) * int_mb(k_range+p9b-1)
      END IF
      END IF
      END IF
      END DO
      END DO
      END DO
      END DO
      RETURN
      END
