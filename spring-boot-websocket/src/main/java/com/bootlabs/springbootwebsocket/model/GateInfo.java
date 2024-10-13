package com.bootlabs.springbootwebsocket.model;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
public class GateInfo {

    @NotNull
    private String gateId;

    @NotNull
    private String gateNumber;

    private String airline;

    @NotNull
    private String flightNumber;

    private String destination;

    @NotNull
    private LocalDateTime scheduledDate;

    @NotNull
    private GateStatus status;
}
