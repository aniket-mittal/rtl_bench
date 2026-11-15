module origen_157665 #(
    parameter TOP0_0 = 16,
    parameter LDD0_0 = 16
)(
    input clk200,
    input rst,
    input [TOP0_0-1:0] cap_wdis,
    input [LDD0_0-1:0] cap_plus,
    input cap_trig,
    output reg capr_rdy,
    output [TOP0_0-1:0] wdis
);

reg [TOP0_0-1:0] t_wdis;
reg [LDD0_0-1:0] cap_plus_cnt;
reg cap_plus_en;

localparam S_OFF = 1'b0, S_ON = 1'b1;
reg state;

always @(posedge clk200 or posedge rst) begin
    if (rst) begin
        state <= S_OFF;
        capr_rdy <= 1'b0;
        t_wdis <= {TOP0_0{1'b0}};
        cap_plus_cnt <= {LDD0_0{1'b0}};
        cap_plus_en <= 1'b0;
    end else begin
        case (state)
            S_OFF: begin
                if (cap_trig) begin
                    state <= S_ON;
                    t_wdis <= cap_wdis;
                    cap_plus_cnt <= cap_plus;
                    cap_plus_en <= (cap_plus != {LDD0_0{1'b0}});
                end
                capr_rdy <= 1'b0;
            end
            S_ON: begin
                if (cap_plus_cnt == 1 || !cap_plus_en) begin
                    state <= S_OFF;
                    capr_rdy <= 1'b1;
                    t_wdis <= {TOP0_0{1'b0}};
                end else begin
                    cap_plus_cnt <= cap_plus_cnt - 1;
                end
            end
        endcase
    end
end

assign wdis = t_wdis;

endmodule