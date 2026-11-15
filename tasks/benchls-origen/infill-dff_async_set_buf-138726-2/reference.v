module origen_138726 (
    VPWR ,
    VGND ,
    Q    ,
    Q_N  ,
    CLK  ,
    D    ,
    SET_B
);

    // Module ports
    input  VPWR ;
    input  VGND ;
    output Q    ;
    output Q_N  ;
    input  CLK  ;
    input  D    ;
    input  SET_B;

    // Local signals
    reg   buf_Q        ;
    wire  SET          ;
    wire  D_delayed    ;
    wire  SET_B_delayed;
    wire  CLK_delayed  ;
    wire  awake        ;
    wire  cond0        ;
    wire  cond1        ;

    // Asynchronous set logic
    not                             not0            (SET   , SET_B_delayed                                    );
    
    // D flip-flop with asynchronous set
    always @(posedge CLK_delayed or negedge SET_B_delayed) begin
        if (!SET_B_delayed)
            buf_Q <= 1'b1;
        else
            buf_Q <= D_delayed;
    end
    
    // Power-on reset condition
    assign awake = (VPWR === 1'b1);
    
    // Delayed signal conditions
    assign D_delayed = D;
    assign SET_B_delayed = SET_B;
    assign CLK_delayed = CLK;
    
    // Set condition checks
    assign cond0 = (SET_B_delayed === 1'b1);
    assign cond1 = (SET_B === 1'b1);
    
    // Output assignments
    buf                             buf0            (Q     , buf_Q                                            );
    not                             not1            (Q_N   , buf_Q                                            );

endmodule