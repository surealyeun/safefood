	package com.ssafy.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/** 식품 정보 */
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
public class Food {
	/**식품을 구별하는 코드 */
	protected int code;
	/**식품 이름*/
	protected String name;
	/**일회 제공 량*/
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
	/**제조사*/
	protected String maker;
	/**원료*/
	protected String material;
	/**이미지 경로*/
	protected String img;
	protected String allergy;
	protected int total;
	
	public Food(int code) {
		super();
		this.code = code;
	}
	
}
