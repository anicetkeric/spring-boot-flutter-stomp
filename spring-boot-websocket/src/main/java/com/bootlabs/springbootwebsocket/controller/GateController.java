package com.bootlabs.springbootwebsocket.controller;

import com.bootlabs.springbootwebsocket.model.GateInfo;
import com.bootlabs.springbootwebsocket.service.GateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@CrossOrigin
@RequestMapping(path = "/gate")
public class GateController {

    private final GateService gateService;

    public GateController(GateService gateService) {
        this.gateService = gateService;
    }

    @PutMapping("/call")
    public ResponseEntity<Void> replaceEmployee(@RequestBody GateInfo gateInfo) {
        gateService.updateGateInfo(gateInfo);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
