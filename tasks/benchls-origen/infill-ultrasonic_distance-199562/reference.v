module origen_199562(
    input clk_1m,
    input rst,
    input echo,
    output [19:0] dis_count
);

reg [1:0] curr_state, next_state;
reg [19:0] count, dis_reg;
reg echo_reg1, echo_reg2;
wire start, finish;

always @(posedge clk_1m, negedge rst) begin
    if (!rst) begin
        curr_state <= 2'b00;
        count <= 20'b0;
        dis_reg <= 20'b0;
        echo_reg1 <= 1'b0;
        echo_reg2 <= 1'b0;
    end
    else begin
        curr_state <= next_state;
        echo_reg1 <= echo;
        echo_reg2 <= echo_reg1;
        case (curr_state)
            2'b00: begin // S0 (Idle)
                count <= 20'b0;
                dis_reg <= 20'b0;
            end
            2'b01: begin // S1 (Counting)
                count <= count + 20'b1;
            end
            2'b10: begin // S2 (Storing)
                dis_reg <= count;
                count <= 20'b0;
            end
        endcase
    end
end

assign start = ~echo_reg1 & echo_reg2;
assign finish = echo_reg1 & ~echo_reg2;

always @(*) begin
    case (curr_state)
        2'b00: next_state = start ? 2'b01 : 2'b00; // S0 -> S1 on start, else S0
        2'b01: next_state = finish ? 2'b10 : 2'b01; // S1 -> S2 on finish, else S1
        2'b10: next_state = 2'b00; // S2 -> S0
        default: next_state = 2'b00;
    endcase
end

assign dis_count = (dis_reg * 17) / 10;

endmodule