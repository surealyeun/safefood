package com.ssafy.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class userfood {
	private String date, mealtime, id, name;
	private int code, quantity;
	
	protected double supportpereat;
	/**일회 제공되는 칼로기*/
	protected double calory;
	/**일회 제공되는 탄수화물*/
	protected double carbo;
	/**일회 제공되는 단백질*/
	protected double protein;
	/**일회 제공되는 지방*/
	protected double fat;
	/**일회 제공되는 당류*/
	protected double sugar;
	/**일회 제공되는 나트륨*/
	protected double natrium;
	/**일회 제공되는 콜레스테롤*/
	protected double chole;
	/**일회 제공되는 포화지방산*/
	protected double fattyacid;
	/**일회 제공되는 트렌스지방*/
	protected double transfat;
}
