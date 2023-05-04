package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ItemSearch {

    private String price_min;
    private String price_max;
    private String name;

}
