//package com.example.binatur_db.dtos;
//
//import jakarta.validation.constraints.NotBlank;
//import jakarta.validation.constraints.NotNull;
//
//import java.math.BigDecimal;
//
////public record ClientRecordDto(@NotBlank String name, @NotNull BigDecimal value) {
////}
//
//public record ClientRecordDto(@NotBlank String name, @NotNull String cpf) {
//}


package com.example.binatur_db.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record ClientRecordDto(@NotBlank String name, @NotNull String cpf) {
}
