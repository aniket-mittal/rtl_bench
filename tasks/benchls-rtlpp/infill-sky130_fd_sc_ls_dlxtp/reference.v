module sky130_fd_sc_ls__dlxtp (
    Q   ,
    D   ,
    GATE
);

    output Q   ;
    input  D   ;
    input  GATE;

    reg Q_reg;
    assign Q = Q_reg;

    // Implementing basic latching logic without external power pins
    always @ (posedge GATE) begin
        Q_reg <= D;
    end

endmodule