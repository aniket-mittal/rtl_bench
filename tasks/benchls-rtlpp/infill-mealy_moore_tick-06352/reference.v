module rtlpp_06352 (
    clk,
    reset,
    level,
    Mealy_tick,
    Moore_tick
);
input   clk;
input   reset;
input   level;
output  Mealy_tick;
output  Moore_tick;

wire gnd;
wire vcc;
wire unknown;
reg  stateMealy_reg;
reg  stateMoore_reg;

assign gnd = 1'b0;
assign vcc = 1'b1;
assign unknown = 1'bx;

assign Mealy_tick = (!level && !stateMealy_reg) ? 1'b1 : 1'b0;
assign Moore_tick = stateMoore_reg;

// StateMealy logic
always @(posedge clk or negedge reset) begin
    if (!reset) begin
        stateMealy_reg <= 1'b0;
    end else begin
        stateMealy_reg <= !level;
    end
end

// StateMoore logic
always @(posedge clk or negedge reset) begin
    if (!reset) begin
        stateMoore_reg <= 1'b0;
    end else begin
        stateMoore_reg <= Mealy_tick;
    end
end

endmodule