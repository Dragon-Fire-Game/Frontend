package com.dragong.dragong.domain.member.service;


import com.dragong.dragong.domain.member.dto.request.FcmTokenRequestDto;
import com.dragong.dragong.domain.member.dto.request.LoginRequestDto;
import com.dragong.dragong.domain.member.dto.request.RegistRequestDto;
import com.dragong.dragong.domain.member.dto.request.UpdateRequestDto;
import com.dragong.dragong.domain.member.dto.response.LoginResponseDto;
import com.dragong.dragong.domain.member.dto.response.NicknameUpdateResponseDto;
import com.dragong.dragong.domain.member.entity.Member;
import com.dragong.dragong.domain.member.entity.MemberInfo;
import com.dragong.dragong.domain.member.entity.SocialType;
import jakarta.servlet.http.HttpServletResponse;

public interface MemberService {

    void regist(RegistRequestDto registRequestDto, SocialType socialType,
            HttpServletResponse httpServletResponse);

    LoginResponseDto login(LoginRequestDto loginRequestDto,
            HttpServletResponse httpServletResponse);

    NicknameUpdateResponseDto update(UpdateRequestDto updateRequestDto, String accessToken, String refreshToken,
            HttpServletResponse httpServletResponse);

    void nicknameCheck(String nickname);

    void logout(String accessToken, String refreshToken, HttpServletResponse httpServletResponse);

    void delete(String accessToken, String refreshToken, HttpServletResponse httpServletResponse);

    MemberInfo getMyMemberInfo(String accessToken, String refreshToken,
            HttpServletResponse httpServletResponse);

    Member getMyMember(String accessToken, String refreshToken,
            HttpServletResponse httpServletResponse);

    void updateFcmToken(String accessToken, String refreshToken, FcmTokenRequestDto fcmTokenRequestDto);

}
