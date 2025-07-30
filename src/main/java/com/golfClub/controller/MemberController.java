package com.golfClub.controller;

import com.golfClub.model.Member;

import com.golfClub.service.MemberService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/members")
public class MemberController {
    private final MemberService memberService;

    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping
    public List<Member> getAllMembers() {
        return memberService.getAllMembers();
    }

    @PostMapping
    public Member createMember(@RequestBody Member member) {
        return memberService.saveMember(member);
    }

    @GetMapping("/search")
    public List<Member> searchByNameOrPhone(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String phone
    ) {
        if (name != null) return memberService.searchByName(name);
        if (phone != null) return memberService.searchByPhone(phone);
        return memberService.getAllMembers();
    }
}
