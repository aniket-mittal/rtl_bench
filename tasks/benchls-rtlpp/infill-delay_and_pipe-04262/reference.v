module rtlpp_04262 (
	reset,
	clock,
	Din,
	Dout
);
    input 	reset;
    input 	clock;
    input 	Din;
    output 	Dout;

    wire gnd;
    wire vcc;
    wire unknown;

    assign gnd = 1'b0;
    assign vcc = 1'b1;
    assign unknown = 1'bx;

    reg fstate_state2_regout;
    reg fstate_state3_regout;
    wire Dout_combout;

    always @(posedge clock or posedge reset) begin
        if (reset)
            fstate_state2_regout <= 1'b0;
        else
            fstate_state2_regout <= Din;
    end

    always @(posedge clock or posedge reset) begin
        if (reset)
            fstate_state3_regout <= 1'b0;
        else
            fstate_state3_regout <= Din & fstate_state2_regout;
    end

    assign Dout_combout = fstate_state3_regout & ~reset;

    assign Dout = Dout_combout;

endmodule