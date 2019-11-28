package com.ssafy.help;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoolResult{
    // 행동 이름
	private String name;
	// 값
	private boolean count;
	// 상태
	private String state;
		
}
